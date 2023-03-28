---  
layout: post  
title: "[Devops] Jenkins  
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

### 3. Jnekin의 Pipeline

--- 

