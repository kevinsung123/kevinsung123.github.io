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
![web server](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*xJvNvs6AaCus10W38OF5Uw.gif)
  
#### **Scheduler**

- `task`의 실행(execution)을 관리 
- `DAGS`과 `schedule task`를 그들의 dependencies에 기반으로 모니터링하고  
![scheduler](https://miro.medium.com/v2/resize:fit:828/format:webp/1*FdXjpygIU1EdBaZ7n8vpxg.gif)

#### **Executor**

- 주요 role은 task를 수행시키는것
- `scheduleer`와 상화작용하여 task의 상세정보를 얻고 task 수행에 필요한 process 또는 container를 시작시킴
- Airflow는 다양한 Executor Type을 제공. 각각은 특정 인프라 설정 및 운영요구사항에 맞게 조정
  - ex) LocalExecutor, CeleryExecutor,KubernetesExcecutor 
![executor](https://miro.medium.com/v2/resize:fit:828/format:webp/1*vVCX0toozRV6kwlc9SWVqg.gif)

#### **Worker**

- Executor에의해 할당된 task가 수행되는 역할 구성
- 선택된 Executor에 의해, process나 container를 분리시킬 수 있음
- Worker는 실제 code나 script를 수행 역할을 담당하고, 그들의`status`를 Executor에 레포팅
![worker](https://miro.medium.com/v2/resize:fit:828/format:webp/1*ylFHMKEf8yvk35XcJWiftA.gif)

#### **Metadata Database**

- Airflow의 설정한 task의 상세정보 그리고 과거에 어떻게 수행되었느지를 포함한 모든 `workflow` 를 추적
- `scheduled task`과 관련된 모든것들은 저장하고 구성
- 작업의 모든 진행 상황을 살펴보고 발생할 수 있는 문제를 해결하는데 도움
- PostgreSQL, MySQL, SQLite등 다양한 db를 유연성을 제공
![metabase database](https://miro.medium.com/v2/resize:fit:828/format:webp/1*dQeTkFdzs8P_WCOAt68r7Q.gif)

#### **Message Broker**

- CeleryExecutor가 작업 배포에 사용되는 설정에서 message broker는 매우 중요한 역할을함
- `RabbitMQ`또는 `Redis`와 마찬가지로 `scheduler`와 `worker`사이의 중개자역할을 함
- `scheduler`에서 `worker`로 작업 세부 정보를 전달하여 원활한 통신을 보장하고, 작업이 분산 시스템 전반에서 안정적이고 효율적으로
실행 되도록 보장
![message broker](https://miro.medium.com/v2/resize:fit:828/format:webp/1*eOsKdwCTzqwGHs_YaDIn4A.gif)


#### **Airflow 기본동작 원리**
![airflow](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FliBJY%2FbtsH7g6Uecz%2FX3RSVOHSAkxlfmFh44nLZ0%2Fimg.png)
1. usr가 새로운 dag을 생성 -> dags folder안에 py 파일배치 
2. web server와 scheduler가 파싱하여 읽어옴
3. `scheduler`가 `metastore`를 통해 `DagRun` 오브젝터를 생성
  - `DagRun`은 사용자가 작성한 Dag의 instance
4. `scheduler`는 Task Instnace Object를 스케쥴링함
5. 트리거가 상황이 맞으면 `scheduler`가 task instance를 executor로 보냄
6. executor는 task instaance를 실행시킴
7. 완료 후 `metastore`에 완료되었다고 보고
   - 완료된 Task instance는 Dag Run에 업데이트
   - `scheduler`는 Dag이 실행이 완료되었는지 `metastore`를 통해 `Dag Run`상태를 완료로 바꿈
8. `metastore`가 `webserver`에 업데이트하여 사용자도 확인

!(https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FoxC38%2FbtsH6iLo13m%2FBpCV2JTZp8YioeU8vas2vK%2Fimg.png)
### **참고**
- <https://github.com/mjs1995/muse-data-engineer/blob/main/workflow/airflow/airflow_architecture.md>
- <https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/overview.html#airflow-components>
- <https://medium.com/apache-airflow/airflow-architecture-simplified-3d582fc3ccb0>
- <https://tommypagy.tistory.com/669>