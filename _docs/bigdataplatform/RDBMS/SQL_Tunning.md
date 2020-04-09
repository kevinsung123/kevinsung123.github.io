### SQL 튜닝포인트
- BLOCK I/O 최적화
	-  Table scan / Index scan 사용여부
	-  Index scan시 Access, Filter Predicate 적절한지 파악
- JOIN 방법
	- Nested Loops Join, Hash Join, Sort Merge Join 등
- Driving Table
	-  업무적으로 제일 먼저 읽어야하는 Table
	-  어떤순서로 Table과 Join되어야하는지

### Predicate 종류
- Access Predicate 
	- index scan 범위를 결정하는데 사용되는 조건목록
	- index 컬럼순으로 등치조건(=,IN, EXISTS 등)인 경우 수행
- Filter Predicate
	- Index의 leaf block에 도달한 후 filter조건으로 사용될 수 있는 조건 목록을 추려내는 방식
	- 범위조건(LIKE, BETWEEN, <,>)인 경우 수행
	- 범위조건 컬럼뒤로는 등치조건이라도 filter수행
	- 최적화 index생성시
		- Buffers수가 다른 튜닝방법보다 제일 적음
		- 대용량 Table인경우 index추가로 인한 추가 Disk 공간 필요 및 적재 성능적 저하 발생

### INDEX
- 인덱스는 테이블이나 클러스트에서 쓰여지는 객체로서, 오라클 DB내에서 테이블내의 원하는 레코드를 빠르게 찾아갈 수 있도록 만들어진 데이터 구조
- 자동 인덱스 : Primary key 또는 Unique 제한 규칙에 의해 자동적으로 생성되는 인덱스
- 수동 인덱스 :  CREATE INDEX 명령을 실행에서 만드는 인덱스
- 인덱스 생성 컬럼 
	-  WHERE절이나 JOIN조건에서 자주 사용되는 컬럼
	-  NULL값이 많이 포함되어있는 컬럼
- 인덱스 생성 불필요
	- 테이블이 작을때
	- 테이블이 자주 갱신될 때
- 오라클 
	- 오라클 인덱스는 B-Tree(Binary Search Tree)에 대한 원리를 기반
	```
	<알고리즘>
	1. 주어진 값을 리스트의 중간점에 있는 값과 비교한다.만약 그 값이 더 크면 리스트의 아래쪽반을 버린다. 만약 더 작다면 위쪽반을 버린다
	2. 하나의 값이 발견될 때 까지 또는 리스트가 끝날때까지 그와 같은 작업을 다른반쪽에도 반복한다

	```
### 비트맵 인덱스
- 각 컬럼에 대해 적은 개수의 독특한 값이 있을 경웨 사용하는 것이 좋다 
-  비트맵 인덱스는 B-tree인덱스가 사용되지 않을 경우 성능 향상
-  테이블이 매우 크거나 수정/변경이 잘 일어나지 않은 경우 사용 가능

### UNIQUE인덱스
- 인덱스를 사용한 컬럼의 중복값들을 포함하지 않고 사용
-  Primary key와 Unique제약 조건시 생성되는 인덱스이다

### 결합 인덱스
- 복수개의 컬럼에 생성가능 
- 복수개의 인ㄷ게스가 가질 수 있는 최대 컬럼값은 16개

### 인덱스 삭제
- 인덱스 구조는 테이블과 독립적
- 인덱스 삭제를 위해서는 인덱스 소유자이거나 DROP ANY INDEX권한 가지고 있어야한다.
### 인덱스 데이터 사전
- USER_INDEXS뷰 또는 USER_IND_COLUMNS뷰에서 조회가능

### Scala subquery, Inline view, Subquery
-  Scala subquery : select절에 위치
-  Inline View : from절에 위치한 subquery, alias 사용
-  Subquery : Where절에 위치, 비교조건형태로 사용

### MyBatis
- 개발자가 지정한 sql, 저장 프로시저 그리고 몇 가지 고급매핑을 지원하는 persistance framework 
- JDBC로 처리하는 상당 부분의 코드와 파라미터 설정 및 결과 매핑을 대신 
-  동적 SQL을 매우 편리하게 사용할 수 있도록 지원
- 
