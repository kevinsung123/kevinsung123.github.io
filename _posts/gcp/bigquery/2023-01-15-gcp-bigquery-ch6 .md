---  
layout: post  
title: "[BigQuery]Chatper 6. Architecture of BigQuery"  
subtitle: "[Chatper 1. What is Google BigQuery(The Definite Guide)"  
categories: gcp
tags: bigquery work 
comments: true  
---  


## Chatper 6. Architecture of BigQuery

<!--more-->

---
### High Level Architecture
- Bigquery 수십만개의 실행task의 상호연결된 마이크로 서비스로 이루어진 대규모 분산시스템이다 



### Life of a Query Reqeust
- BigQuery가 결합되는 방식을 위해 query를 요청할때 어떤일이 일어나는지 살펴보자

![Figure 6.1](\assets\img\bigquery\2020-04-20-envops-blog-how-to-register-google-adsense-1.png)
#### STEP 1. HTTP POST
- client는 HTTP POST 요청을 BigQuery endpoint에 요청 
- 보통 이 요청은 라이브러리 혹은 JDBC(Java Database Connectivity 드라이버)로 구성되지만, 기본적으로 누구든지 `curl` 또는 다른 tool로 raw HTTP request 보낼 수 이다
```
Here is what the query request looks like on the wire:
POST /bigquery/v2/projects/bigquery-e2e/jobs HTTP/1.1
User-Agent: curl/7.30.0
Host: www.googleapis.com
Accept: */*
Authorization: Bearer <redacted>
Content-Type: application/json
Content-Length: 126
{'configuration': {'query': {'query': 'SELECT 17'}}}
```
    1. HTTP vereb는 POST
    2. Authorization Token : OAuth2 token으로 식별
    3. JSON Payload : 실행시키려는 쿼리가 포함
![Figure 6.1](\assets\img\bigquery\figure6-2.png)

#### STEP2. Rounting 
- HTTP POST요청은 REST endpoint (http://www.googleapis.com/bigquery/v2/projects/bigquery-e2e/jobs) 라우팅 된다.
- 위의 endpoint는 GFE(Google Front End Server)서버이다(Google Search 또는 Product와 같은 서비스)
- 어떤 region에서 요청되는지 어떻게 알 수 있을까?
    - url의 일부는 어떤 cloud project인지 가르킴
    - 특정 지역의 reservation이 있다면 그 request는 그쪽으로 전달
    - reservation이나 특정 region이 없다면  --> router는 query를 parsing한다. (데이터셋이 어디서 포함되는 확인 하기 위해 )
    - performance에 의심이 가거나 output결과의 위치를 제어하고 싶다면, 특정 region을 지정하는게 낫다
- router는 JSON HTTP requests를 Protocol Buffers(모든 구글 서비스들간 커뮤니케이션하기위해 platform 그리고 language neutral serialization format)로 변환 한다.

#### STEP3. Job Server
- Bigquery Job Server는 request의 상태를 추적하며 담당
- client와 BigQuery 서버는 fallible상태를 고려 그리고 query는 수분 수시간 걸릴 수 있으므로, 비동기적으로 작동으로 하도록 디자인되었다
- caller가 query를 실행하는데 허요되었는지 확인하기 위해 authorization를 수행
- 각 프로젝트는 기본적으로 primary그리고 secondary 가용가능존이 있음. primary zone이 가용 불가능하면, secondary로 routing을 함

#### Projects and Data Rebalnacing
```
BigQuery는 동일한 region에 있는 2개의 테이블은 사용자는 두 테이블에 모두 엑세스 가능
이것은 Backend에 challenge를 제공. 2개의 테이블은 동일한 물리적 위치에 있지않으채로 쿼리를 시랭하면 많은데이터를 이동해야하므로 느리고 비용이 많이듬. BigQuery는 Backend에서 복작한 최적화 문제를 지속저긍로 해결

Rebalancer가 프로젝트를 이동해야한다면 결정하면 복제를 시작. 데이터를 다른 가용영역으로 전송. 이러한 방식으로 데이터는 항상 결합 가능함. 용량이 한정된 cluster는 용량이 크게 증가하더라도 공간이 부족핮 ㅣ않음
```

#### STEP4. Query Engine
- Query실행은 나중에 section 다룸
- Query들은 Query master(모든 쿼리실행을 담당)로 routing 
- Query 마스터는 metadata서버와 연결
    1. physical 데이터가 어디있는지
    2. 어떻게 파티셔닝 되어있는지
- Query마스터가 얼마나 데이터각 포함되었는지 알고 예비쿼리 계획을 세울 수 있는 기회가 있으면, 스케줄러에게 slot을 요청한다 
- slot은 쿼리 작업자 샤드의 실행 스레드이다. ( 1slot = 0.5cpu, 1GB RAM)
- query를 수행 할 수 있는 샤드의 주소를 리턴 받음
- Query마스터는 쿼리요청을 각 Dremel 샤드에게 병렬적으로 욫어 함.

#### STEP5. Returning the query results
- Query워커 샤드가 쿼리실행을 완료하면, 결과를 2개의 부분에 나누어서 저장
- Spanner(분산 RDBS)- 쿼리와 쿼리메타데이터 저장, 쿼리 실행하는 같은 region에 위치
- Colosuss (구글 분산 파일시스템) 
- BigQuery 결과는 24시간 동안 저아 
- 결과는 일반적은 Select 쿼리는 10GB까지 제한
- 그 이상의 결과르 저장하기 위해서는 CTAS(Create table as select) 또는 INSERT 구문으로 저장해야함( 용량 제한 없음 )


### BigQuery Upgrades
- BigQuery는 downtime없이 업그레이드 가능
- 1주일에 한번식 일어남
- BigQuery는 실패하는 쿼리없이 업그레이드 가능
    - 업그레이드를 위해 shard의 일부를 drain이후 진행 
- Query마스터는 쿼리 실행 완료 후 업그레이드 가능 (Query마스터 실패는 query 재수행을 일으킴)
- Job서버는 상대적으로 더 쉽게 업그레이드 가능 (그들의 상태는 Spanner에 저장되기 때문 재수행 시 그 상태값을 가져옴)
- Router는 거의 상태가 없기때문에 거의 마음대로 업그레이드 가능
- 스케줄러는 Dremel 클러스터당 하느이 master를 가지고 있기때문에, standby먼저 업그레이드 이후 failover 모드로 변환

### Query Engine (Dremel)
- Dremel는 2006년 MapReduce작업을 기다리는데 싫증난 엔지니어가 만듬
- Google임직원 직간적접으로 80%이상이 사용할정도로 인기
- 초창기의 Dremel topology는 `tree구조`이다
- Query들은 root로 진입하고, 가지치기 이후 leaves(query의 일부를 실행)에 도달
- 결과 그리고 취합이 root까지 거슬러 올라감 
- 2010년 Dremel 아키텍처는 single static topoloy를 가지는것보다 실행계획를 dynamic하게 수행하는 것으로 변환 
- 현재 Dremel 아키텍처 (Dremel-X,이번 버전이 10번쨰 업그레이드)
- 어떤 level이든지 dynamic query plan을 만들고 변경가능하다(쿼리 실행 중 이더라도)
- execution은 여전히 tree와 같이 보인다, 각 query stage마다 shuffle 단계 떄문에, 어떤 level이든지 추가 가능
![Figure 6.3](\assets\img\bigquery\figure6-3.png)
 
### Dremel Architecture
- 쿼리엔진은 3개의 파트로 구성 : Query마스터, 스케줄러, Worker Shard
- Query 마스터  - query planning을담당 (작업을 어떻게 할지)
- 스케줄러 - slot 할당을 담당 (누가 일이 가능하지 
- 작업자 shard - 실제로 쿼리를 수행 
---

#### Query 마스터
- 

### 참조
- Google BigQuery The Definite Guide p1-p22
- [coursera : bigquery-fast-sql-engine](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/H1irf/bigquery-fast-sql-engine)