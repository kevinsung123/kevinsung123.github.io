---  
layout: post  
title: "[k8s] Container - images"  
subtitle: "Container - images"  
categories: k8s  
tags: k8s container image
comments: true  
---  
<!--more-->

## Images
container iamge는 `application과 모든 sw dependency을 encapsulate(캡슐화)하는 binary data`를 나타낸다
container iamge는 독릭적으로 실행할 수 있고 `runtime 환경에 대해 잘 정의된 가정을 만드는 실행 가능한 bundle`이다

일반적으로 application의 container iamge는 pod에서 참조하기 전에 registry로 push한다

---

### Image Names
- container image는 보통 `pause`, `example/mycontainer`, `kube-apiserver`와 같은 이름을부여
image는 registry hostname을 포함할 수 있다. 예를들어 `fictional.registry.example/imagename`과 같음
port 번호도 포함 가능

- registry hostname을 지정하지 않으면, kubernetes는 docker public registry를 의미한다고 가정

- image 이름을 부여한 후 tag를 추가할 수있다.(`docker`와 `podman` 명령과 함계 사용)
tag를 사용하여 같은 image의 version 관리가능

- image tag는 lowercase, uppercase 문자, 숫자, underscore(_), periods(.), dashes(-)로 구성
tag가 없으면 `latest`를 의미한다고 가정

> Caution
 production환경에서 `latest` tag를 사용하지 않아야함. 실행 중인 image version을 추적하기 어렵고, 이전에 잘 작동하는 rollback하기가 어려움

---

### Updating Images
- pod template를 포함하는 deployment, statefulset, pod 그리고 다른 object를 처음 만들때, 기본적으로 명시적으로 특정하지 않으면, 기본적으로 모든 container의 `pull policy`는 `IfNotPresent`로 셋팅. 이 policy는 `kubelet`이 이미 존재하면 pulling을 생략함

- 강제적으로 pull하고 싶으면 아래 중 한가지를 `imagePullPolicy` field에 설정 
    - `Always` 설정
    - `imagePullPolicy`를 생략하고 `:latest`를 사용할 image의 tag로 사용
    - `AlwaysPullImages` admission controller를 설정

> Note
The value of imagePullPolicy of the container is always set when the object is first created, and is not updated if the image's tag later changes.

For example, if you create a Deployment with an image whose tag is not :latest, and later update that Deployment's image to a :latest tag, the imagePullPolicy field will not change to Always. You must manually change the pull policy of any object after its initial creation.

- `imagepullPolicy`의 특정값이 없으면 기본적으로 `Always`를 설정

---

### Multi-architecture images with indexes

--- 

### Using a private registry
