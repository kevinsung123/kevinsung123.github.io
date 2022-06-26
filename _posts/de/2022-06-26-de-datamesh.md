---  
layout: post  
title: "[DE] DataEngineering - Data Fabric"  
subtitle: "DataEngineering  Data Fabric"  
categories: de
tags: de datafabric
comments: true  
---  
## DataEngineering

---


### Data Mesh (기존 DW/DataLake 문제점)
- 데이터 기반의 서비스 활용이 중대되면서 데이터 메시에 대한 필요성이 요구
- DW나 DataLake에서 같이 통합된 데이터 관리 환경에서 조직의 사일로로로 인한 데이터 접근과 활용에서의 문제를 해결하는 방법으로 데이터 메시의 개념을 접근 가능 
- Data Mesh란 기존에 DataLake나 DataWarehouse에서 중앙집중적으로 관리되었던 분석 데이터들을 탈중앙화하여 관리를 하는 개념
- 대부분 기업은 크게 Opertaion(운영)을 위한 데이터나 Analyze(분석)을 위한 데이터를 가지고 있다.
- Operational 데이터는 운영을 하면서 사용하거나 생성되는 데이터로서 현재상황에 대한 정보를 가지고 있고 Analytical 데이터는 통상적으로 여러 Operation데이터를 모아서 과거정보를 포함하는 사업의 전체적인 정보를 나타냄
- 예를 들어 전기회사에서 현재 정전상황을 나타내는 데이터는 Operational 데이터이고, 지역별 1년간의 정전 시간을 나타내는 데이터는 Analytical 데이터이다

Operational 데이터에서 Analytical 데이터로 변경을 할때 ETL(Extract, Transform, Load)를 해서 DW나 DataLake로 여러 Operational 데이터를 모으게 되는데, 이 부분에서 통상적으로 한계가 나타난다. 우선 새로운 Data Source가 발생하게 되면 기존 Data들과 같은 형태로 변경을 해야하지만 이는 기존 Table을 수정/새로운 Table을 생성하는 시간과 새로운 ETL을 생성하는 시간이 발생 한다. 
 
 만약 여러 종류의 Data Source들을 가지고 있고, 한팀에서 이 작업을 한다면 많은 가치가 발생하지는 않을 것 이다. 또한 주기적으로 새로운 종류의 Operational 데이터가 생성된다면, 이 작업은 아주 복잡한 작업이 될 것 이고, 결국 데이터양은 많으나 아무도 정확하게 어디서 무엇을 찾을 수 있는지 알 수 없게 된다. 이 상황에서 머신러닝과 같은 Data Science 작업과 권한 관리를 추가하게 된다면, 필요한 데이터가 어디있는지 찾아서 권한을 요청하고 정리하는 일이 Data Scientiest들이 많은 시간을 쓰는 일이 될 것이다
![data mesh ](https://datacrossroads.nl/wp-content/uploads/2020/08/Figure-6-1.png)


Data Mesh는` 이러한 문제를 해결하기 위해서 Data as a product 개념을 도입하여 탈중화를 이루고하는 개념`
간단하게 정리하면 각 사업부별로 Analytic data를 제공하고 데이터 품질이나 응답시간에대한 SLA정하고 지키는 것. 예를들어서 위의 정전을 예제를 이용하면, 정전을 감지하는 팀에서 현재 정전상황(Operational 데이터) 뿐만 아니라 몇년치 정전 데이터(Analytical 뎅티ㅓ)를 전사적으로 약속한 방식(API, SQL 등등)을 제공하는 방식. 이 갠며은 결국 각 사업부별로 데이터 정제 및 데이터 서비스 제공을 위한 인프라 관리를 해야하는 결과를 초래하는데, 이는 중앙집중적으로 관리하던 데이터 엔지니어링 조직을 사업부별로 나누게 된다. 이는 중앙집중적으로 관리하던 데이터 엔지니어링 조직을 사업부별로 나누게 된다.
이렇게 각 사업부별로 Analytical 데이터를 제공하면 필요로 하는 조직에서 필요한 모든 데이터를 조회해서 필요한 Dashboard나 또다른 Analytical 데이터를 만들어서 제공하면 되는 것이다. 개념적으로 API를 이용하는 Microservice Architecture (MSA)와 유사한 점이 많다.

#### 데이터 분석가와 도메인 기반 아키텍처
흔히 이러한 데이터 메시를 도메인 기반의 데이터 활용조직 또는 MSA기반의 데이터 아키텍처로 정리
실제 데이터 분석을 위해서는 데이터 분석 모형별 다양한 임시 데이터 처리 공간이 필요하고 또 실시간 변화되는 데이터를 추가해서 분석모델을 재학습하는 과정들이 지속적으로 동반

이러한 환경을 위해서는 분석 모델별 별도의 분석 환경과 분석 데이터가 개별로 관리되고 운영 되어야 한다
주로 Docker나 Kubernetes와 같은 가상 공간을 활용하여 분석에 필요한 자원을 할당하고 지속적인 학습과정들이 데이터 분석가를 통해 이루어 집니다.

이때 Data 분석가 또는 분석조직은 분석 모형 마다 별도로 각 업무 단위별로 자유로운 분석을 할 수 있는 데이터 처리구조가 요구
이러한 아키텍처를 도메인 기반의 데이터 아키텍처 

#### 데이터 파이프라인, 데이터 Mesh 그리고 데이터 서비스
데이터 분석의 목적은 고객에게 다양한 서비스로 제공하는 것으로 실시간 변화하는 데이터를 분석하여 데이터 서비스로 연결하는 과정까지 이어서 고려를 해야함.
이러한 환경을 데이터 Mesh라고 부름

데이터 분석 서비스가 이어지기 위해서는 실시간의 변화된 데이터를 끌어와서 분석모형을 재학습하고, 실시간의 서비스로 연결하는 데이터 파이프라인을 이용하는 전체 데이터 처리 과정에서 데이터 플랫폼의 개념을 찾을 수 있습니다.

#### Data Mesh는 ?
데이터 메시는 MSA마찬가지로 기존의 데이터 레이크에서 수집, 저장, 변환, 분석, 추론을 하는 모놀리식 방법과 다르게, 데이터 파이프라인을 활용하여 여러 도메인의 데이터를 쉽게 찾고 데이터 활용을 위한 접근 절차로 쉽게 정의하게 합니다.

### 참고
![DataMesh](https://bcho.tistory.com/1379)
![Cloud Insight](http://cloudinsight.net/data/data-mesh-part-1-%EA%B0%9C%EB%85%90-%EB%B0%8F-%EA%B8%B0%EC%A1%B4-data-warehouse-data-lake%EC%9D%98-%EB%AC%B8%EC%A0%9C%EC%A0%90/)
![Data Mesh정리 블로그](https://couplewith.tistory.com/entry/%EB%8D%B0%EC%9D%B4%ED%84%B0-%EB%A9%94%EC%8B%9C-Data-mesh-%EC%A0%95%EB%A6%AC)