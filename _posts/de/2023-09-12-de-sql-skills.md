---  
layout: post  
title: "[DE] DataEngineering -The Top 3 SQL Skills Needed to Get to the Next Round"  
subtitle: "Technical Interview Help for Data Professionals"  
categories: de
tags: de datafabric
comments: true  
---  
## The Top 3 SQL Skils Needed to Get to the Next Round

데이터 과학자,분석가,엔지니어와 같은 역할 목표로 현재 인터뷰를 진행 중인 경우 일반적으로 SQL을 포함한 live coding이 필요한 하나 이상의 기술이 인터뷰를 접함. Python과 같은 프로그래밍언어가 필요 할 수도 있지만, 이번에는 일반적인 SQL을 집중적으로 살펴보자.


### 1. Mastering Joins and Table Types
가장 흔한 SQL질문은 테이블 조인. inner/left join을 능수능란하게 사용해야하고, 또한 self-join 그리고 union 다루는 숙련도가 중요.
마찬가지로 중요한것은 테이블 유형, 특히 `fact table그리고 dimension table`에서 이러한 join을 실행 할 수 있는 능력

이 두가지 주요 테이블 유형을 이해하고, 정확한 결과를 보장하기 위해서 fact와 dimension을 병합하는 이유와 방법을 파악 하는 것이 중요.

`example - orders, customer 2개의 테이블 존재. 평생 최소 3대이상 구매하고 배송 우편번호가 90210인 고객은 몇명입니까?`
- inner join 뒤에 counts,sums 또는 filter를 단지 실행하 overcounting으로 인하여 큰 불일치(discrepancies)가 존재 할 수 있음.
- 아래와 같은 item들을 고려해 볼 수 있음
   - `어떤 테이블이 모든 고객을  포함하는가?` order fact table은 구매를 확인한 고객들만 포함. 반면 customer dimension 테이블은 등록되었지만, 구매하지 않은 고객들을 포함. 빠른 `count(distinct)`집계를 비교하면 보다 unique한 고객들을 포함 할 수 있음
   - 각 고객이 구매한 단위의 sum 또는 count를 위해서는 `group by`절이 포함된 집계함수가 필요
   - 우편번호 90210에서 고객을 좁히기 위해서는 `customer(dimension)`테이블과의 조인이 필요. alias르 사용하여 select문에 추가
```
-- cte of sum of units per customer from orders fact table
WITH customer_units_agg as (
    SELECT
        customer_id
        , SUM(units) as UNIT_SUM
    FROM
        orders
    GROUP BY
        customer_id
)

-- join CTE(Common Table Expression) table with customers dim table to filter by units and zip
SELECT
    COUNT(DISTINCT ca.customer_id) as CUSTOMER_CNT
FROM customer_units_agg ca
    INNER JOIN customer ctmr on ca.customer_id = ctmr.customer_id
WHERE 1=1
    AND ca.UNIT_SUM >= 3
    AND ctmr.ship_zip_code = 90210;
```   
- 솔루션은 CTE를 쓰는거지만, 똑같은 결과를 내는 방법은 다양하게 존재.


### 2. Tackling Complexity with Subqueries, Temp Tables, and CTEs
대부분 SQL코딩 인터뷰는 다단계 절차가 필요. subqueries, temp tables 그리고 ctes가 도움이 된다. 

- Subqueries
   - 중첩된 쿼리는 다음과 같은 구조를 포함`select * from (select * from table)` 또는 filtering `select * from table1 where table_value < (select max(table2_value) 
    from table2)`
   - subqueries는 유용하지만, 코드의 작성자와 읽는자 모두에게 구문이 어려워지거나 지저분해 질 수 있음
   - 복잡한 시나리오는의 경우 과도한 쿼리를 피해야됨
- Temporary Tables
   - 임시 테입르은 해당 세션기간동안 유지됨. 
   - `문제해결이나 논리적 순서 지정`등을 돕기 위해 차레로 생성하여 점진적으로 생성 가능
   - 다면적인 문제를 더 작고 관리하기 쉬운 단계로 분해하는데 도움이 됨
- Common Table Expressions (CTEs)
    - 쿼리를 구조화하는 유연한 방법을 제공
    - temp table과 유사하지만 select 구문 다음에는 지속되지 않음

### 3. Navigation Window Functions for Advanced Analysis
- 거의 모든 인터뷰에서 반복되는 주제는 window function과 관련이 있음
- 아래는 group by와 window function의 차이점을 설명
```
A window function performs a calculation across a set of table rows that are somehow related to the current row. This is comparable to the type of calculation that can be done with an aggregate function. But unlike regular aggregate functions, use of a window function does not cause rows to become grouped into a single output row — the rows retain their separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.

윈도우 함수는 현재 행과 어떤 식으로든 관련이 있는 테이블 행 집합에 대해 계산을 수행합니다. 이는 집계 함수로 수행할 수 있는 계산 유형과 유사합니다. 그러나 일반 집계 함수와 달리 윈도우 함수를 사용하면 행이 하나의 출력 행으로 그룹화되지 않으므로 행은 별도의 ID를 유지합니다. 화면 뒤에서 윈도우 함수는 쿼리 결과의 현재 행 이상에 액세스할 수 있습니다.
```
- 위의 핵심은 2가지 문장
    1. 행을 그룹화 하지 않은것
    2. window function은 현재의 행 뒤에 있는 행보다 더 많이 엑세스 한다
- 인터뷰 질문은 "어떤 유형의 window function을 사용하였나?와 같은 이론적인 질문부터 window function의 사용이 필요한 coding까지 다양하다
- 예시
    - 각 부서내에서 가장 수입이 높은 직원3명과 함께 보여주세요
    - 각 고객이 가장 최근에 구매한 3가지 품목을 보여주세요
- 가장 일반적인 window funciont은 `rank(), row_number() 그리고 dense_rank()를 over()`구문과 함꼐 사용 
- 



### 참고
- ![SQL Skils](https://towardsdatascience.com/the-top-3-sql-skills-needed-to-get-to-the-next-round-51ad1699a213)
