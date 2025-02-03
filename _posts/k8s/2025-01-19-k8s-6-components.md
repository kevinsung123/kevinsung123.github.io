---
title: "(6) Components"
date : 2025-01-19 12:00:00 +0900
categories: [Kubernetes,Components]
tags : [k8s]
---


<!--more-->
## Kubernetes Components
### Kubernetes란
Kubernetes(약어 k8s)란 Container Orchestration 플랫폼이다. container화 된 워크로드/서비스/애플리케이션을 관리하기 이식성 있고, 확장 가능한 오픈 소스 플랫폼. 시스템에 배포 가능한 애플리케이션의 구성 요소가 많아짐에 따라 모든 구성의 요소를 관리를 용이하기 위해 사용. 

개발과 관리를 단순화할 뿐만 아니라 인프라 활용률을 크게 높일 수 있음 linux의 container의 기능에 의존해 애플리케이션의 내부 세부 사항을 알 필요 없이 각 Host에 애플리케이션을 수동으로 배포하지 않고도 이기종 애플리케이션을 배포. 모든 node가 하나의 Cluster로 구성하여 수천 대의 컴퓨터에서 애플리케이션을 배포/관리 가능. 기본 인프라를 추상화 하고 개발/배포/관리 단순화

---

### Control Plane Components(Master Node)
![kubernetes architecture](https://d33wubrfki0l68.cloudfront.net/2475489eaf20163ec0f54ddc1d92aa8d4c87c96b/e7c81/images/docs/components-of-kubernetes.svg)
k8s 구성요소는 크게 Control-Plane(Master Node)과 Worker Node로 구성
Control-Plane은 k8s cluster의 전반적인 결정을 수행하고 cluster 이벤트에 충족되지 않을 경우 새로운 Pod를 감지하고 반응. 실질적으로 Cluster를 전체적인 관리를 담당Control-Plane 구성요소는 아래와 같음 구성 요소는 아래와 같음
- API Server
- etcd
- kube-scheduler
- controller-manager

#### kube-apiserver (API Server)
API서버는 k8s  API를 노출하는 Control-Plane 컴포넌트의 프론트 엔드. k8s cluster에서 API를 사용할 수 있게 해줌. cluster로 요청이 왔을떄 그 요청이 유효한지 검증. 모든 요청을 API Server를 통해서 다른곳으로 전달되도록 구성.


[kube-apiserver상세](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/)

#### etcd
모든 Cluster의 데이터를 담는 k8s의 Backing store로 사용되는 consistent & high-available key값을 저장. k8s cluster에서 etcd를 backing store로 사용 시 이 데이터를 백업계획이 필요 


[etcd상세](https://etcd.io/docs/current/)


#### kube-scheduler
Node가 배정되지 않은 새로 생성된 Pod를 감지하고, 실행할 Node를 선택하는 Control-Plane 컴포넌트

스케쥴링 결정을 위해서 고려되는 요소는 아래와 같음
- 리소스에대한 개별 및 총체적인 요구사항
- HW/SW/정책적 제약
- affinity / anti-affinity 명세 
    - affinity? popd를 특정 node에 배포되는 정책 
    - Node affinity : pod가 특정 Node에 배포 되도록 하는 기능 
    - Pod affinity : 기존에 배포된 Pod를 기준으로 해서 배포될 Node를 결정
- data locality
- workload 간섭
- dead line

#### kube-controller-manager
Controller를 구성하는 Master Node의 Component 중 하나. 논리적으로 각 Controller는 개별 프로세스이지만, 복잡성을 낮추기 위해 모두 단일 binary파일로 compile되고 단일 프로세스 내에서 실행된다. Controller는 아래 구성요소를 포함

- Node Controller : Node가 다운되었을 때 통지와 대응에 관한 기능을 담당
- Replication Controller : 시스템의 모든 Replication Controller의 Object에대해 알맞은 수의 pod들을 유지시켜 주는 기능 담당
- Endpoint Controller : EndPoint Object를 채운다 service 와 pod를 연결
- Service Account & Token Controller : 새로운 Namespace에대한 기본 계정과 API 접근 Token을 생성

---

### Node Components
Node Components들은 모든 Node에서 실행, 실행 중인 pods들은 유지관리 및 Kubernetes runtime 환경을 제공

#### Kubelet
cluster의 모든Node위에서 실행되는 agent. kubelet은 pod에서 container가 확실하게 작동되로고 관리
kubelet은 다양한 메커니즘을 통해 제공된 podSpec의 집합을 받아서 container가 해당 pod의 spec에 따라 동작하는 것을 확실히 함
Kubelet은 kubernetes를 통해 생성되지 않은 container는 관리하지 않음

#### Kube-proxy
kube-proxy는 Cluster의 각 Node에서 실행되는 network-proxy로 k8s의 서비스개념의 구현부 
Node의 network 규칙을 관리. 이 network 규칙이 내부 network session이나 cluster 외부에서 pod로 network 통신이 가능하게 해줌
kube-proxy는 OS에 가용한 packet filtering이 있을경우 이를사용, 그렇지 않으면 traffic 자체를 forwarding함

#### Container-runtime
Container-runtime은 container 실행을 담당하는 소프트웨어. k8s는 여러 container runtime을 지원. docker, containerd, CRI-O 그리고 kubernetes CRI를 구현한 모든 소프트웨어를 지원


[Kubernetes CRI](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-node/container-runtime-interface.md)

---

### Addons
- k8s의 리소스(DaemonSet, Deployment, etc)을 이용하여 cluster 기능을 구현. 이들은 cluster단위의 기능을 제공하기 때문에 addon에대한 namespace 리소스는 `kube-system` namespace에 속함

#### DNS

#### Dashboard

#### Container resource Monitoring

#### Cluster-Level Logging
