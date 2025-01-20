---
title: "(5) PodDisruptionBudget"
date : 2025-01-18 09:00:00 +0900
categories: [Kubernetes,PodDisruptionBudget]
tags : [k8s]
---




### Specifying a Disruption Budget for your appliation
#### PodDisruptionBudget(PDB)
- k8s에서 사용되는 리소스 관리 도구중 하나로. cluster의 안정성을 유지하기 위해 pod의 중단을 제어하는데 사용
- pod update나 유지보수와 같은 이유로 중단되는 상황을 관리 
- 해당 도구를 사용하면 예상치 못한 상황에서 영향을 최소화 가능 
- 사용자가 pod가 안정적으로 업데이트 되고, 서비스 가용성이 유지되도록 보장
- PDB정의할때 아래와 같은 속성들을 지정
    - spec.minAvailable: PDB에 의해 지정된 파드 중 최소한으로 유지되어야 하는 파드의 수입니다. 이 값을 설정하면 업데이트 중에 최소한으로 유지되어야 하는 파드의 수를 지정할 수 있습니다.
    - spec.maxUnavailable: 동시에 중단될 수 있는 파드의 최대 수를 나타냅니다. 이 값은 파드 업데이트 중에 클러스터에서 동시에 중단될 수 있는 파드의 최대 수를 지정합니다.
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

