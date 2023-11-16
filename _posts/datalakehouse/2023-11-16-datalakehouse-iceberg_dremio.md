---  
layout: post  
title: "[Datalakehouse] Iceberg vs Dremio "  
subtitle: "Iceberg vs Dremio 차이점"  
categories: datalakehouse
tags: datalakehouse 
comments: true  
---  
## Iceberg vs Dremio

---


### Dremio란
#### 정의
Dremio는 데이터 레이크 엔진으로서, 다양한 데이터 소스에서 데이터를 검색하고 쿼리하는 데 중점을 둔 오픈 소스 소프트웨어입니다. Dremio는 대규모 데이터 처리 및 분석을 단순화하고 가속화하기 위해 설계되었습니다. 몇 가지 주요 특징과 기능은 다음과 같습니다:ㅎ

### 특징 
1. Self-Service Data Access: Dremio는 사용자가 IT의 개입 없이 데이터를 검색, 분석 및 시각화할 수 있도록 하는 self-service 모델을 제공합니다.
2. Query Acceleration: Dremio는 데이터 가속화를 위해 다양한 기술을 사용합니다. 이는 데이터 reflections(데이터의 사전 집계 및 인덱싱)를 통해 쿼리 성능을 최적화하는 데 도움이 됩니다.
3. Connectivity: 다양한 데이터 소스와의 연결을 지원합니다. 이는 관계형 데이터베이스, NoSQL 데이터베이스, 클라우드 스토리지 등을 포함합니다.
4. Security and Governance: Dremio는 데이터 접근 제어, 데이터 거버넌스, 보안 등을 관리하기 위한 기능을 제공하여 데이터의 안전성을 보장합니다.
5. Open Source: Dremio는 오픈 소스 프로젝트로, 사용자가 소스 코드를 검토하고 수정할 수 있도록 합니다.
6. SQL Compatibility: Dremio는 표준 SQL 쿼리를 지원하므로 기존의 비즈니스 인텔리전스 도구 및 애플리케이션과 호환성이 있습니다.

Dremio는 데이터 엔지니어링, 데이터 과학, 비즈니스 인텔리전스 등 다양한 분야에서 사용될 수 있으며, 특히 대화형 쿼리와 데이터 분석을 강조합니다. 이는 대규모 데이터셋에서의 빠른 성능과 쿼리 가속화를 통해 실시간 분석을 가능하게 합니다.

### Iceberg란

Apache Iceberg는 대규모 데이터셋의 안정적인 저장과 관리를 위한 오픈 소스 프로젝트입니다. Iceberg는 특히 데이터 레이크에서 데이터 테이블의 형식을 관리하고 변경사항을 버전 관리하는 데 중점을 둔다. 아래는 Apache Iceberg의 주요 특징과 기능입니다

1. 트랜잭션 지원: Iceberg는 ACID(원자성, 일관성, 고립성, 지속성) 트랜잭션을 지원하여 데이터의 일관성과 견고성을 보장합니다. 이는 스키마 변경, 데이터 추가, 업데이트, 삭제 등과 관련된 다양한 작업에서 데이터의 정합성을 제공합니다.

2. 스키마 변화 관리: Iceberg는 스키마의 변경사항을 관리하고, 버전을 통해 이전 스키마로 롤백할 수 있도록 합니다. 이는 대규모 데이터셋에서의 스키마 변화에 대한 유연성을 제공합니다.

3. 파티셔닝과 정렬: Iceberg는 데이터 테이블을 효과적으로 파티션화하고 정렬할 수 있는 기능을 제공합니다. 이는 쿼리 성능을 향상시키고 데이터의 조직성을 유지하는 데 도움이 됩니다.

4. Snapshot Isolation: 동시에 여러 버전의 데이터를 조회하거나 수정할 수 있도록 스냅샷 격리를 지원합니다. 이를 통해 동시성이 높은 환경에서 안정적인 데이터 처리가 가능합니다.

5. 큐브와 통계 정보: Iceberg는 통계 정보를 수집하고, 데이터 큐브를 구성하여 쿼리 성능을 최적화하는데 사용됩니다.

6. 분산 환경 지원: Iceberg는 대규모 분산 환경에서 동작하도록 설계되었으며, Apache Spark, Apache Hive, Presto 등과 통합하여 사용할 수 있습니다.

Apache Iceberg는 데이터 레이크에서의 데이터 관리를 향상시키고, 스키마 변경과 버전 관리에 대한 도구로 사용됩니다. 다양한 데이터 파티셔닝 및 정렬 기능은 대용량 데이터셋의 효율적인 처리를 지원합니다.


### 참고

- [RFC4122](https://www.rfc-editor.org/rfc/rfc4122)
- [Cloud Spanner](https://cloud.google.com/spanner/docs/schema-design?hl=ko)



