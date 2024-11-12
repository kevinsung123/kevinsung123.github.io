---  
title: "[DE] BigQuery Interview Questions"  
date : 2024-11-12 21:00:00
categories: [Gcp,Bigquery]
tags: [gcp,bigquery,interview]
comments: true
pin: true
math: true
mermaid: true
---  



## BigQuery Interview Questions

### Easy
#### Q) What is Bigquery and What is the purpose of using Bigquery ?
#### A)
- 정의
 - GCP에서 제공하는 완전관리형  서버리스 DW이자 분석 플랫폼 
 - 대규모 데이터분석 그리고 처리를 다룰 수 있는 분산 아키텍처를 사용하여 대량의 데이터를 다루는 기업 및 조직에 적합하게 설계
- BigQuery 사용 목적 
 - 비즈니스 인텔리전스(Businees Intelligence) : 고객 행동, 시장 트렌드, 운영 효율성등 사업데이터를 분석하여 통찰력을 얻음
 - 데이터 사이언스(Data science) : 머신 러닝, 인공지능 등 대규모 데이터세를 저장하고 분석 가능
 - 보고서 작성 : 판매실적, 마케팅 캠페인 성과, 웹사이트 트래픽등 다양한 데이터에대한 보고서 생성 가능 
 - Ad-hoc 분석 : ad-hoc 분석에 사용 
 - 대규모 및 복잡한 데이터셋에서 확장 가능하고 비용 효율적으로 데이터 분석을 수행해야하는 데이터 분석가, 데이터 과학자 및 비즈니스 인텔리전스 전문가들에게 강력한 도구로 작용


#### Q) What is the Architecture of Bigquery?
#### A) 
BigQuery 아키텍처는 대용량 데이터 처리 그리고 분석을 효율적으로 하기 위해 설계. 
아키텍처는 분산 컴퓨팅 모델에 토대로 하며, 수평적으로 확장하고 병렬적으로 대용량 데이터 처리 하도록 설계 다음은 주요 특징 
1. Dremel-inspired Execution Enginer
- BQ 실행엔진은 Google에서 개발한 고도로 확장 가능하고, 대화형 쿼리 시스템인 Dremel논문에서 영감을  얻음. 이 엔진은 분산데이터에서 SQL과 유사한 쿼리를 병렬로 실행 가능
2. 데이터 저장과 처리 분리 
- 빅쿼리는 데이터 저장과 처리를 분리해 각각 독립적으로 확장할 수 있게 해줍니다.데이터(테이블)는 페타바이트 규모의 분산 저장소에 저장되고, 쿼리 요구에 따라 계산 자원이 동적으로 할당됩니다. 이는 쿼리 처리에만 필요한 리소스만 사용하여 비용을 최적화할 수 있음을 의미합니다.
3. Columnar 저장
- BQ는 데이터를 행이 아닌 열기반 형식으로 저장. 쿼리 실행  중 특정 열으 효율적으로 압축하고 검색하도록 가능. 이 방식은 열만 엑세스하기때문에 `데이터 이동 및 처리 오버헤드를 최소화`하여 쿼리 성능을 크게 향상 
4. 분산 처리 
- 분산처리 아키텍처를 사용. 쿼리는 더 작은 작업으로 분해되어 수백/수천개의 작업노드에 이동시켜 분산
이 병렬화를 통해 대규모 데이터셋에 대해서 효율적으로 처리 
5. 공유없는 아키텍처
- 개별작업 노드는 데이터나 처리 상태를 공유하징낳음. 이는 병목현상(bottle-neck)을 제거하고 fault-tolerance를 높여서 고가용성(HA) 그리고 성능을 높임 (노드가 오류가  발생해도)
6. petabyte규모 네트워크
- 저장장치와 계산 자원 간의 빠른 데이터 이동을 위해 전용 페타비트 규모 네트워크 보유. (데이터 전송 지연을 최소화하고 쿼리 실행속도 유지)
7. 리소스 관리
- 쿼리 작업 부하에 따라 리소스 할당을 자동으로 관리. 복잡한 쿼리를 처리하기 위해 추가 노드를 spin-up하고 유휴시간에는 축소하여 리소스 활용도와 비용 효율성을 최적화
#### 추가 특징
- 서버리스
- 표준 SQL을 지원하여 많은 사용에게 친수하고 접근성 좋음
- GCP다른 서비스와 원할하게 통합

#### Q) What are the different types of file format supported in Bigquery?
#### A)
- 텍스트 기반 
 - csv : 쉼표로 가진 텍스트 파일
 - json : key-value 쌍을 사용하여 구조화된 데이터 표현
 - avro : 효율적인 데이터 저장과 빠른 직렬화/역직렬화 지원하는 이진 데이터형식
 - parquet : 컬럼 기반 저장 방식을 사용하는 이진 형식. 압축과 효율적인 쿼리 성능에 유리
 - orc : parquet과 유사한 컬럼 기반 이진 형식
- 압축 형식
 - gzip, bzip2
- 기타
 - google sheet
- 파일 업로드시 유의 사항
 - utf-8또는 ISO-8859-1 encoding으로 저장
 - 크기 5TB넘을 수 없음
 - 유효하지 안흐 데이터가 포함되어 있지 않아야함
- 올바른 파일형식 선택
 - 데이터 구조와 크기를 고려
 - 압축률과 성능 요구사항 평가
 - BQ지원 기능여부를 확인


#### Q) What is Materialized and Generic views in Bigquery and What is the use of both of them?
#### A)
- 조회 및 분석을 위한 가상테이블을 나타내는 2가지 유형의 뷰
- materialized view 
 - 정의 : 미리계산된 결과를 저장하는 가상 테이블. 원본 데이터의 쿼리 결과를 물리적으로 저장
 - 목적 
    - 성능향상 : 미리 게산된 결과를 제공함으로써 쿼리 성능향상
    - 복잡한 계산 최적화 : 복잡한 집계 및 계산 수행 시 미리 결과 저장 및 다시 계산하지 않아도 됨
- generic
 - 정의 : 실시간으로 계산되는 뷰로. 물리적으로 데이터를 저장하지 않고 쿼리 실행 시 마다 원본 데이터를 기반으로 함 
 - 목적 
  - 실시간 업데이트 : 자주 변경되는 데이터인 경우 유용
  - 저장 공간 절약 : 물리적으로 결과 저장하지 않기 때문에 저장공간 절약
  - 유연성 : 쿼리 실행될 때마다 최신 데이터 반영
- materialized는 성능 향상과 미리 계산된 결과를 활용하여 복잡한 계산을 최적화 
- generic은 실시간 업데이트 및 저장공간 절약 유연성을 제공 
- 데이터 특성, 쿼리 패턴, 성능 및 요구사항에 따라 다름


#### Q) What are the Optimization techniques in Bigquery?
#### A)
1. partitioned table 
- 테이블을 일정한 기준에 따라 파티션으로 분할하면 쿼리성능이 향상. 일반적으로 날자 또는 시간 
2. 데이터 스키마 최적화
- 적절한 데이터 유형 사용 : 정수,문자열, 날짜/시간등 올바른 데이터 유형으로 데이터 정의 하면 저장 공간과 처리  효율성을 높임
- 정규화된 스키마 유지 : 중복  최소, 관계를 명확히하여 복잡성 줄이고 성능향상
- 열구조 활용 : 빈번하게 조회는 열들을 함께 그룹화하여 쿼리 성능 개선
3. clustering
- 테이블을 특정 열을 기준으로 정렬하여 저장. 성능 향상 및 비용줄임
4. 최적화된 sql 쿼리
- 필터를 적극 활용: 불필요한 데이터를 걸러내어 쿼리 실행 범위를 제한하여 성능을 높입니다.
- 정렬 순서 활용: 쿼리 결과 정렬에 영향을 미치는 열을 명확하게 지정하여 정렬 비용을 최소화합니다.
- WITH 절 사용: 중간 결과값을 저장하여 같은 값을 반복 계산하지 않고 쿼리 성능을 개선할 수 있습니다.
5. external table 
- 외부데이터를 쿼리 시 외부 테이블을 상요. 물리적으로 로드하지 않고 쿼리 실행
6. materialized view 사용
- 미리 게산된 결과를 저장된 view 사용하여 쿼리 성능 향상
```
올바른 데이터 스미카설게, 효과적인 파티셔닝 및 클러스팅, 쿼리 최적화 등 다양한 기술을 결합하여 최적화 가능
```

#### Q) What are the different ways of loading data in Bigquery Table OR How to Ingest data into BigQuery?
#### A)
- 직접 데이터 로드 : console, bq-cli
- cloud storage에서 로드 : console, bq-cli
- streaming 데엍 연계 : bigquery api, client 라이브러리
- data transfer srvice : 콘솔에서 사용
- app integration : pub/sub 통합
- third partyy etl
    - apache beam/data flow
    - talend, informatica
- 데이터 크기, 형식, 주기 및 실시간성을 고려하여 

#### Q) What is the difference between Row level and columnar base Datawarehouse and What do you understand by them?
#### A)
##### Row-Based Data Warehouse
- 정의: 행 기반 데이터 웨어하우스는 행 단위로 데이터를 저장하는 방식입니다. 각 행은 레코드 또는 튜플을 나타내며, 이러한 방식은 OLTP(On-Line Transaction Processing) 시스템에서 자주 사용됩니다.

- 특징:
    - 트랜잭션 처리에 최적화되어 있어서 적은 수의 레코드에 대한 조회 및 갱신이 빠릅니다.
    - 특정 행에 대한 읽기 및 쓰기 작업이 빠르게 수행됩니다.
    - 행에 대한 쿼리와 갱신이 주요 작업입니다.
    - 주로 OLTP 환경에서 사용됩니다.


##### 열 기반 데이터 웨어하우스 (Columnar-Based Data Warehouse):
- 정의: 열 기반 데이터 웨어하우스는 열 단위로 데이터를 저장하는 방식입니다. 각 열은 특정 속성을 나타내며, 이러한 방식은 OLAP(On-Line Analytical Processing) 시스템에서 사용됩니다.

- 특징:
    - 집계 및 분석 작업에 최적화되어 있어서 대량의 데이터에 대한 질의와 집계가 빠릅니다.
    - 특정 열에 대한 읽기 작업이 빠르게 수행됩니다.
    - 행에 대한 쿼리보다는 열에 대한 질의가 주요 작업입니다.
    - 주로 OLAP 환경에서 사용되며, 데이터 웨어하우스 및 데이터 마트에서 흔히 사용됩니다.
#### Q) What is the Difference between Teradata and Bigquery?
#### A)
- 아키텍처:
    - Teradata: Teradata는 대표적인 MPP(Massively Parallel Processing) 데이터베이스 시스템으로, 고성능 병렬 처리를 위한 고도로 확장 가능한 아키텍처를 가지고 있습니다. 다수의 노드로 구성되며, 데이터 분산 및 병렬 처리가 중요한 특징입니다.
    - BigQuery: BigQuery는 서버리스 기반의 클라우드 데이터 웨어하우스로, 구글 클라우드 플랫폼 상에서 제공됩니다. 높은 확장성과 처리 능력을 갖추고 있으며, 분산 컴퓨팅을 통해 대용량 데이터를 처리합니다.
- 데이터 저장 형식:
    - Teradata: Teradata는 주로 행 기반의 저장 형식을 사용합니다. 행 단위로 데이터가 저장되며, 트랜잭션 처리와 실시간 응답에 적합합니다.
    - BigQuery: BigQuery는 열 지향(Columnar) 저장 형식을 사용합니다. 이는 대량의 데이터에 대한 분석과 집계 작업을 효과적으로 처리하는 데 특화되어 있습니다.
- 비용 모델:
    - Teradata: 전통적인 라이센스 모델을 사용하는 경우가 많으며, 초기 투자 비용 및 유지 보수 비용이 발생합니다.
    - BigQuery: BigQuery는 서버리스 및 pay-as-you-go 모델을 채택하고 있습니다. 필요한 만큼의 리소스를 사용하여 비용을 지불하므로 초기 투자가 적고 유연한 비용 구조를 가지고 있습니다.

- 보안 및 인증:
    - Teradata: Teradata는 엔터프라이즈급 보안 및 인증 기능을 갖추고 있습니다. 엄격한 보안 요구 사항을 충족시키는 데 중점을 둡니다.
    - BigQuery: BigQuery는 Google Cloud의 보안 인프라를 기반으로 하며, IAM(Identity and Access Management)과 같은 클라우드 플랫폼의 보안 기능을 활용합니다.

- 스케일링 및 성능:
    - Teradata: Teradata는 MPP 아키텍처를 활용하여 수평 및 수직 확장이 가능하며, 대규모 데이터에 대한 처리 능력이 높습니다.
    - BigQuery: BigQuery는 클라우드 기반의 서버리스 아키텍처를 활용하여 신속한 스케일링이 가능하며, 대용량 데이터 처리에 특화되어 있습니다.
- 생태계 및 통합:
    - Teradata: Teradata는 오랜 기간동안 사용되어 온 데이터 웨어하우스 솔루션으로, 다양한 기업에서 사용되고 있습니다.
    - BigQuery: BigQuery는 Google Cloud 플랫폼의 일부이며, 다양한 Google Cloud 서비스 및 도구와의 통합이 용이합니다.


### 참고
- ![medium](https://medium.com/@dikshachourasiyadiksha/bigquery-interview-questions-6adc887ee217)
