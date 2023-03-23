---  
layout: post  
title: "[Network] VPC Peering"  
subtitle: "GCP Network "  
categories: gcp
tags: nw
comments: true  
---  

## VPC Peering 

---

### VPC Network Peering 

- Google Cloud VPC 네트워크 피어링은 `2개의 VPC(Virtual Private Cloud) 네트워크를 연결하여 각 네트워크 리소스가 서로 통신 가능 하도록 함`
    - 모든 subnet은 내부 IPv4주소를 사용하여 통신 가능
    - 이중 스택 subnet 또한 Ipv6주소 이용하여 통신 가능
- peering된 vpc 네트워크는 동일 프로젝트, 동일 조직의 프로젝트, 다른 조직의 프로젝트에 설정 가능

### VPC Network Peering의 이점(Benefit)
- 하나의 VPC NW에서 다른 VPC NW로 `Private SaaS 서비스 게시 가능`
- VPC NW Peering은 `GCE, GKE, App Engine 가변형 환경`에서 작동
- Peering 연결을 사용하여 제공되는 패킷은 `Google Production network 유지`
- `Network Latency` : 내부 주소로만 연결은 외부 주소 사용 연결보다 latency가 짧다
- `Network Security` : 서비스 소유자는 Public 환경에 서비스 노출하여 위험을 감수 할 필요가 없음
- `Network Cost` : Google Cloud는 트래픽이 같은 영역내에 있더라도 외부IP주소를 사용하여 통신하는 network에 대해서 `이그레이드 대역폭 가격(charging egress bandwidth pricing)`을 청구. 그러나 Peering된 NW경우 내부 IP 주소 사용하여 통신하면 이러한 이그레스 비용을 절약. 



### Specifications
#### General specifications

- VPC NW Perring은 GCE,GKE,App Engine등 가변환경에서 작동
    - 기본적으로 GKE를 사용한 VPC NW Peering `IP aliases`함께 사용할 경우 지원. 이를 사용하지 않으면 Peering된 NW에서 GKE컨테이너에 엑세스 할 수 있도록 커스텀 경로를 내보낼 수 있음
- VPC NW Peering은 VPC NW만 지원. legacy NW는 지원 불가능
- IPv4,IPv6 모두 지원
- 1개의 VPC NW엣 여러개의 VPC NW 할 수 있지만 제한이 있음

#### Administrative specifications
- Peered VPC NW는 관리 측면에서 분리된 상태로 유지
    - Route, Firewall, VPN, 기타 traffic 관리도구는 각 VPC NW에서 개별적으로 관리
- Peering 연결 설정을 위하여 `각 VPC 네트워크에 대한 관리자가 다른 VPC 네트워크에대해 피어링 연결을 만들어야함`. 해제는 어느 한쪽이라도 가능
- Peering 연결의 각 측은 독립적으로 설정. 양 측의 구성이 일치하는 경우메나 활성화 됨. 
- Peering 연결을 만들어도 다른 VPC NW에대해 IAM역할이 부여되지 않음.


### VPC NW Peering 구성하기
Google Cloud VPC NW Peering은 동일한 프로젝트에 속하는지 또는 동일한 조직에 속하는지 상관 없이 VPC NW에서 private IP주소를 연결가능

#### 1. VPC NW이름 설정
- 해당 NW가 다른 프로젝트에 있는 경우 프로젝트ID도 필요
- 다른 VPC NW에 연결할 `인텐트`설정
- 두 피어링구성 상태가 `ACTIVE`로 변경되어야함. 다른 피어링 구성이 없으면 피어링 사태가 `INACTIVE`가됨

#### 2. 서브넷 경로 교환
- 두 네트워크가 연결되면 항상 서브넷 경로를 교환 

```
gcloud compute networks peerings create PEERING_NAME \
    --network=NETWORK \
    --peer-project=PEER_PROJECT_ID \
    --peer-network=PEER_NETWORK_NAME \
    [--stack-type=STACK_TYPE] \
    [--import-custom-routes] \
    [--export-custom-routes] \
    [--import-subnet-routes-with-public-ip] \
    [--export-subnet-routes-with-public-ip]
● PEERING_NAME: 피어링 구성의 이름
● NETWORK: 피어링할 프로젝트의 네트워크 이름
● PEER_PROJECT_ID: 피어링할 네트워크가 포함된 프로젝트의 ID
● PEER_NETWORK_NAME: 피어링할 네트워크의 이름
● STACK_TYPE: 피어링 연결의 스택 유형입니다. IPv4 경로만 교환하려면 IPV4_ONLY를 지정합니다. 또는 IPv4 경로와 IPv6 경로를 모두 교환하도록 IPV4_IPV6를 지정합니다. IPV4_ONLY가 기본값입니다.
● --import-custom-routes는 피어링된 네트워크의 커스텀 경로를 수락하도록 네트워크에 지시합니다. 피어링된 네트워크는 먼저 경로를 내보내야 합니다.
● --export-custom-routes는 커스텀 경로를 피어링된 네트워크로 내보내도록 네트워크에 지시합니다. 피어링된 네트워크는 경로를 가져오도록 설정되어야 합니다.
● --import-subnet-routes-with-public-ip는 네트워크가 서브넷에서 비공개로 사용되는 공개 IPv4 주소를 사용하는 경우 피어링된 네트워크의 서브넷 경로를 수락하도록 네트워크에 지시합니다. 피어링된 네트워크는 먼저 경로를 내보내야 합니다.
● --export-subnet-routes-with-public-ip는 비공개로 사용되는 공개 IP 주소가 포함된 서브넷 경로를 내보내도록 네트워크에 지시합니다. 피어링된 네트워크는 경로를 가져오도록 설정되어야 합니다.
```

### VPC Peering 목록 표시 
- 기존 Peering 연결목록을 표히사여 해당 상태와 커스컴 경로를 가져오는지 또는 내보내는지 여부를 확인 
```
gcloud compute networks peerings list
```

### VPC Peering 연결 목록 표시 
- 내 VPC NW가 Peered NW에서 가져오거나 내보내는 동적경로를 나열 
- 내보낸 경우 Peerd NW가 커스텀 경로를 수락 또는 거부 확인 가능
- 가져온 경우 Peered NW가 Peer NW에서 커스텀 경로를 수락 또는 거부 확인 

```
gcloud compute networks peerings list-routes PEERING_NAME \
    --network=NETWORK \
    --region=REGION \
    --direction=DIRECTION
    PEERING_NAME: 기존 피어링 연결의 이름입니다.
● NETWORK: 피어링된 프로젝트의 네트워크 이름입니다.
● REGION: 모든 동적 경로를 나열하려는 리전입니다. 서브넷 및 정적 경로는 전역 경로이며 모든 리전에 표시됩니다.
● DIRECTION: 가져온(incoming) 경로나 내보낸(outgoing) 경로를 나열할지 여부를 지정합니다.
```

### VPC Peering 예시



### 참조
[Google Doc - VPC Network Peering](https://cloud.google.com/vpc/docs/vpc-peering?hl=ko)
[Google Doc - VPC Network Peering 구성 만들기](https://cloud.google.com/vpc/docs/using-vpc-peering?hl=ko)