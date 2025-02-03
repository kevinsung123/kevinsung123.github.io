---
title: "[DB] 4UUID"
categories: [DB, Concept]
tags: [db,4uuid]
---

## Database - 4UUID (Primary key)




### Abstract
```
  This specification defines a Uniform Resource Name namespace for
   UUIDs (Universally Unique IDentifier), also known as GUIDs (Globally
   Unique IDentifier).  A UUID is 128 bits long, and can guarantee
   uniqueness across space and time.  UUIDs were originally used in the
   Apollo Network Computing System and later in the Open Software
   Foundation's (OSF) Distributed Computing Environment (DCE), and then
   in Microsoft Windows platforms.

   This specification is derived from the DCE specification with the
   kind permission of the OSF (now known as The Open Group).
   Information from earlier versions of the DCE specification have been
   incorporated into this document.
```
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



