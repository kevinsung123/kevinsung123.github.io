
### Merge 구문
- merge문은 조건에 따라서 데이터의 삽입,갱신,삭제 작업을 한번에 할 수 있다.
- 해당 행이 존재하는 경우 UDPATE(DELETE포함)을 수행하고, 새로운 행일 경우 INSERT 수행
-  대상 테이블에대한 UPDATE/INSERT조건은 ON절에 의해 결정
- MERGE문에서 CLOB사용시 업데이트 할 내용이 2000Byte가 넘을경우 ora-00600오류 발생
```
MERGE [ hint ]
INTO [ schema. ] { table | view } [ t_alias ]
USING { [ schema. ] { table | view }
| subquery
} [ t_alias ]
ON ( condition )
WHEN MATCHED THEN
UPDATE SET column = { expr | DEFAULT }
[, column = { expr | DEFAULT } ]...
[ DELETE where_clause ]
WHEN NOT MATCHED THEN
INSERT [ (column [, column ]...) ]
VALUES ({ expr [, expr ]... | DEFAULT })

-   INTO  : DATA가 UPDATE되거나 INSERT 될 테이블 또는 뷰를 지정.
-   USING  : 비교할 SOURCE 테이블 또는 뷰나 서브쿼리를 지정, INTO절의 테이블과 동일하거나 다를 수 있다.
-   ON  : UPDATE나 INSERT를 하게 될 조건으로, 해당 조건을 만족하는 DATA가 있으면  WHEN MATCHED  절을 실행하게 되고, 없으면  WHEN NOT MATCHED  이하를 실행하게 된다.
-   WHEN MATCHED  : ON 조건절이 TRUE인 ROW에 수행 할 내용 (UPDATE, DELETE포함 될 수 있음)
-   WHEN NOT MATCHED  : ON 조건절에 맞는 ROW가 없을 때 수행할 내용 (INSERT)
```
###  Converse Function
- TO_CHAR : DATE, NUMBER형을  문자타입으로 변환
	- NUMBER FORMAT Elements
		-  9,999 콤마 형식
		-  99.99 소수점 형식
		-  0999 0을 삽입
		-  $ 통화로표시
		-  L999 Local통화
		-  XXXX 16진수
	- Date Format
		- YYYY : 4자리연도
		- D : Day of week (1-7)
		- DD : Day of Month (1-31)
		- DDD :  Day of Year (1-366)
		- DAY : 요일(월,화..)
		- WW : Week of Year(1-53)
		- W : Week of Month(1-5)
		- HH : Hour of day(1-12)
		- SS : Second(0-59)
		- MONTH : Name of Month
		-  HH24 : Hour of day (0-23)
		-  MI : Minute(0-59)
		-  SS : Second(0-59)
 - TO_DATE :  CHAR, VARCHAR2형을 DATE타입으로 변환
-  TO_NUMBER : CHAR, VARCHAR2의 데이터타입을 숫자형식으로 변환
-  참조 : [http://www.gurubee.net/lecture/1027](http://www.gurubee.net/lecture/1027)

### 순위함수
- RANK : 순위를 부여하는 함수 동일순위 처리 가능 
- DENSE_RANK : RANK함수 같은 역할 동일 등수 순위 영향 X
- ROW_NUMBER : 특정순위로 일련번호를 제공 동일 등수 처리 X
```
SELECT deptno, empno, sal
, RANK() OVER( ORDER BY sal DESC) rk
, DENSE_RANK() OVER(ORDER BY sal DESC) dr
, ROW_NUMBER() OVER( ORDER BY sal DESC) rn
FROM emp
```
- NTILE - 쿼리결과를 N개 그룹으로 분류
```
SELECT NTILE(2) OVER (ORDER BY empno) grp2  FROM emp
```

### 윈도우함수
- 분석함수 중에서 윈도우절을 사용하는 함수
- 윈도우절을 사용하면 PARTITION BY 절에 명시된 그룹을 좀더 세부적으로 그룹핑
- 윈도우절을 분석함수 중에서  일부(AVG, COUNT, SUM, MAX, MIN)만 사용
```
윈도우함수 OVER(
		PARTITION BY 절
		ORDER BY 절 [ASC | DESC]
		ROWS | RANGE
		BETWEEN UNBOUNDED PRECEDING |  n PRECEDING | CURRENT ROW
		AND UNBOUNDED FOLLOWING | n FOLLOWING | CURRENT ROW
		
- ROWS: 물리적인 ROW단위로 행 집합을 지정
- RANGE : 논리적인 상대번지로 행 집합을 지정
- BETWEEN ~ AND 절 : 윈도우 시작과 끝을 지정
- UNBOUNDED PRECEDING : PARTITION의 첫번째 로우에서 윈도우가 시작
- UNBOUNDED FOLLOWING : PARTITION의 마지막 로우에서 윈도우가 시작
- CURRENT ROW : 윈도우 시작이나 끝 위치가 현재로우
```

```
SELECT empno, ename, deptno, sal, 
    SUM(sal) OVER (PARTITION BY deptno 
                       ORDER BY empno 
                        ROWS 1 PRECEDING ) pre_sum
FROM emp;
> 위 쿼리는 부서별 이전ROW의 급여와 현재ROW의 급여합계 출력
```      
``` 
SELECT empno, ename, deptno, sal,
     SUM(sal) OVER(ORDER BY deptno, empno 
              ROWS BETWEEN UNBOUNDED PRECEDING 
                       AND UNBOUNDED FOLLOWING) sal1,
     SUM(sal) OVER(ORDER BY deptno, empno 
              ROWS BETWEEN UNBOUNDED PRECEDING 
                       AND CURRENT ROW) sal2,
     SUM(sal) OVER(ORDER BY deptno, empno 
              ROWS BETWEEN CURRENT ROW 
                       AND UNBOUNDED FOLLOWING) sal3
   FROM emp;
> 첫 번째 ROW부터 마지막 ROW까지의 합과(SAL1), 첫 번째 ROW부터 현재 ROW까지의 합(SAL2) 그리고 현재 ROW부터 마지막 ROW까지의 합(SAL3)을 출력하는 예제    
 ```
 
 - RATIO _TO_REPOT (점유율) : 합에대한 합계
```
SELECT deptno
     , SUM(sal) sal
     , SUM(SUM(sal)) OVER() tot
     , ROUND(SUM(sal) /  SUM(SUM(sal)) OVER(), 2) rat1
     , ROUND(RATIO_TO_REPORT(SUM(sal)) OVER(), 2) rat2
  FROM emp
 GROUP BY deptno
; 
```

- FIRST_VALUE, LAST_VALUE : 정렬된 값 중에서 첫번째, 마지막 값을 반환
- KEEP(최초값, 최종값)
	-  MAX( ) KEEP(DENSE_RANK FIRST ORDER BY)
	-  MIN( ) KEEP(DENSE_RANK LIST ORDER BY)
 ```
SELECT deptno
     , MAX(sal) max_sal
     , MAX(empno) KEEP(DENSE_RANK LAST  ORDER BY sal) max_e
     , MIN(sal) min_sal
     , MIN(empno) KEEP(DENSE_RANK FIRST ORDER BY sal) min_e
  FROM emp
 GROUP BY deptno
 ORDER BY deptno
;
>부서별 최대급여자 급여(MAX_SAL)와 사번(MAX_E), 최소급여자 급여(MIN_SAL)와 사번(MIN_E)을 조회하는 예제입니다.
 ```
- LISTAGG(문자열 합치기)
-  LIST를 구분자로 AGRREGATE해주는 함수, 행 데이터를 특정 구분자를 가지는 열로 쉽게 표현 가능
-  Oracle11g R2버전부터 사용가능
-  LISTAGG(컬럼, 구분값) WITH GROUP (ORDER BY 절) 형식
```
SELECT deptno
     , SUBSTR(XMLAgg(XMLELEMENT(x, ',', empno) ORDER BY empno).Extract('//text()'), 2) "9i"
     , WM_CONCAT(empno) "10g"
     , LISTAGG(empno, ',') WITHIN GROUP(ORDER BY empno) "11g"
  FROM emp
 GROUP BY deptno
 ORDER BY deptno
```


### GROUP BY ROLL UP 

- 소계/합계를 구할때 사용
-  GROUP BY ROLLUP(컬럼 1개) : 총계
-  GROUP BY ROLLUP(컬럼 2개이상) : 소계/총계가 모두 나옴
-  GROUP BY ROLLUP(컬럼 2개이상) 합계만 표시
```
SELECT JOB

           , DEPT

           , SUM(SAL)

   FROM TEST_TABLE

 GROUP BY ROLLUP(JOB, DEPT) HAVING GROUPING_ID(JOB, DEPT) IN (0, 3)
```
- Grouping_id(컬럼명 a, 컬럼명 b,......)
	- Grouping(컬럼명 a) || Grouping(컬럼명 b)의 값을 2진수에서 10진수로 변환한 값입니다.
	- 그룹핑 레벨을 리턴
	```
	GROUPING_ID(DEPARTMENT_ID,JON_ID) 
	1. 표현식 값이 NULL인지 여부에 따라 0,1을 리턴
	2. GROUPING_ID(DEPARTMENT_ID) : DEPARTMENT_ID가 조회 =>0 NULL>1
	```
