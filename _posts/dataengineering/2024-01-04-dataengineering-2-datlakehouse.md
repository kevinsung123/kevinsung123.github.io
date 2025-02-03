---
title: "(2) Data Lake vs. Data Lakehouse "
categories: [Data Engineering,Architecture]
tags: [datalakehouse]
---


### Introduction
- datalake와 datalake house 모두 빅데이터와 함꼐 동작하고, Data Science/Data Analytics을 지원하고 처리하도록 함
- 아래는 이 2가지 솔루션에 대해 이론적 배경을 제시하고 각각의 장단점을 설명

### What is DataLake?
- Datalake는 조직이 대규모의 정형/반정형/비정형 데이터를 모두 저장할 수 있는 중앙 저장소
- 기존의 전통 데이터 스토리지 솔루션과 달리 Datalake를 사용할 경우 데이터를 저장하기 전에 스키마나 구조를 정의 할 필요가 없음
- 데이터를 변환하지 않고 Datalake에 로드하는 `ELT`프로세를 수행하는 경우가 많음
- 데이터 변환은 데이터 분석 또는 DW/DL에서 발생함
- 구조,형식 또는 크기에 관계없이 모든 데이터를 저장하고 나중에 분석 가능
#### 결과적으로 다음과 같은 이점이존재
    - Flexibility
        - Data Lake사용하면 모든 데이터 유형과 형식을 저장가능하므로 먼저 데이터를 변환할 필요가 없이 모든 소스에서 데이터를 분석 가능
    - Cost-Effective
        - 여러 스토리지 시스템이 필요하지 않으므로 기존의 데이터 스토리지 솔루션보다 비용 효율적
    - Scalability
        - 증가하는 데이터 볼륨을 수용하기 위해 수평적 확장 가능. 빠른 분석을 위해 분산 처리 지원
#### 단점
    - 데이터 품질, 정확성 및 보안을 보장하기 위해 상당한 거버넌스 및 관리 노력이 필요
    - 대용량/외부/실시간 데이터등과 같은 여러 데이터 소스를 저장하고 통합할 수 있는 능력이 필요 특정한 복잡성이 존재 할 수 있음

### What is DataLakehouse?
- Data Lakehouse는 Data Lake의 기능과 기존의 DW의 기능을 결합한 현대적인 데이터 관리 아키텍처
- 목표는 `배치에서 streaming,정형화 및 비정형화, 원시 데이터에서 정제에 이르기까지 모든 유형의 데이터를 저장하고 처리할 수 있는 통합플랫폼을 구축`
#### 장점
- lakehouse는 lake와 dw의 장점을 복합적으로 구현
- 서로 연계되지 않고 단일 시스템을 ㅗ작동
- raw 데이터를 flexible data lake데이터 저장소에 로드된 후 ETL프로세스를 통해 DW에 저장
- 이 위치에서는 BI/ML/기타 서비스를 사용가능
#### 단점
- 높은 수준의 기술을 유지하려면 오히려 비용이 많이 발생하기 떄문에 유지관리 비용이 많이 발생
- 다른 솔루션보다 유연하지 못한 경향

### 결론
- lakehouse는 lake와 dw를 결합
- 첫번째로는 데이터는 ELT를 통해 포맷되지 않은채 lake에 저장
- 그 이유는 오늘날 빅데터 시대에는 다양한 접근방식과 형식을 통해 방대한 양의 데이터를 수집 
- 이렇게 수집된 데이터를 ML이나 DW에 사용
- 후자의경우 ETL프로세스 사용하는 경우 많음
- DW에서 dashboard,레포트,ad-hoc 분석과 같은 경우 데이터를 포맷된 형태로 엑세스가능



### 참고

- [medium](https://vocal.media/01/data-lake-vs-data-lakehouse?source=post_page-----45ba65a8399--------------------------------)

 