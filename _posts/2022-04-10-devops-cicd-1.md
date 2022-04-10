---  
layout: post  
title: "[Devops]CICD(1) 개요"  
subtitle: "CICD 개요"  
categories: devops
tags: devops cicd overview
comments: true  
---  

### Modul1. CI/CD개요
---

### INDEX
#### 1.1 CI/CD정의
#### 1.2 환경의 번화
#### 1.3 문화의 변화 
#### 1.4 CI/CD 패러다임 변화
#### 1.5 CI/CD 목표


--- 

### 1.1 CI/CD정의
- CI(Continuous Integration), 지속적인 통합 + CD(Continuous Devlivery,지속적인 배포 )
- 어플리케이션 빌드 및 배포와 인프라 Provisioning을 `자동화`하여 산출물을 짧은 주기로 고객에게 제공하는 방법

![ciccd-1](../assets\img\devops\2022-04-10-devops-cicd-1-1.png)

---

#### 1.2 환경의 번화
- Business Agility(민첩성)
    - 빠른 개발, 적용, 검증 확대
    - MSA 구조가 확대
- Cloud-native platforms
    - on-demand 방식으로 자원 이용
- DevOps processes
    - 운영하면서 지속적으로 개발, 개발과 운영을 결합한 합성어
    - 개발, 빌드, 테스트 및 운영이 용이하도록 사고방식의 변화, 협업 향상 및 긴밀한 통합을 강조
    - 깅버이 조직과 문화 등 기술 외적인 변화도 수반되어야함

![ciccd-2](../assets\img\devops\2022-04-10-devops-cicd-1-2.png)


---

#### 1.3 문화의 번화
- 환경적인 변화로 잦은 출시 요구가 잦음

 ![ciccd-3](../assets\img\devops\2022-04-10-devops-cicd-1-3.png)

- Agile이란?
    - 고객 가치 극대화를 위해 최선의 의사결정을 내리는데 도움이 되는 가치와 원칙이며 소프트웨어의 불확실성이 증가됨에 따라 개발 방식을 프로토타입과 학습에 초점을 맞춘 방법론
- 기존 Waterfall과 차이?
    - 분석/설계 -> 개발 - > 테스트 -> 베포
    - 위의 과정을 자주자주 빠르게 반복 
    - 민첩하게 대응 

- DevOps란?
    - 소프트웨어 개발자들과 IT종사자들 사이의 의사소통, 협업, 융합을 강조한 소프트웨어 개발방법론
    - 아래 무한 loop를 돌며 개발을 운영에 배포
    - CAMLS
- 문화의 변화
    - Agile
        - 프로세스 문화에 초점
        - 변화를 강조
    - CI/CD
        - 소프트웨어 라이프 사이클에 초점
        - 도구를 강조
    - DevOPS
        - 개발 문화에 초점
        - 역할을 강조
![youtube 참조](https://www.youtube.com/watch?v=5Eqz8hm3SVQ)
 ![ciccd-4](../assets\img\devops\2022-04-10-devops-cicd-1-4.png)

---

#### 1.4 CI/CD 패러다임의 변화

![ciccd-5](../assets\img\devops\2022-04-10-devops-cicd-1-5.png)

#### 1.5 CI/CD 목표
- CI/CD는 파이프라이능ㄹ 구축하여 어플리케이션 개발단계를 자동화하여 배포 프로세스를 여러 단계로 나누고, 각 단게마다 어플리케이션에 추가 혹은 변경된 기능의 유효성을 검사하고 품질을 다각도로 확인하여 짧은 주기로 지속적으로 제품(release)을 출시하는것
- 파이프라인 단계를 모두 자동화 되어있음


#### Summary
IT환경과 개발 방법론의 변화로 인하여 Business Agility를 확보하기 위해서는 Monolith 환경에 비해 복잡한 아키텍처를 구성하여야 하므로 자동확 고려된 아키텍처 설계 필수

CI/CD는 DevOps와 Agile을 구현하기 위한 자동화의 핵심요소이며 프로젝트 환경의 Outer Architecture 구성에대한 고민과 이를 자동화 하기 위한 CI/CD에 대한 고민이 필요함


