---  
layout: post  
title: "[k8s] Kubectl - Resource"  
subtitle: "Kubectl - Resource"  
categories: k8s  
tags: k8s resource
comments: true  
---  
<!--more-->

## Overview of kubectl
- kubectl은 k8s cluster를 제어하기 위한 cli(command line tool) 
- `kubectl`은 `$HOME/.kube` directory안에 `config`파일을 참조한다
- `KUBECONFIG` 환경변수를 setting함으로써 kubeconfig file 수정이 가능 (--kubeconfig  flag 사용)


--- 




### 참고
- [k8s공식doc](https://kubernetes.io/docs/reference/kubectl/overview/)