---  
layout: post  
title: "[Cloud Function]How does BigQuery work"  
subtitle: "Cloud Function - How does BigQuery work"  
categories: gcp
tags: cf 
comments: true  
---  

### Calling a private Google Cloud Function from on-prem
![cloudfunction](/assets\img\cloudfunction\on-prem-archi.png)
- 요건 :
	- 많은 enterprise고객들이 Google Professional Service에게 어떻게 on-prem 서버에서 비공개적인 방법으로 (인터넷에 노출시키지 않고) Cloud Function을 호출하는지 문의
	- 보안상 이유로 그들은 Cloud Function의 endpoint를 Public 인터넷에 노출을 꺼림
	- 고객의 on-prem의 망과 GCP Private network에서 네트워크 트래픽이 흐르도록 원함
- 개요 :
	- 새로운 Cloud Function을 생성 시 ingress setting을 `allow internfal traffic`으로 설정 가능하지만, documnet를 자세히 읽으면 `Only requests from VPC network in the same project or VPC Service Controls Perimeter are allowed. All other request are denied with 403 error`라고 적혀있음
		- 이 의미는 deploye되는 같은 프로젝트가 아닌 이상 function 호출이 불가능

#### Private Service Connect to the rescue
PSC(Prviate Service Connect)는 당신의 프로젝트의 VPC Network(Cloud Function을 포함)내부에서 생성한 end-point를 통해 Google Cloud Service 접근가능 하도록함

![Private Service Connect endpoint](https://miro.medium.com/v2/resize:fit:750/format:webp/1*6ZQY0yrS8raNPJtUbZkaGA.png)

- storage.googleapis.com와 같이 서비스 endpoint API 요청을 publicl 가능한 IP에 보내는 대신에, 요청을 Private Service Connect endpoint를 통해 internal 호출이 가능
- 이 end-point로 호출되는 모든 call들은 같은 프로젝트에서 생성된 것 같이 취급됨

#### Complete the design with some DNS and routing
- PSC이 준비 된 후 해야할일은 on-prem DNS에서 특정 프로젝트에서 Cloud Function의 subdomain을 각각 부를 수 있도록  endpoint를 생성해야됨
- 각각의 Function은 URL format `https://YOUR_REGION-YOUR_PROJECT_ID.cloudfunctions.net/FUNCTION_NAME`
- on-prem DNS에서 위의 URL을 translate 할 수있어야함
- 마지막 할일은 on-prem에서 PSC로 routing 되도록 설정 (HA VPN or CLoud Interconnect)
- Cloud Router를 활용해서 BGP세션을 맺어야함 (Google Cloud 와 on-prem환경)
- BGP 세션을 통해 PSC의 IP를 on-prem에 광고 시킬 수 있음
---
<!--more-->

### 참조
= [medium : calling-private-google-cloud-from-on-prem](https://medium.com/google-cloud/calling-a-private-google-cloud-function-from-on-prem-91eb628c85ac)
- [cloud function network setting](https://cloud.google.com/functions/docs/networking/network-settings?hl=ko#ingress_settings)
- [coursera : bigquery-fast-sql-engine](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/H1irf/bigquery-fast-sql-engine)