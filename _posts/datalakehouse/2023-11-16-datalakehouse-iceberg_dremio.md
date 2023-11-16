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
```
Dremio는 데이터 레이크 엔진으로서, 다양한 데이터 소스에서 데이터를 검색하고 쿼리하는 데 중점을 둔 오픈 소스 소프트웨어입니다. Dremio는 대규모 데이터 처리 및 분석을 단순화하고 가속화하기 위해 설계되었습니다. 몇 가지 주요 특징과 기능은 다음과 같습니다:ㅎ
```
### 특징 
1. Self-Service Data Access: Dremio는 사용자가 IT의 개입 없이 데이터를 검색, 분석 및 시각화할 수 있도록 하는 self-service 모델을 제공합니다.
2. Query Acceleration: Dremio는 데이터 가속화를 위해 다양한 기술을 사용합니다. 이는 데이터 reflections(데이터의 사전 집계 및 인덱싱)를 통해 쿼리 성능을 최적화하는 데 도움이 됩니다.
3. Connectivity: 다양한 데이터 소스와의 연결을 지원합니다. 이는 관계형 데이터베이스, NoSQL 데이터베이스, 클라우드 스토리지 등을 포함합니다.
4. Security and Governance: Dremio는 데이터 접근 제어, 데이터 거버넌스, 보안 등을 관리하기 위한 기능을 제공하여 데이터의 안전성을 보장합니다.
5. Open Source: Dremio는 오픈 소스 프로젝트로, 사용자가 소스 코드를 검토하고 수정할 수 있도록 합니다.
6. SQL Compatibility: Dremio는 표준 SQL 쿼리를 지원하므로 기존의 비즈니스 인텔리전스 도구 및 애플리케이션과 호환성이 있습니다.

Dremio는 데이터 엔지니어링, 데이터 과학, 비즈니스 인텔리전스 등 다양한 분야에서 사용될 수 있으며, 특히 대화형 쿼리와 데이터 분석을 강조합니다. 이는 대규모 데이터셋에서의 빠른 성능과 쿼리 가속화를 통해 실시간 분석을 가능하게 합니다.

### UUID?
- UUID(A Universally Unique Identifier URN Namespace)
- 정보식별을 위하여 사용되는 식별자
- 128bit의 숫자로 이루어져 있음
- UUID 장점 중 데이터들이 나중에 단일 DB로 통합되거나, 같은 채널에서 전송되더라도 식별자가 중복될 확률이 매우 낮음

### Use case - Cloud Spanner
- Cloud SPanner 분산 아키텍처를 사용하면 `핫스팟`을 방지하기 위해 스키마를 설계
- `핫스팟`은 기본서버가 여러 유사 요청을 여러서버에 동시에 배포하는 대신 의도치 않게 여러 유사 요청만 처리하도록 강제는 테이블의 구조 결함
- 핫스팍 방지 대책( UUID 사용)
    - UUID를 기본키로 저장하는 방법
        - STRING(36)열에서 저장
        - INT64열의 쌍에서 저장
        - BYTES(16) 열에서 저장

    - UUID 사용할 경우 단점
        - 16바이트 이상을 사용하므로 크기가 약간 큼. 기본키를 지정하는 다른방법은 이렇게 많은 스토리지를 사용 X
        - 레코드에관한 정보를 담고 있지 않음. 예를들어 SingleId와 AlbumId라는 기본 키는 이름에 의미가 담겨있지만 UUID는 그렇지 않음
        - 연관된 레코드 사이의 지역성이 사라짐(UUID 사용 시 핫스팟이 제거되는 이유도 이 떄문)



### Database Primary key and ID Column
- Primary key성능적 이점을 위해 사용
- RFC4122 에서 정의하는 범용고유 식별자를 키로 사용
- 임의의 값을 비트 순서로 사용하는 버전4 UUID가 권장
- `버전1 UUID는 타임스탬프를 고차비트에 저장하므로 권장하지 않음`
- UUID를 기본키로 저장하는 방법
    - STRING(36)열에서 


### 참고

- [RFC4122](https://www.rfc-editor.org/rfc/rfc4122)
- [Cloud Spanner](https://cloud.google.com/spanner/docs/schema-design?hl=ko)



