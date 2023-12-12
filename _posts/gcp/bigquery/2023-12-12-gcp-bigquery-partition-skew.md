---  
layout: post  
title: "[BigQuery] Avoid partition skew on BigQuery"  
subtitle: "Avoid partition skew on BigQuery"  
categories: gcp
tags: bigquery 
comments: true  
---  


## Avoid partition skew on BigQuery
### What is partition skew?
- 특정컬럼을 기준으로 데이터를 그룹화할떄, 어떤 값이 다른 값들보다 훨씬 더 자주 발생하여 해당 파티션 크게 되는 문제 이를 `data skew`라고함
- 이로 인해 오버사이즈 된 파티션을 처리하는 slot 다운이 될 수 있음
- example
 - 인도라는 국가가 미국이나 페루보다 1만배 더 많이 나타나는 데이터를 국가열을 기준으로 그룹화하거나 조인하는 쿼리를 실행하면, 인도가 속한 파티션이 너무 커져서 `resourceExceeded`에러가 발생 할 수있음

![example](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*f72E6akyQ5QGd_vMHK_2yA.png)


### Solutions
- 완벽한 해결책은 없지만, 다음과 같은 방버으로 data skew를 완하 할 수 있음
#### 1. APPROX_TOP_COUNT 함수 사용 
- 일반적은 group by, order by,  count대신 위의 함수를 사용하여 data skew를 근사적으로 파악 
```
SELECT APPROX_TOP_COUNT(descript, 8) AS approx_top_count
FROM `bigquery-public-data.austin_incidents.incidents_2016`;

```
#### 2. partition skew의 다른 식별방법
- 실행 그래프를 확인하여 대기(ms)값의 유효성 검증하고 평균과 최대의 계신 시간 간의 차이를 식별

#### 3. data skew를 식별 한 후, 필요한 변환을 모두 확인하고 불균형 키가 있는 테이블에 가능한 일찍 필터를 할당

#### 4. 쿼리를 두개의 다른 쿼리나 단계로 분할
- With절을 사용햔 쿼리는 임시로 테이블을 만들고 JOIN을 실행 가능 
```
WITH
  comments AS (
  SELECT
    user_id,
    COUNT(text) AS comments_count
  FROM
    `bigquery-public-data`.stackoverflow.comments
  WHERE
    user_id IS NOT NULL
  GROUP BY user_id
  ORDER BY comments_count DESC
  LIMIT 20
  )
SELECT
  user_id,
  display_name,
  reputation,
  comments_count
FROM comments
JOIN
  `bigquery-public-data`.stackoverflow.users AS u
ON
  user_id = u.id
ORDER BY comments_count DESC;
```
#### 5. where절에 subquery를 추가하는 경우, `select distinct`문을 사용하여 유일한 필드값을 한번 평가 
```
mytable.country NOT IN (
  SELECT DISTINCT my_country
  FROM global_table
  )
```

### Conclusion
- data skew는 데이터간 파티션간에 균등하게 분배되지 않을때 발생하며, 이는 BigQuery에서 대규모 데이터셋을 처리할때 `성능과 비용`에 중대한 영향을 미칠 수 있음
- BigQuery에서는 data skew 식별을 위해 insight와 metric을 제공
- BigQuery에서 대규모 데이텃세을 처리할때 data skew는 `성능과 비용` 중대한 영향을 미칠 수 있음 


- [medium](https://medium.com/google-cloud/avoid-partition-skew-on-bigquery-google-cloud-c826676fcda9)
