---
title: "(2) Assign pod to nodes using Node Affinity"
date : 2025-01-14 09:00:00 +0900
categories: [Kubernetes,Pod and Container]
tags : [kubernetes,node-affinity]
---

### **Affinity란?**
- affinity란 선호도란 의미. Pod는 항상 nodㄷ에 띄워져야 하는데, 이러한 배치를 함에 있어 선호하는 Node나 Pod에 설정할 수 있게끔 설정
  
### **Affinity 종류**
- **nodeAffinity**란 어떤 Node를 선호할것인가에대한 리소스. 즉 Pod를 배치할 떄 어떤 node에 스케쥴링 할지 설정
- **podAffinity**는 pod가 배치될때, 실행중인 Pod들에 선호하는 pod를 찾아 해당 pod와 동일한 Node로 배치하는걸 선정
- **podAntiAffinity**는 실행 중인 Pod들 중에, 선호하지 않은 pod가 실행중인 node에 피해서 배치를 하겠다


### **Node Affinity**
- 선호하는 Node를 설정하는 방법으로, `nodeSelector`보다 확장된 `label selector`기능을 지원 
- `matchExpressions`사용 가능(In,NotIn,Exists,DoesNotExists,Gt,Lt)
- 2가지 옵션이 `hard`,`soft`가 존재
  - 반드시 충족 해야 하는 조건(Hard)
    - `requiredDuringSchedulingIgnoredDuringExecution` : 즉 스케쥴링 되는 워크로드에는 `필수` 조건이고 실행 중인 워크로드는 조건을 무시
  - 선호하는 조건(soft)
    -`preferredDuringSchedulingIgnoredDuringExecution` : 즉 스케쥴링 되는 워크로드에는 `선호` 조건이고, 실행 중인 워크로드는 조건을 무시
- 용어
  - IgnoredDuringExecution: 실행 중인 워크로드에 대해서는 해당 규칙을 무시한다.
  - RequiredDuringExecution: 위와 반대개념으로 실행 중인 워크로드에 대해서 해당 규칙을 반드시 필요로 한다.
### **에제**

- required.yml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-affinity-required
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      name: hello
      labels:
        app: hello
    spec:
      containers:
      - name: nginx
        image: nginxdemos/hello:plain-text
        ports:
        - name: http
          containerPort: 80
          protocol: TCP
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: team
                operator: In
                values:
                - blue
                - red
```
- 스케쥴링 될때는 필수적으로 적용될 조건이지만 실행 중인 노드에는 무시
- operato  in은 or연산자라고 이해. key가 team이고 value가 blue,red인 조건을 필수
  
### **podAffinity**

- 선호하는 pod를 설정하는 방법으로 사용법은 nodeAffinity와 동일
- 2가지 옵션 제공 (hard,soft) nodeAffinity와 동일 
- **Topology key**
    - node의 label key를 설정하는 것이며 어떠한 값을 key-name으로 넣어도 상관 없지만 주로 아래와같이 넣음
    - **node 단위** : kubernest.io/hostname
    - **zone 단위** : topology.kubernetes.io/zone
    - **region 단위** : topology.kubernetes.io/region
### 참고
- <https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity>

- <https://kubernetes.io/ko/docs/tasks/configure-pod-container/assign-pods-nodes-using-node-affinity/>
- <https://velog.io/@pinion7/Kubernetes-%EB%A6%AC%EC%86%8C%EC%8A%A4-Affinity%EC%97%90-%EB%8C%80%ED%95%B4-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B3%A0-%EC%8B%A4%EC%8A%B5%ED%95%B4%EB%B3%B4%EA%B8%B0>
- <https://velog.io/@pinion7/Kubernetes-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0%EB%A5%BC-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B3%A0-%ED%81%B4%EB%9F%AC%EC%8A%A4%ED%84%B0-%EA%B5%AC%EC%84%B1%EC%9A%94%EC%86%8C%EB%A5%BC-%ED%8C%8C%EC%95%85%ED%95%B4%EB%B3%B4%EA%B8%B0>