---
title: "(1)BigQuery 개요"
date : 2025-01-03 08:00:00 +0900
categories: [GCP,BigQuery,Architecture]
tags : [gcp,bigquery,architecture]
---



## BigQuery란

<!--more-->

---
BigQuery란 2011년 일반 안정화버전으로 출시되었으며 비지니스 민첩성을 위해 설계된 Google Cloud의 엔터프라이즈 데이터웨어하우스. 서버리스 아키텍를 통해 규모와 속도로 작동하고 대규모 데이터세트에 대해 매우 빠른 SQL분석으로 제공할 수 있음. 표준 SQL 지원등 확장 가능한 분석엔진을 통해 테라바이크급 쿼리를 초 단위 수행 및 페타바이트급 쿼리를 분단위로 쿼리가능. 처음부터 성능, 보안, 안정성을 개선하고 사용자가 인사이트를 더 쉽게 발견 할 수 있도록 수많은 기능과 개선사항이 적용.

### How does a Data Warehouse drive business decisions?

데이터 웨어하우스는 서로 다른 소스의 데이터를 통합하고 집계된 데이터에 대한 분석을 수행하여 통찰력 제고하여 비즈니스 운영에 가치를 추가. 데이터웨어하우스는 지난 20년 도앙ㄴ 기업에서 가장 중요한 비즈니스 데이터의 관리자. Gartner에 따르면 데이터웨어하우스는 종종 기업의 분석 전략의 기반을 형성. 오늘날 기업은 다음을 수행해야함

#### 1. 비지니스에대한 360 view

- 데이터는 가치가 있음
- 스토리지 및 데이터 처리 비용이 감소함에 따라 기업은 조직 내부 및 외부의 모든 관련데이터세트를 처리, 저장 및 분석하기를 원함

#### 2. 실시간 비즈니스 이벤트에 대한 상황 인식 및 대응

- 기업은 데이터 분석을 위해 며칠 또는 몇 주를 기다리지 않고 실시간 이벤트에서 통찰력을 얻어야함. 데이터웨어하우스는 항상 비즈니스의 현재 상태를 반영해야함

#### 3. 인사이트 확보시간 단축

- 기업은 며칠 또는 몇달을 기다리지 않고 빠르게 시작하고 실행

#### 4. 비즈니스 사용자에게 통찰력을 제공하여 기업 전체에서 데이터 기반의 의사결정을 가능하게함

- 데이터 기반 문화를 수용하기 위해 기업은 데이터에 대한 엑세스를 민주화 해야함

#### 5. 데이터 보호 및 사용관리

- 데이터는 기업 내부 및 외부의 올바른 이해 관계자가 안전하게 엑세스 해야함

### 기존 데이터웨어하우스 문제점

- 기업이 증가하는 데이터 볼륨으로 기존 데이터하우스의 사용을 확장하려고 함에 따라 높은 TCO(Total Cost of Ownership)로 인해 비용이 통제 할 수 없이 계속 증가함에 따라 문제점 직면
- 기존 데이터 웨어하우스는 데이터의 폭발적인 증가를 처리하도록 설계되지 않으며 확실히 새로운 데이터 처리 패턴을 위해 구축되지 않음

### BigQuery - Cloud Data Waehouse

- Google BigQUery는 "클라우드 네이티브" 데이터 웨어하우스으로 설계
- 클라우드 우선세계에서 데이터 기반조직의 요구 사항을 해결하기 위해 구축
- 확장성이 뛰어나고 비용 효율적인 서버리스 클라우드 데이터 웨어하우스
- Google 인프라의 처리 능력을 사용하여 페타바이트 규모의 초고속 쿼리를 허용
- 고객이 관리할 인프라가 없기 떄문에 데이터베이스 관리자 없이 친숙한 SQL을 사용하여 의미있는 통찰력 발견하는데 집중
- 처리 및 저장에대해서만 비용을 지불하기때문에 경제적

### Where does BigQuery fit in the data lifecycle?

- BigQuery는 데이터 수집, 처리, 저장, 고급 분석 및 공동작업을 포함한 전체 분석 가치 사슬을 포괄하는 Google Cloud의 포괄적인 데이터 분석 플랫폼의 일부
- BigQuery는 GCP분석 및 데이터 처리 제품과 긴밀하게 통합되어 고객이 엔터프라이즈용 클라우드 기반 데이터 웨어하우스를 설정 하도록 가능
- 데이터 lifecycle의 각단계에서 gcp는 데이터 관리를 위해 여러 서비스를 제공. 고객이 자신의 워크플로우에 맞는 일련의 서비스를 선택 가능

![Figure 1](/assets/img/bigquery/BQ_Explained_1.max-900x900.png)

### Ingestion data into BigQuery

- BigQuery는 데이터를 관리형 스토리지(managed storage)로 수집하는 여러가지 방법을 지원
- 데이터 출처에 따라 다름
  - Cloud logging 및 Google Analytics와같은 GCP 일부 데이터소스는 BigQuery로의 직접 보내기를 지원
  - BigQuery Data Transfer Service를 사용하여 Google Saas앱(Google Ads, Cloud Storage), Amazon S3 및 기타 웨어 하우스 (Teradata, Redshift)에서 BigQuery로 데이터를 전송 가능
  - 로그 또는 IoT 기기 데이터와 같은 스트리밍 데이터는 `Cloud Dataflow 파이프라인,`Cloud DataProc` 작업을 사용하거나 `BigQuery Streaming API`를 직접 사용하여 저장 가능

### **BigQuery Architecture**

- BiQuery의 서버리스 아키텍처는 storage와 computing을 분리하고 필요에 따라 독립적으로 확장 가능
- 이 구조는 값비싼 컴퓨팅 리소스를 항상 가동하고 실행할 필요가 없기 떄문에 고객에게 엄청난 유연성과 비용제어를 제공
- 내부적으로 BigQuery `Dremel, Colossus, Jupiter 및 Borg`와 같은 low-level의 Google 인프라 기술로 구동되는 방대한 다중 테넌드 서비스 집합을 사용
![Figure 2](/assets/img/bigquery/BQ_Explained_3.max-500x500.jpg)

#### **구성요소 (요약)**

- **저장소(Colossus)**
  - **구글의 글로벌 스토리지 시스템**
  - 컬럼기반의 포맷과 압축 알고리즘 이용. 대규모 정형데이터 읽기에 최적화됨
  - Replication, recovery 그리고 분산관리
  - 페타급 데이터를 조회하는데 auto scale 됨
- **쿼리엔진(Dremel)**
  - **구글의 SQL쿼리를 실행하는 대규모 다중 테넌트 클러스터**
  - Dreml은 쿼리를 트리로 변환. 트리의 리프는 slot이라고 하며 저장소에 데이터를 읽고 필요한 계산을 수행
  - 트리의 가지 집계는 **mixer**가 수행
  - 여러 사용자에 동시 쿼리에 대한 공정성을 유지
- **네트워크(Jupiter)**
  - **구글의 저장소와 쿼리엔진은 페타바이트jupiter네트워크를 활용하여 서로 통신**
  - 데이터를 한곳에서 다른곳 으로 매우 빠르게 이동시키는 셔플이 존재
- **오케스트레이션(Borg)**
  - Mixer와 slot은 모두 HW리소스를 할당하는 Borg에 의해 실행

#### Compute는 SQL쿼리를 실행하는 대규모 다중 테넌스 클러스터인 Dremel

- Dremel는 SQL쿼리를 실행 트리로 변환. 트리의 리프는 `slot`이라고 하며 저장소에서 데이터를 읽고 필요한 계산을 수행하는 무거운 작업을 수행. 트리의 branch의 집계를 수행하는 `mixer`
- Dremel은 필요에 따라 `slot`을 쿼리에 동적으로 할당하여 여러 사용자의 동시 쿼리에 대한 공정성을 유지. 단일 사용자는 수천개의 `slot`을 확보하여 쿼리를 수행 가능

#### Storage는 Google의 Global Storage system인 Colossus

- BigQuery는 `columnar storage format`그리고 `compression algorithm을 활용하여 대량의 구조화된 데이터를 읽는데 최적화된 colossus에 데이터를 저장
- Colossus는 또한 Disaster, Recovery(디스크 충동 시) 및 분산관리 (no single point of failure) 처리
- 기존 데이터 웨어하우스와 같이 훨씬 더 비싼 컴퓨팅 리소스를 연결하는데 따른 penalty를 지불하지 않고 원할하게 저장된 수십 페바바이트 데이터로 확장 가능
  
#### Compute and Storage Petabit Jupiter 네트워크를 통해서 서로 통신

- Storage와 Computing사이에는 Google `Jupiter 네트워크` 활용하여 데이터를 한 곳에서 다른 곳으로 매우 빠르게 이동시키는 `shuffle`이 존재

### Conclusion

- Google은 이러한 기술을 지속적으로 개선하는 wndwja
- BigQuery 사용자는 기존 기술과 관련된 다운타임 및 업그레이드 없이 성능, 내구성, 효율성, 확장성을 지속적으로 개선하는 이점을 얻음
-
- <https://medium.com/@brilliantprogrammer/exploring-the-bigquery-architecture-0c0450a192b7>
- [gcp-blog](https://cloud.google.com/blog/products/data-analytics/new-blog-series-bigquery-explained-overview?hl=en)
