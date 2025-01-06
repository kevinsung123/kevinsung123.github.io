---
title: "(2)BigQuery gRPC개요"
date : 2025-01-03 10:00:00 +0900
categories: [GCP,BigQuery,gRPC]
tags : [gcp,bigquery,grpc]
---


## **gRPC**

<!--more-->

---
gRPC란 Goole에서 개발한 **modern open source 고성능 RPC프레임워크**로 어떤 환경에서도 실행가능
**Load balancing,tracking, health checking, authentication**에 대한 plugin 지원을 통해 **데이터 센터 내 및 데이터 센터간 서비스를 효율적으로 연결**. 또한 **분산컴퓨팅에서 모바일 애플리케이션 및 백엔드 서비스에 연결**하는데에도 적용 가능
- **HTTP/2프로토콜** 위에서 동작
- 다양한 언어 지원하고 직렬화 및 역직렬화를 위해 **Protobuf**를 사용

### **RPC(Remote Procedure Call)**

- 별도의 원격 제어를 위한 코딩없이 다른 주소공간에서 함수나 프로시저를 실행할 수 있는게 하는 프로세스간 통신 기술
원격 프로시저 호출을  이용하면 프로그래머는 함수가 실행 프로그렘에 로컬 위치에 있는 원격 위치에 있든 동일한 코드를 이용 할 수 있음
- RPC란 프로세스간 통신을 위해 사용하는 IPC(Internal Process Communication)방법의 한종류. 원격지의 프로세스에 접근하여 프리시저 또는 함수를 호출하여 사용  말그래도 원격지의 프로시저를 호출
- 일반적으로 프로세스는 자신의 주소공간 안에 존재하는 함수만 호출하여 실행 가능. `하지만 RPC를 이용하여 다른 주소공간에서 동작하는 프로세스의 함수를 실행할 수 있게된다. 분산 컴퓨팅 환경에서 프로세스간 상호 통신 및 컴퓨팅 자원의 효율적인 사용을 위해 발전된 기술`
- 분산 컴퓨팅 + client-server를 베이스를 위한 앱을 위한 강력한 기술
- `참고` : RPC는 제어흐름이 호출자와 수신자 간에 교대로 이루어지는 client-server 상호작용에 적합. 개념적으로 클리언트와 서버는 동시에 실행하지 않음. 대신 실행 스레드가 호출자로부터 수신자에게 점프했다가 다시 돌아옴

### **RPC목표**

- client-server간의 커뮤니케이션에 필요한 상세정보는 최대한 감춤
- client는 일반 메소드를 호출하는 것 처럼 원격지의 프로시저를 호출할 수 있음
- 서버도 마찬가지로 일반 메소드를 다루는 것 처럼 원격 메소드를 다룰수 있음
![rpc](https://velog.velcdn.com/images%2Fjakeseo_me%2Fpost%2Fcbee941a-abc3-40a0-bab3-69c03bb25cba%2Fimage.png)
![rpc동작방식](https://velog.velcdn.com/images%2Fjakeseo_me%2Fpost%2F16327fcc-4da1-4a4b-8dbc-b5b84a933900%2Fimage.png)

1. 클라이언트가 일반적인 방식으로 파라미터를 넘겨 client stub procedure를 호출한다. client stub은 클라이언트를 소유한 주소의 공간 내에 거주한다. * stub : 프로시저 호출을 추상화하는 작은 코드 조각 (client,server사이에 원격 프로시저가 호출을 처리하기 위해 사용)
2. client stub이 파라미터들을 메세지로 모은다. 여기서 모은다는 것에 파라미터의 표현을 표준 포맷으로 변경하고 각 파라미터를 복사해서 메세지로 넣는 것도 포함된다.
3. client stub은 원격 서버 머신으로 메세지를 보내는 계층인 transport layer로 메세지를 보낸다.
서버에서, transport layer는 메세지를 server stub으로 보낸다. server stub은 또 파라미터들을 모아주고 일반적인 프로시저 호출 메커니즘을 사용하여 요구된 서버 루틴을 호출한다.
4. 서버 프로시저가 완료될 때, 서버 프로시저는 server stub으로 반환된다. (이를테면 일반적인 프로시저 호출 반환값을 통해), server stub은 결과 값들을 모아서 메세지에 넣고, transport layer에 메세지를 보낸다.
5. transport layer는 결과 메세지를 다시 client transport layer로 보내고 client transport layer는 그 결과를 또 client stub에게 전달한다.
6. client stub은 반환 파라미터들과 실행 결과값을 다시 해체한다.

### **RPC 탄생배경**

`분산 네트워크 컴퓨터 환경에서 프로그래밍을 쉽게 할 수 있는 방법을 찾기위해서`

### **요즘RPC가 필요한 이유는?**

현재 유행하는 MSA(Micro Service Architectrue)구조로 서비스를 만든다면, 다양한 언어와 프레임워크로 개발되는 경우가 잦음.

### gRPC특징

가장 큰 2가지 특징은 HTTP/2와 ProtocolBuf(Protocol File)
브라우저에서 직접 gRPC서비스를 호출하는 것은 불가능. 또한 기존 데이터 통신과 다르게 텍스트 기반이 아니라 `Encoding된 Binary Stream`이기 때문에 사람이 읽기는 어려움. 하지만 아래와 같이 장점이 훨씬 큰 기술이므로 개발시 높은 생산성, 다양한 언어, 빠른속도등 좋은 퍼포먼스 보여줌

1. 높은 생산성과 효율적인 유지 보수

- ProtocolBuf의 IDL만 정의하면 높은 성능을 보장하는 서비스와 메시지에 대한 소스코드가 자동 새엉

2. 다양한 언어와 플랫폼 지원

- IDL을 활용한 서비스 정의 한개로 다양한 언어와 플랫폼에서 동작하는 서버와 클라이언트 코드가 생성

3. HTTP/2 기반의 양방향 스트리밍

- 서버와 클라이언트가 서로 동시에 데이터를 스트리밍으로 주고받음

4. 높은 메시지 압축률과 성능

- HTTP/2에 의한 압축뿐만 아니라 protoBuf에 의한 메시지 정의 의해서 메시지 크기를 획기적으로 줄임

5. 다양한 gRPC생태계

- 필요에 따라 Authentication, Tracing, Load Balancing, Health Checking, API Gateway 등 다양한 도구 지원

# gRPC When to use

- 특히 마이크로서비스 아키텍처에 적합
- 브라우저를 사용하지 않은 백엔드간 서버 통신, 자원 한정적인 환경에서도 유용
- 최근에 시스코, 주니터 등 네트워크장비에서 gRPC지원하여 모니터링/자동화/인프라 운영에도 활용방안이 많음

- [GoogleBlog](https://cloud.google.com/blog/products/data-analytics/new-blog-series-bigquery-explained-overview?hl=en>
  
-[네이버클라우드 기술*경험 gRPC깊게파고드리#1](https://medium.com/naver-cloud-platform/nbp-%EA%B8%B0%EC%88%A0-%EA%B2%BD%ED%97%98-%EC%8B%9C%EB%8C%80%EC%9D%98-%ED%9D%90%EB%A6%84-grpc-%EA%B9%8A%EA%B2%8C-%ED%8C%8C%EA%B3%A0%EB%93%A4%EA%B8%B0-1-39e97cb3460)

-[네이버클라우드 기술*경험 gRPC깊게파고드리#2](https://medium.com/naver-cloud-platform/nbp-%EA%B8%B0%EC%88%A0-%EA%B2%BD%ED%97%98-%EC%8B%9C%EB%8C%80%EC%9D%98-%ED%9D%90%EB%A6%84-grpc-%EA%B9%8A%EA%B2%8C-%ED%8C%8C%EA%B3%A0%EB%93%A4%EA%B8%B0-2-b01d390a7190)

-[gRPC](ttps://developers.google.com/protocol-buffers/docs/overview)
