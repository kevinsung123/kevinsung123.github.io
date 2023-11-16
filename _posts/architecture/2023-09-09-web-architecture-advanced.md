---  
layout: post  
title: "[Architecture] Advanced and Scalable Web App"  
subtitle: "Architecture - Web Service"  
categories: architecture
tags: architecuter web
comments: true  
---  

### Advanced and Scalable web Application Architecture
webapp의 아키텍처는 진화 중. 조직은 이렇나 변화를 사전에 모니터링하고 아키텍처를 그에 맞게 재조정 해야함. 

### Caching System
caching system은 매번 db에 연결하는 대신 애플리케이션 서버를 위한 데이터에 대한 빠른 접근을 용이하게하는 local 데이터 자종소라서, 기존의 설정에서는 data를 db에 저장하고, 사용자가 요청하면 앱서버가 db에 요청하여 사용자에게 response 등 반복 소요됨으로써 시간 및 리소스 낭비
이 정보를 cache memory에 저장함으로써 앱은 사용자에게 빠른 데이터를 제공

cahching system은 아래 4가지 모델로 구성 가능
- Application Server Cache
    - 애플리에케이션 서버와함꼐 in-mermoy cache 
- Gloabl Cache 
    - 모든 node가 single cache space에 접근
- Distributed Cache
    - cache는 요청을 필요한 데이터로 라우팅하기위해 일관 해싱 기능이 사용되는 노드에 분산
- CDN(Content Delivery Network)
    - 많은양의 static data를 전달하는데 사용

#### Caching tool
- Redis그리고 Memcahced가 유사항 기능을 가지고 제일 대중적으로 사용
- Redis는 다양한 작업을 수행하기 위해 적합한 풍부한 도구 세트를 제공
- 반면 Memcached는 단순하고 사용하기좋음
- AWS ElstciCache for Redis(완전 관리형 인메모리 데이터 스토어)
- AWS ElasticCache for Memcached (완전 관리형 인메로리 데이터 스토어)

#### Cloud Storage
 webapp architecture에서 cloud storage는 당연한 요구사항
cloud에 데이터를 저장하고 인터넷을 통해 엑세스를 제공. Cloud Service Provider는 storage infra를 사용량별 요금제 가입모델로 제공
![cloud storage](https://images.clickittech.com/2020/wp-content/uploads/2022/03/10202402/Diagram-57-1024x700.jpg)

### CDN(Cloud Front)
CDN은 content를 사용자에게 더 빠르고 잘 전달하기 위한 다양한 지리적 윛에 설치되는 서버네트워크로, 중앙 서버에 연결되는 대신 캐시된 버전의 content를 제공하는 CDN서버로 `사용자의 request가 라우팅되어 사이트이 속도와 성능이 향상되고 패킷 손실이 줄어 서버 부하가 줄어듬`. 또한 사용자의 세분화황 고급 웹 보안을 가능하게 함


### Load Balancer
LB는 가용성 또는 사전 정의된 정책을 기반으로 traffic 부하를 서로 다른 서버에 분산시켜 균형을 맞춰주는 서비스. 사용자 요청이 수신되면 가용성 및 확장성 측면에서 서버의 상태를 검색하여 최상의 서버로 라우팅. 

2가지 방법으로 수행
1. TCP/IP LB : DNS기반의 LB
2. App-level LB : 애플리케이션 load를 기반으로 LB

### Web app architecture diagram
![archi](https://images.clickittech.com/2020/wp-content/uploads/2022/03/10172917/Diagram-56-1024x700.jpg)


###Web application architecture FAQ
1. What are commonly used models for web application components?
You should choose the model of web applications based on the number of databases and servers used in the application. There are three popular models:
One database and one web server 
One Database and multiple web servers
Multiple databases and multiple web servers

2. What is the difference between Web Application Architecture and Web Application Design?
Web application architecture talks about the high-level components of the application and how they interact with each other while web application design talks about the code level design and how each service or function interacts with other components of the application.

3. What is MVC Architecture?
MVC stands for Model-View-Controller. The MVC architecture splits the app logic into three components based on the functionality. 
Model: Data storage model
View: Components that the user can view
Controller: Intermediate component between the model and view components

### 참조
[clickit](https://www.clickittech.com/devops/web-application-architecture/)

