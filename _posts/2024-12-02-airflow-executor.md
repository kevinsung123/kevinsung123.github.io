---
title: "Apache Airflow Executor개념"
date : 2024-12-02 09:00:00 +0900
categories: [Airflow,CeleryExecutor]
tags : [airflow,celeryexecutor]
---



### **Apache Airflow Slot**

`Slot`은 DAG및 Task를 실행을 제어하기 위해 중요한 개념. 시스템 리소스 사용을 조율하는 역할. `Running slots`와 `Queued Slots`는 특히 Task가 실행되거나 실행 대기 중일떄 사용하는 용어

### **참고**
- <[[text](2024-12-02-airflow-slot.md](https://airflow.apache.org/docs/apache-airflow-providers-celery/stable/celery_executor.html))