---
title: "BiQuery Slot 및 사용현황 (메타데이터)"
date : 2024-12-04 09:00:00 +0900
categories: [GCP,BigQuery,Slot]
tags : [gcp,bigquery,slot]
---



### **BigQuery Slot**

slot은 BigQuery에서 쿼리 실행을 처리하는 데 사용되는 계산 리소스 단위. 분산 처리 아키텍처에서 작업을 병렬로 처리하기 위해 사용되며 데이터를 스캔하고,필터링하고, 집계하는 등의 작업을 수행

- BigQuery가 사용하는 `cpu 및 memoory`리소스 단위
- 작업의 복잡성에 따라 필요한 slot의 수를 자동으로 할당

#### **total_slot_ms**

- slot의 수와 시간(milliseconds)을 곱한값
- 계산 방식 : `total_slot_ms=slots_count X execution_time_in_ms`
- 예시
  - 쿼리가 실행되는 동안 50개 slot을 사용했고 쿼리 실행 시간이 2초(2000ms)였다고 가정하면 total_slot_ms=50X2000=100,000ms
- 평균 slot의 수는 아래 식으로 계산 가능
  
$$
slot 수 = total_slot_ms/query_execution_time_ms
$$

#### **total_bytes_billed**

- 쿼리를 실행하기 위해 `청구된 데이터 처리량`
- 최소 청구단위 : `10MB` (쿼리가 이보다 작아도 10MB청구)
- 데이터는 1MB단위로 올림처리

#### **특정일 사용자별 job별 쿼리사용현황**

- BigQuery `INFORMATIon_SCHEMA.JOBY_BY_PROJECT` view를 통해 사용자별 상세 현황 파악

```
SELECT 
 FORMAT_TIMESTAMP('%Y-%m-%d', DATETIME(creation_time.'Asia/Seoul)) as day,
 DATETIME(creation_time.'Asia/Seoul) as date,
 FORMAT_TIMESTAMP('%Y-%m-%d %H', DATETIME(creation_time.'Asia/Seoul)) as date_hh,
 project_id,
 user_email,
 job_id,
 query,
 ROUND(total_bytes_billed/POWER(1024,3),2) as billed_gb,
 total_slot_ms,
 ROUND(total_slot_ms/1000,2) as total_slot_minutes,
 DATETIME(start_time,'Asia/Seoul') as start_time,
 DATETIME(end_time,'Asia/Seoul') as end_time,
 TIMESTAMP(end_time,start_time,SECOND) as execution_time_seconds
FROM `region-asia-northeast3`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WEHRE  DATE(cretaion_time) ='2024-12-02'
ORDER BY 1 desc
;
```

### **참고**

- <https://airflow.apache.org/docs/apache-airflow-providers-celery/stable/celery_executor.html>
