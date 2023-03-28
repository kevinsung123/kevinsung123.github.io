---  
layout: post  
title: "[Devops] Jenkins"
subtitle: "Jenkins 개요"  
categories: devops
tags: devops cicd jenkins
comments: true  
---  

### Jenkins를 통한 Pipeline 
---

### 1. Jenkins란 ?
#### 1.1 Jenkins 기본개념
- java runtime environment에서 동작
- `다양한 plugin을 활용`해서 각종 자동화 작업을 처리 할 수 있음
- AWS배포, 테스트, docker build등 할것들이 많으니 각각의 컴포넌트들을 하나의 플러그인으로 모듈화 하였음. 이를 활용
- 가장 핵심적인 pipeline `Secret key`도 plugin 활용가능
- `일련의 작업 task들을 pipeline을 통해 CI/CD Pipeline을 구축`
- plugin들을 잘 조합하여 돌아가게 하는게 Pipeline이라고 할 수있음

#### 1.2 Jenkins의 대표 plugin
- Credentials Plugin
    - Jenkins는 `단지 서버`이기 때문에 배포에 필요한 `각종 리소스 접근 하기 위해서는 여러가지 중요 정보들을 저장`하고 있어야함
    - 리소스에는 OnPremise, Cloud에대한 ssh 접근 가능해야함
    - AWS Token, Git Access token, secret key, ssh(id/pw)등 정보들을 저장할때 사용
    - 위와 같은 중요정보들을 저장하는 plugin
    - Jenkins는 Private network에 실행되기 때문에 보안상 너무 걱정하지 않아도 됨
- Git Plugin
    - Jenkins에서 git에 대한 소스코드를 pull하여 build할 수 있도록 도와줌
- Pipeline
    - `핵심기능인 Pipeline`마저도 plugin
- Docker Plugin and Dodcker pipeline 
    - Docker agent를 사용하여 jenkins에서 docker를 활용가히 위한 plugin

### 3. Jnekins의 Pipeline
#### 3.1  Pipeline
- pipeline이란 CI/CD의 pipeline을 jenkins에 구현하기 위한 `일련의 plugin들을 집합이자 구성`
- 즉, 여러 plugin들을 pipeline에 용도에 맞게 사용하고 정의함으로써 pipeline을 통한 서비스가 배포
- pipeline dsl(domain specific language)로 구성됨
- jenkins가 동작되기 위해서는 여러 plugin들을 pipeline을 통하여 흘러가는 과정

#### 3.2 Component 구성요소
- 2가지 형태의 pipeline syntax가 존재
    - declartive (더 최신이고 가독성이 좋음)
    - scripted pipeline

#### 3.3 Section의 구성
- Sections(가장 큰 개념)
    - agent section
    - post section
    - state section
    - steps section

### 4. Section 깊게 살펴보기
#### 4.1 Agnet section
- jenkins는 많은 일으 하기때문에 혼자 하기 버거움
- 여러 slave node들을 두고 일을 시키는데, 이처럼 어던 jenkins가 일을 하게 하는지 지정
- jenkins node 관리에서 새로 node를 띄우거나 혹은 docker image를 통해 처리 
- 예를들어, jenkins instance가 서버 2대에 각각 떠 있는경우, master or slave 어떤 곳에서 시킬지 결정
- Jenkins node안에서만 넣을 수 있는 것이 아니라 jenkins 안에 있는 docker continaer에 들어가서 일을 시킬 수 있음
- `node js`안에서 뭔가를 지시 가능
#### 4.2 Post Section
- stage가 끝난 이후 결과에 따라 후속 조치 가능
- 성공시 -> 이메일
- 실패시 -> 중단 혹은 건너뛰기
- 작업결과에 따른 행동 취함


--- 
- [velog-jenkins](https://velog.io/@bbkyoo/Jenkins)

