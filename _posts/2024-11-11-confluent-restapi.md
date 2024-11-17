---
title: "Confluent Connect REST API"
categories: [Confluent, Connect REST API]
tags : [confluent]
---





### Kafka Connect's  REST API (curl)

#### connector  조회
```bash
curl -s -X GET "http://localhost:8083/connectors/"
```
#### connector  config와 status 상세 확인 

```bash
curl -i -X GET -H  "Content-Type:application/json" \
       http://localhost:8083/connectors/sink-elastic-orders-00/config
```	   
<br/>


#### connector의 리스트 및 구성을 보기좋게 출력

- 아래 명령어는 Kafka Connect의 커넥터들의 상태와 구성을 손쉽게 조회하고, 이를 보기 좋게 정리하여 출력하는 데 사용됩니다.

```bash 
curl -s "http://localhost:8083/connectors?expand=info&expand=status" | \
jq '. | to_entries[] | [ .value.info.type, .key, .value.status.connector.state,.value.status.tasks[].state, .value.info.config."connector.class"] |join(":|:")' | \
column -s : -t| sed 's/\"//g'| sort
```

<br/>

```
 전체 흐름 설명
- curl로 Kafka Connect의 커넥터 정보와 상태를 가져옵니다.
- jq로 JSON 데이터를 변환하여, 각 커넥터의 타입, 이름, 상태, 작업 상태, 클래스 정보를 추출하고, 이를 ":|:"로 구분된 문자열로 만듭니다.
- column 명령어로 출력 결과를 테이블 형식으로 예쁘게 정렬합니다.
- sed 명령어로 큰따옴표를 제거하여 출력 결과를 깔끔하게 만듭니다.
- sort로 알파벳 순으로 결과를 정렬하여 출력합니다.
1. curl -s "http://localhost:8083/connectors?expand=info&expand=status"
curl 명령어는 Kafka Connect REST API로 HTTP 요청을 보내서 커넥터 목록과 그 상태를 가져옵니다.
-s 옵션은 curl의 출력을 "조용하게" 만들어서 진행 정보를 숨깁니다.
?expand=info&expand=status는 각각 커넥터의 **설정 정보(info)**와 **상태(status)**를 함께 요청합니다.
2. jq '. | to_entries[] | [ .value.info.type, .key, .value.status.connector.state, .value.status.tasks[].state, .value.info.config."connector.class"] | join(":|:")'
jq는 JSON 데이터를 처리하는 도구입니다. 이 부분은 JSON 데이터를 다음과 같이 처리합니다:
to_entries[]: JSON 객체를 키-값 쌍의 배열로 변환합니다. 각 커넥터에 대해 하나씩 처리합니다.
[ .value.info.type, .key, .value.status.connector.state, .value.status.tasks[].state, .value.info.config."connector.class"]: 각 항목에 대해 커넥터 타입, 커넥터 이름, 커넥터의 상태, 각 작업(task)의 상태, 커넥터 클래스 정보를 추출합니다.
join(":|:"): 각 항목을 ":|:"로 구분된 하나의 문자열로 연결합니다. 이 구분자는 나중에 출력 결과를 보기 좋게 만들기 위해 사용됩니다.
3. column -s : -t
column 명령어는 텍스트를 테이블 형식으로 정렬하여 출력합니다.
-s :는 각 항목을 : 구분자로 분리하라는 의미입니다.
-t는 테이블 형식으로 출력하도록 지정합니다.
4. sed 's/\"//g'
sed 명령어는 텍스트를 수정하는 데 사용됩니다. 여기서는 "\"" (큰따옴표)을 모두 제거합니다.
이는 출력 결과에서 불필요한 따옴표를 제거하여 좀 더 깔끔하게 보여주기 위한 처리입니다.
 5. sort
sort 명령어는 결과를 알파벳 순으로 정렬합니다.
```
<br/>

#### connector 및 tasks 재시작

```bash
curl -s -X POST "http://localhost:8083/connectors/source-debezium-orders-00/restart"
```


#### Pause and Resume a Connector 

- pause 
```bash 
curl -s -X PUT "http://localhost:8083/connectors/source-debezium-orders-00/pause"
```
- resume 
```bash
curl -s -X PUT "http://localhost:8083/connectors/source-debezium-orders-00/resume"
```

#### Connector에서 사용하는 Topic 가져오기 

```bash
curl -s -X GET "http://localhost:8083/connectors/source-debezium-orders-00/topics" | jq '.'
```

#### Connector 생성 
```bash
curl -X POST -H "Content-Type: application/json" -d @your_connector.json http://localhost:8083/connectors
```

#### Reference
- https://developer.confluent.io/courses/kafka-connect/rest-api/
- https://docs.confluent.io/platform/current/kafka-rest/index.html
