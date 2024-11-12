---
title: "Confluent 개념"
categories: [Confluent, keyword]
tags : [confluent]
---

## Confluent 
---

### **Topic**

Conflunet Platform에서 Kafka Topic 생성방법은 
- Kafka CLI
  ```
  kafka-topics --create \
    --topic <topic_name> \
    --bootstrap-server <broker_address> \
    --partitions <number_of_partitions> \
    --replication-factor <replication_factor>
  ```
- Confluent Control center
-  UI를 통해서 생성 
- Kafka Admin REST API
  ```
  curl -X POST http://localhost:8082/topics \
    -H "Content-Type: application/vnd.kafka.v2+json" \
    -d '{
          "topic": "my-topic",
          "partitions": 3,
          "replication_factor": 2,
          "configs": {
            "retention.ms": "604800000"
          }
        }'
  ```
--------------------------------------

- 자동 topic 생성이 있음

<br/>

###  **Replicator Connector**
- https://docs.confluent.io/platform/current/multi-dc-deployments/replicator/index.html
- https://www.confluent.io/hub/confluentinc/kafka-connect-replicator
- https://www.confluent.io/blog/15-facts-about-confluent-replicator-and-multi-cluster-kafka-deployment/?utm_source=confluent_hub&utm_term=kafka-connect-replicator&utm_content=plugin_deployment_options&_ga=2.185627497.1731761582.1731044983-1086034599.1727195938&_gl=1*5v2sa9*_gcl_aw*R0NMLjE3MzEwNDQzODIuQ2owS0NRaUE1N0c1QmhEVUFSSXNBQ2dDWW56dzZJNjhGZ2czbzFQRUlteUdIOVJGWFduelhkQklXLU01TE1LMy04ZXFnSVEzZXJlVlFBOGFBZ0NkRUFMd193Y0I.*_gcl_au*NTgxMTgyNjA5LjE3MjcxOTU5Mzg.*_ga*MTA4NjAzNDU5OS4xNzI3MTk1OTM4*_ga_D2D3EGKSGD*MTczMTA0NDM4MS40LjEuMTczMTA0ODEyOC42MC4wLjA.

-  Replicator는 기 사용중인 connector 분리구성을 권장
이것은 src.kafka.bootstrap-server 필드가 replicator 대상 클러스터가 아닌 
소스 클러스터를 가리킬 수 있는 다른 커넥터에서 사용되기때문에 다른 커넥터로부터 격릴 제공하고
replicator를 설정할떄 혼동을 방지 
또 다른 connector와 격리함으로써 자원에 대한 경쟁상황(race condition)을 배제할수 있어 
중요데이터 복제를 위해 자원 사용을 최적화 가능 

<br/>


###  **ACL**
Confluent ACL은 Kafka 및 Confluent Platform에서 엑세스제어목록(Access Control List)
기능을 통해 사용자 및 애플리케이션 권한을 관리하는 시스템

Kafka 클러스터 Topic,Consumer,Cluster등에 대한 접근권한을 세부적으로 설정하여 
데이터 보안을 강화하고, 사용자 애플리케이션이 수행할 수 있는 작업을 제한적으로 함

<br/>

###  **Connector**
Confluent의 kakfa connector는 source와 sink 2가지 유형으로 나움.
각 connector는 특정 시스템과 kafka간의 데이터 통합을 하는 역할 
1. Source connector
: 외부시스템에서 Kakfa로 데이터를 가져오는 역할. 다양한 시스템에서 데이터를 수집하여 
kafka로 전송하느데 사용 
ex) 
database source connector (jdbc,debezium)
clodu source connector (aws s3,gcs)
file source connector(local file system)

2. Sink connector
kafka에서 외부 시스템으로 데이터를 전송하는 역하을 함

3. Transformational connecotr
transform 기능을 활용하여 데이터를 소스와 싱크로 전송하기전에 변환하는 기능.
데이터 형식 변환/필드 필터링에 유용

4. Replicator Connector 
kafka 클러스터간 데이터를 복제하는데 특화된 커넥터 
. 사용목적
- 멀티 클러스터 환경에서 데이터 동기화 
- 고가용성 및 재해복그를 위한 클러스터복제
. 데이터 동기화 방식 : 동일한 topic을 대상으로 cluster간에 message를 복제

5. Streaming, Event Processing Connector
실시간 스트리밍 처리가 피룡한 경우 사용

<br/>

### 참조
- https://docs.confluent.io/kafka/kafka-apis.html
- - https://docs.confluent.io/platform/current/kafka-rest/index.html