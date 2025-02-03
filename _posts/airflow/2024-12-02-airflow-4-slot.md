---
title: "(4) Apache Airflow Slot개념"
date : 2024-12-02 09:00:00 +0900
categories: [Airflow,Slot]
tags : [airflow,slot]
---



### **Apache Airflow Slot**

`Slot`은 DAG및 Task를 실행을 제어하기 위해 중요한 개념. 시스템 리소스 사용을 조율하는 역할. `Running slots`와 `Queued Slots`는 특히 Task가 실행되거나 실행 대기 중일떄 사용하는 용어

#### **1. Slot개념**

- Airflow의 slot은 Executor(LocalExecutor,CeleryExecutor,KubernetesExecutor)가 task실행을 관리하는데 사용
- 특정 Executor는 제한된 슬록 수를 할당하여 시스템 과부하를 방지하고 자원을 효율적으로 사용

#### **2. Running Slot**

- **정의** : 현재 실행중인 task들이 사용중인 slot의 수를 의미
- **역할**
  - 동시에 실행할 수 있는 task수를 제한
  - ex `parallelism=10`인 경우 최대 10개의 task만 동시에 수행 이 중 실행 중인 task는 Running slot으로 집계
  - `Web UI > Browse > Taks Instacnes`에 task상태를 통해 확인 가능 
  
#### **3. Queued Slot**

- **정의** : 실행 가능한 상태에 있지만, 실행 가능한 slot이 부족 하여 대기중인 task가 차지하는 slot수를 의미
- **역할**
  - slot 제한으로 task가 즉시 실행되지 못하고 대기열에 쌓임
  - `Web UI > Queued`상태로 표시된 task를 통해 확인가능

#### **4. Slot관련 주요 설정**

##### **Global Paralleslism**

- 설정위치 : `airflow.cfg`
- 옵션
  - `parallelism=32`
  - 전체에서 동시에 실행 가능한 task의 최대 수를 정의

##### **DAG Level Paralleslism**

- 설정위치 : DAG파일에서 `DAG`객체 정의
- 옵션
- 
```
dag = DAG('example_dag', max_active_tasks=10)
```
  - 특정 DAG에 동시에 실행 가능한 태스크의 최대수를 정의
  
##### **Task Level Slots**

- 설정위치 : Operator의 `task`에서 정의
- 옵션
- 
```
my_task = PythonOperator(
    task_id='example_task',
    python_callable=my_function,
    pool='custom_pool'
)

```
  - 특정 pool에서 task가 사용가능한 slot수를 제한
  
### **참고**
- <https://github.com/mjs1995/muse-data-engineer/blob/main/workflow/airflow/airflow_architecture.md>
- <https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/overview.html#airflow-components>
- <https://medium.com/apache-airflow/airflow-architecture-simplified-3d582fc3ccb0>
- <https://tommypagy.tistory.com/669>
- <https://medium.com/29cm/29cm-apache-airflow-%EC%9A%B4%EC%98%81%EA%B8%B0-da6b5535f7a6>