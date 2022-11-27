---  
layout: post  
title: "[BigQuery]Functions - Date" 
subtitle: "Funtion - Date"  
categories: gcp
tags: bigquery work 
comments: true  
---  


<!--more-->

## 날짜함수

### EXtract
` Extract (part FROM date_expression)`
##### 설명
- 지정된 날짜 부분에 해당하는 값을 반환 `part`는 다음 중 하나
    - DAYOFWEEK : 한주의 첫날이 일요일인 [1,7] 범위 값 반환
    - DAY
    - DAYOFYEAR
    - WEEK : [0,53] 범위에서 날짜의 주 번호를 반환. 주는 일요일부터 시작되며 그 해의 첫 번째 일요일 이전 날짜는 0번쨰
    - WEEKDAY
    - ISOWEEK 
    - MONTH
    - QUARTER
    - YEAR
    - ISYEAR
##### 반환
- INT64    





### 참조


[GCP Document - BigQuery > Funtions > Date](https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions?hl=ko)