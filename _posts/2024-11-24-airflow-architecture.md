---
title: "Apache Airflow Architecture"
date : 2024-11-25 09:00:00 +0900
categories: [Airflow,architecture]
tags : [airflow,architecture,]
---



### **Apache Airflow**
Airflow는 복잡한 data workflow을 orchestrate하기 위해 설계된 open source platform이다. `DAG(Directed Acyclic Graphs)`를 사용하여 일련의 `task와 그들간의 dependencies`를 정의한다. 다양한 component로 구성되어있으면 차례대로 살펴보자
![airflow architecture](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*SxYErMAzuN0MXQryQfpGLQ.gif)

### **Components**

#### **Web Server**
- 모니터링, dag, variables, connection을 관리하며 log를 체크할 수 있는 Airflow UI
- data workflow를 시각화시키고, progress를 check하며 어떤 issue를 트러블슈팅 하게 함
- ![web server](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*xJvNvs6AaCus10W38OF5Uw.gif)
  
#### **Scheduler**
- `task`의 실행(execution)을 관리 

### **참고**
- <https://github.com/mjs1995/muse-data-engineer/blob/main/workflow/airflow/airflow_architecture.md>
- <https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/overview.html#airflow-components>
- <https://medium.com/apache-airflow/airflow-architecture-simplified-3d582fc3ccb0>