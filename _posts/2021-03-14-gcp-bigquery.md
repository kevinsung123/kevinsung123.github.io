---  
layout: post  
title: "[BigQuery]How does BigQuery work"  
subtitle: "BigQuery - How does BigQuery work"  
categories: gcp  
tags: bigquery work 
comments: true  
---  

### BigQuery is two services in  one
1. Fast SQL Engine
2. Managed storegae for dataset
	- serverless service
	- fully managed 

---
<!--more-->

### How does BigQuery work?
![bigquery](/assets\img\post_img\2021-03-14-bigquery.PNG)
- user는 BigQuery가 어덯게 data를 disk에 저장하는지 걱정 할 필요 없음
- large queries들에 대해 어떻게 machine들을 autoscale하는지 걱정 할 필요 없음

- data 관리는 project > dataset > table로 관리
- table들은 `highly-compressed columns`으로 저장
- Goole의 내부적인 file-system인 `Colossus`는 아래 2가지 특성을 제공
	- durablity
	- global availability
- 모든 data는 project team에 의해서만 접근 가능 
- storage서비스는 `bulk data ingestion` 그리고 `streaming data ingestion`을 제공
- Query서비스 아래 방법을 제공
	- interactive(상호작용) 작동(Console,bq cli)
	- batch queries(Console,bq cli)
	- REST API - 7 languaged supported
- BigQuery Connector를 제공하여 BigQUery와 아래 GCP 데이터 처리 서비스간 복잡한 workflow를 간단하게 해줌
	- DataProc
	- Cloud Dataflow 
- `Storage서비스`와 `Query서비스`는 내부적으로 쿼리를 생성하고 terabytes, petabytes의 데이터를 효율적으로 처리하도록 작동