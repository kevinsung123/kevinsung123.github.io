### kuberntes doc
- `컨테이너 오케스트레이션 엔진` :배포, 스케일링 그리고 컨테이너화된 애플리케이션의 관리를 자동화 해주는 
- CNCF(Cloud Native Computing Foundation) 에서 주관
---

### Concepts
#### What is Kubernetes?
- Kubernetes란 **containerized workloads and service(컨테이너화된 워크로드 와 서비스)** 들을 아래 특성을 가지며  지원하는 오픈소스 플랫폼
	- declartive configuration and automation을 지원하는 오픈소스 플랫폼
	- portable 이식가능
	- extensible 확장가능
---
#### Kubernetes Components
- kubernetes클러스터는  아래2가지 컴포넌트로 구성
1. control pane
2. node 
---
#### The Kubernetes API
- Kubernetes API는 Kubernetes의 object의 상태들을 `query그리고 manipulate` 가능
- K8s의 control pane의 core는 
	- The API server
	- HTTP API 
---
#### Working with Kubernetes Object
- Kubernets object들은 persistenet entity(영구개체)
- Kubernetes들은 이 entity들을 사용해서 cluster의 상태를 표현
- 

