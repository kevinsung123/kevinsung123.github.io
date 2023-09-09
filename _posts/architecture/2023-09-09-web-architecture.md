---  
layout: post  
title: "[Architecture] What are Web Services?"  
subtitle: "Architecture - Web Service"  
categories: gcp
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


####  RPC

#### REST




### 참조
[guru99-webservice architecture](https://www.guru99.com/web-service-architecture.html)
[altexsoft - webservice architecture](https://www.altexsoft.com/blog/web-service/)