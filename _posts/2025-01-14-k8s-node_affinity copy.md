---
title: "(2) Assign pod to nodes using Node Affinity"
date : 2025-01-14 09:00:00 +0900
categories: [Kuberntest,Pod and Container]
tags : [gcp,wif]
---

## GCP Workload Identity Federation with Federated Tokens

- cloud based 서비스를 접근하는 application을 개발할때는 application 인증(authentication) 및 권한(authorization)을 생각해야된다.
- Okta를 통한 Workload Identity Federation과 Federated Tokens를 활용한 GCP에서 Context기반의 예제를 살펴보자

## Authenticating Applications with GCP

- GCP서비스에 접근하는 application은 servcie account를 통해 인증 받아야함
- service account는 `interactive authentication`이 필요없는 종류의 identity

    `<Service Account Name>@<Project ID>.iam.gserviceaccount.com`

- GCP IAM Role과 privileges(권한)은 사용자ID에 할당되는 것 처럼 email참조을 통하여 Service Account에 할당가능
- 프로잭트내에서 생성되지만 다른 프로젝트의 IAM Role과 privileges를 가질 수 있음
- application이 service account id로 인증하면 sa로 엑세스 할 수 있는 모든 리소스에 접근가능  
- GCE위에서 실행되는 app

## Workload Identity Federaion

- <https://kubernetes.io/ko/docs/concepts/scheduling-eviction/assign-pod-node/>
- <https://kubernetes.io/ko/docs/tasks/configure-pod-container/assign-pods-nodes-using-node-affinity/>
- <https://velog.io/@pinion7/Kubernetes-%EB%A6%AC%EC%86%8C%EC%8A%A4-Affinity%EC%97%90-%EB%8C%80%ED%95%B4-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B3%A0-%EC%8B%A4%EC%8A%B5%ED%95%B4%EB%B3%B4%EA%B8%B0>