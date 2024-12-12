---
title: "(1)Apache Spark란?"
date : 2024-12-05 09:00:00 +0900
categories: [Spark,COnecpt]
tags : [spark,conecpt]
---


#### **Apach Spark역사와 개념**

- `2019-2010` Matei Zahariz`의 UC Berkly의 AMP Lab에서 `2009`년 개발 그리고 `2010` BSD License로 공개
- `BSD License` : **BSD 라이센스(Berkeley Software Distribution License)**는 소프트웨어의 소스 코드를 수정하고 배포할 수 있는 권한을 제공하는 자유 소프트웨어 라이센스 중 하나입니다. 이 라이센스는 원래 1980년대 후반과 1990년대 초반, 유닉스 기반 운영 체제인 **BSD(Unix의 한 변형)**의 소프트웨어 배포를 위해 사용되었습니다. BSD 라이센스는 그 간결함과 자유로운 사용, 수정 및 배포 권한 덕분에 매우 널리 사용됩니다.
- `2013` 프로젝트는 Apache재단에 기부가되었고 `Apache2.0`라이센스로 변경 
- `2014` Top-level Apache project가됨
- `2014` M.Zahariz(Spark개발)는 `Databrics`회사를 창립
- 대규모 데이터 처리용 통하분석 엔진`unified analytics engine for large-scale data processing`
- 일반적인 목적 
  - interactive processing
  - Extremly fast batch processing
  - Real time stream proceessing
  - Distributed machine learning modeling and inference engine 
- `in-memory` 분산 컴퓨팅 엔진

#### **Why is Apache Spark popular?**

- `Hadoop Ecosystem`의 차세대 `processing engine`
- 아래와같 task에 사용
  - ETL and Data Cleansing
  - SQL batch job (대규모 데이터셋)
  - sesoors,IoT,금융시스템으로부터 `Processing streaming data`
  - Machine leanring 그리고 inferece(추론)

#### **The Problem with Map Reduce**
- MR작업은 여러 cycle의 `Map그리고 Reduce`로 구성
- 각각의 `MAP`은 HDFS로부터 읽고 local disk로 쓰기가 필요
- 각각의 `Reduce`작업은 local disk로부터 읽고 HDFS로 쓰기가 필요
- `Disk I/O`연산은 매우 비싼 연산
  
#### **Evolving Hardware : Cost and Performance**

- `2007` Hadoop 0.14.1 소개
  - `HDFS`와 `MapReduce`는 disk기반의 storage에 매우 의존적
- `2013` Apache Spark 0.7.0 소개
  - `memory`비용을 거의 `1/50`로 줄임
- `2016` Apache Kudu1.0소개 SSD Storage에 최적화됨

#### **In-memory Distributed Computation**

- `disk I/O`비용은 최초의 데이터를 memory로 올릴떄만 필요 
- `computation cycle`동안 storeage 기반의 `memory`를 사용 
- `MapReduce`에 비해 일반적 100+times 빠름
![map-reduce](D:\github\kevinsung123.github.io\assets\img\2024-12-12-spark\spark_1.png)

### **참고**
- <https://medium.com/nerd-for-tech/apache-spark-multi-part-series-what-is-apache-spark-63c3f6caa3c>