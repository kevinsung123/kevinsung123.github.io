---
title: "(5) PodDisruptionBudget"
date : 2025-01-18 09:00:00 +0900
categories: [Kubernetes,PodDisruptionBudget]
tags : [k8s]
---




### **Specifying a Disruption Budget for your appliation**

#### **Protecting an Application with a PodDisruptionBudget**
1. PDB를 사용하려 보호하려는 애플리케이션을 식별
2. 애플리케이션이 `중단(disruption)`시 어떻게 반응할지 생각
3. PDB 정의를 yaml 파일로 생성
4. PDB object를 yaml파일로 생성

#### **Identify an Application to Protect**
- built-in k8s controller중에서 하나가 애플리케이션을 보호하려는 경우 다음과 같음
  - Deployment
  - ReplicationController
  - ReplicaSet
  - StatefulSet
  - 

#### **Think about how  your application reacts to disruptions**

- **Stateless frontends**
  - **주의사항** : capacity를 10%이상으로 줄이기 말기
  - **해결책** : `PDB with minAvailable 90%`
  
- **Single Instance Stateful Application**
  - **주의사항** : 사전통보없이 appliation을 do not terminate
  - **해결책1** : PDB를 사용하지 않고 가금씩 발생하는 가동 중지 시간을 허용(tolerate occasional downtime)
  - **해결책2** : `PDB with maxUnavailabe=0`으로 설정. 운영작 종료하기 전 서비스 담당자에게 문의.

- **Multiplc-instance Stateful appllcation such as Consul,Zookeeper,etcd**
    - **주의사항** : `인스턴스 수를 quorum이하`로 줄이지 말기
    - **해결책1** : `PDB with maxUnavailable=1` 
   - **해결책2** : `PDB set minAvailable to quorum-size (e.g. 3 when scale is 5). (Allows more disruptions at once).` 

#### PodDisruptionBudget(PDB)
- k8s에서 사용되는 리소스 관리 도구중 하나로. cluster의 안정성을 유지하기 위해 pod의 중단을 제어하는데 사용
- 애플리케이션의 **의도하지 않은 가용성 저하**를 방지하고, **수동 또는 자동 작업으로 인해 Pod동시에 너무 많이 중단되지 않도록** 보장
- pod update나 유지보수와 같은 이유로 중단되는 상황을 관리 
- 해당 도구를 사용하면 예상치 못한 상황에서 영향을 최소화 가능 
- 사용자가 pod가 안정적으로 업데이트 되고, 서비스 가용성이 유지되도록 보장
- **정의** : k8s object로 pod의 distruption을 제한하기 위해 사용
- 주로 유지보수 작업(node upgrade, cluster 확장)이나 auto scaling 작업에 포함
- **의도적 중단**
  - node 유지보수 또는 scheduling 장애로 인한 pod 중단
  - 사용자가 pod를 삭제할때 발생하는 중단
  - 관리자가 수행한 node drain, auto scaling,update
- **비의도적 중단** 
  - 애플리케이션 충돌, network 장애
- **목표**
  - 최소한 pod수 또는 특정비율의 pod가 항상 실행중인 상태 유지
  - 애플리케이션 SLA(Service Level Agreement)를 만족시키는 가용성을 제공
- PDB정의할때 아래와 같은 속성들을 지정
    - **spec.minAvailable**: PDB에 의해 지정된 파드 중 최소한으로 유지되어야 하는 파드의 수입니다. 이 값을 설정하면 업데이트 중에 최소한으로 유지되어야 하는 파드의 수를 지정할 수 있습니다.
    - **spec.maxUnavailable**: 동시에 중단될 수 있는 파드의 최대 수를 나타냅니다. 이 값은 파드 업데이트 중에 클러스터에서 동시에 중단될 수 있는 파드의 최대 수를 지정합니다.
```
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: example-pdb
spec:
  minAvailable: 2

```
- 이 PDB는 example-pdb라는 이름으로 정의되며, 업데이트 중에 최소 2개의 파드가 항상 유지되어야 함을 나타냅니다.

### 참고
- [k8s official](https://kubernetes.io/docs/tasks/run-application/configure-pdb/)

