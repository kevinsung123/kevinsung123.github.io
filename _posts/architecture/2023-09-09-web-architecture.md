---  
layout: post  
title: "[Architecture] What are Web Services?"  
subtitle: "Architecture - Web Service"  
categories: architecture
tags: architecuter web
comments: true  
---  

### What are Web Services? Architecture, Types Example
- Web Service는 WWW에서 client와 service application간의 통신을 전파하기 위한 표준화된 수단. 특정한 작업을 수행하기 위해 설계된 소프트웨어

- web service는 고유한 url주소를 가지며 인터넷을 통해 두 애플리케이션간의 통신을 유지하는 개방형 프로토콜을 사용하는 개방형 sw system

- 통신은  데이터 교환 형식인 XML/JSON과 통신 프로토콜인 HTTP/HTTPS를 통해 이루어짐

### Web Services vs API : Are thye Same?
- API(Application Programming interface)는 `모든 종류의 sw제품간에 데이터 전송을 가능하게 하는 일련의 fucntion 및 procedure`. 간단히 말해 API를 통해 서로 다른 두 시스템이 통신하는데 사용하는 언어와 비교할 수 있지만 언어적 신호와 기호 대신 장치 간 연결을 가능하는게 하는 프로그래밍 코드가 있음

- API는 web service보다 범용적인 용어. 이는 web과 offline을 통해 데이터를 전송하는 모든 유형 시스템간의 통신계층을 설명

 - web service는 웹통신을 통해섬나 작동하는 API 
 

### How WebServices work?
![How Web Services Work](https://www.guru99.com/images/3-2016/032316_0646_Webservicea1.png)
- 위의 diagram은 어떻게 web서비스 작동하는지 보여주는 간단한 다이어그램. client는 실제로 웹서비스를 호스팅하는 서버에게 요청을 통해 일련의 웹서비스 호출을 함.

- 이러한 요청은 원격 프로시저 호출을 통해 이루어짐. 
RPC(Remote Procedure Call)은 관련 웹 서비스에서 호스팅하는 메서드에대한 호출

- web service desing의 메인 요소는 client와 server간의 전송되는 데이터이며 그것은 XML(Extensible markup language)은 HTML에 대응되는 언어로 많은 프로그래밍 언어에서 이해되는 중간 언어로 이해하기 쉬움

- 애플리케이션이 서로 통신할때 실제로는 XML로 통신함. 다양한 프로그래밍 언어로 개발된 애플리케이션이 서로 통신 할 수있는 공통 플랫폼을 제공
 
- Web services는 애플리케이션 간에 XML데이터를 전송하기 위해 SOAP(Simple Object Access Protocol)라는 것을 사용. 데이터는 HTTP를 통해 전송. 
`웹서비스에서 애플리케이션으로 전송되는 데이터는 SOAP메시지라고 부름`
SOAP메시지는 XML문서일뿐. 문서는 XML문서로 작성되고 client 애플리케이션은 어떤 프로그래밍 언어로도 작성할 수 있음

### Why do you need a Web Serivce?
- 현대 비지니스 애플리케이션은 다양한 프로그래밍 플랫폼을 사용하여 웹 기반 애플리케이션을 개발. 일부 애플리케이션은 Java로 개발되고 다른 애플리케이션은 .Net로 개바도리수 있으며, Angular JS, Node JS등으로 개발

- 대부분 경우 이런 이기종 애플리케이션은 그들끼리 일종의 통신이 필요. 서로 다른 개발언어를 사용하여 구축되기 때문에 애플리케이션 간의 정확한 통신을 보장하는 것이 어려움

- 여기에 웹서비스가 등자. 웹서비스 다양한 프로그래밍언어를 기반으로 구축된 여러 애플리케이션이 서로 통신할 수 있도록 공통 플랫폼을 제공

### Type of Web Service
1. SOAP 
2. RESTful 

#### SOAP(Simple Object Access Protocl)
- SOAP는 전송 독립적 메시지 프로토콜로 아려짐 
- XML데이터를 SOAP메시지로 전송 기반
- web 서비스와 SOAP 가장 좋은점은 모두 표준 웹 프로토콜 HTTP를 통해 전송됨


### Web Services Architecture

### Role기반의 Architecture
1. Provider - 공급자는 web service를 만들고 client가 사용할 수 있도록 함
2. Reqeustor - 요청자는 web service에 접속해야하는 client application
웹서비스를 통해 일종의 기능을 찾는 .Net, Java 그리고 다른 언어 애플리케이션
3. Broker - UDDI에대한 엑세스를 제공하는 애플리케이션 
* UDDI(Universal Description, Discovery and Integration) : 특정 서비스 공급자가 제공하는 웹서비스를 설명, 게시 및 검색하기 위한 표준. 웹서비스에 대한 정보를 호스팅하는데 도움

### Technical Architecture
일반적으로 RPC,REST,GraphQL의 3가지 유형이 존재. (SOAP는 legacy)
![Web service architecture](https://content.altexsoft.com/media/2022/09/word-image-34.png.webp)


####  RPC(Remote Procedure Call)
####  Format 
- XML/JSON/Protobuf

#### Used 
-  command and action-oriented APIs, remote error loggin, monitoring program control, client/server apps on Windows OS

RPC는 모든 웹 형태의 서비스 유형 중에서 가장 빠르고 간단한 접근 방법. client는 특정명령을 원격 server 보냄. 메시지를 받은 후 server는 요청된 작업을 수행하고, 그 후에 결과를 client에게 다시 보냄. 그래서 기본적으로 RPC는 client에게 server를 원격 호출 할 수 있도록 하기 때문에 그 이름이 붙여짐
![rpc](https://content.altexsoft.com/media/2022/09/word-image-35.png.webp)


예를들어 client는 RPC웹 서비스를 통해 cab를 호출해야하는 경우 서버에서 call cab기능을 활성화하는 명령 /CallCab을 보냄

현재 존재하는 웹 서비스 유형 중 가장 단순한것으로, RCP는 서버에서 특정 기능을 호출할떄 보통 GET/POST HTTP방식만을 사용. GET은 데이터를 수신할떄 사용, POST는 다른 모든 작업에 적용됨으로써 server와 client 간의 통신 메커니즘은 server의 원격 호출과 server의 응답 획득으로만 구성


그러나 RPC는 구시이며, 아래에서 논의하는 REST/GraphQL과 같은 더 복잡한 프로토콜과 아키텍처 스타일로 변화하는중. 현재는 거의 RPC를 사용하지 않음

첫쨰, RPC는 실제로 표준이 아니라 서로 다른 서비스 간에 통일성이 결여된 접근 방식.
이는 기업들이 각 웹서비스가 고유한 구현, 호출할 기능 집합, 그리고 따라야할 규약을 가지고 있기를 기대해야하하는 것을 의미

RPC아키텍처에는 구글이 지원하는 gRPC라는 스핀이 있으며, 이는 별도 확인가능
[gRPC](https://www.altexsoft.com/blog/what-is-grpc/)

#### REST(Representational State Transfer)
#### Format 
- XML/JSON/Plain Text
#### Used 
- public APIs, simple resoure-driven apps

REST는 웹서비스를 구축하는 가장 대중적인 아키텍처 스타일. 2000년에 개발되었으며 그 원리는 기존에 알려진 machine to machine 통신방법을 유연하게 대체하는 역할을 하였음. 오늘날 REST는 public API및 웹 서비스 골드 표준으로 여겨짐

![REST](https://content.altexsoft.com/media/2022/09/word-image-36.png.webp)

RPC는 각 웹서비스에 대한 고유한 방법 집합을 다루는 것을 제안하지만 REST는 모든 유형의 작업에 대해 표준 HTTP/HTTPS방법에 초점을 맞춤

- `GET` - 서비스로부터 데이터를 검색
- `POST` - 새로운 기록을 만들기 위함
- `PATCH` - 기록을 수정하기 위해 
- `PUT` - 기록을 대체하기 위해 
- `UPDATE` - 기록을 업데이트 하기 위해
- `DELETE` - 기록을 삭제하기 위해

이러한 방법은 REST서비스의 또 다른 기본 개념인 리소스에 적용. 리소스는 client가 요청을 통해 엑세스에할 수 있는 개체. 예를들어 웹서비스가 다른 위치에서 이용 가능한 레스토랑에 대한 정보를 제공한다면 리소스는 특정 도시의 레스토랑 목록이 될 것. 각 리소스는 client가 엑세스 할 수 있는 고유한 url을 가지고 있음

자원에 접근하고 운영 할 수 있는 HTTP 방법만 가지고 있기 떄문에 REST접근 방식은 연결된 세계에서 매우 중요판 표준화를 달성할 수 있음. 보편적인 웹 통신기술 적용 가능


### GraphSQL
#### Format
- json
#### Used
- microservices, complex systems. mobile APIs

GraphQL은 2012년 페이스북이 자체목적으로 처음 개발한 웹 서비스 아키텍처. 2018년에 오픈소스가 되었고, GraphQL재단에 의해 주도. Airbnb, SHopify, Github, Pinterest, The New York Times등등에서 사용
![GraphQL](https://content.altexsoft.com/media/2022/09/word-image-37.png.webp)

GraphQL과 REST의 다른점은 `REST는 고유한 url을 통해 리소스에 저장된 데이터에 엑세스가능`. 각 리소스는 고유한 url을 가짐. 이는 여러 리소스에 포함된 데이터를 수집해아하는 경우 해당 리소스 url을 통해 개별적으로 엑세스해야함. `반면 단일 리소스에서 데이터의 서브셋을 찾는 경우 여전히 해당 리소스에 포함된 모든 데이터를 받
아야함. 이러한 challange는 `under and overfetching`이라고 일컫음

예를들어 레스토랑 세부정보를 제공하는 REST 웹서비스는 각 레스토랑에 리소스를 전용으로 제공. 고객이 소수의 레소토랑에 대한 위치 데이터만 가져올 경우 해당 레스토랑의 개별 url에 엑세스하고 모든 세부정보(위치,설명,요리유형) 가져온 다음 위치 데이터만 검색해야하는 단점이 있음.

반면 GraphQL은 모든 데이터에대한 `single access porint`를 제공. 모든 데이터 필드는 client가 server에서 가져올 수 있는 사용 가능한 객체의 집합인 `schema`로 설명. 모든 데이터를 가져오는 대신, client가 특정한 데이터 필드의 값만 가져올 수 있음

`GraphQL은 대량의 서로 다른 정보를 교환하고 통신의 속도와 효율성 관련된 웹 서비스를 위한 일반적인 접근방식이 되었음`



### 참조
[guru99-webservice architecture](https://www.guru99.com/web-service-architecture.html)
[altexsoft - webservice architecture](https://www.altexsoft.com/blog/web-service/)