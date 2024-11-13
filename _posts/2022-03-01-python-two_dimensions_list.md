---
title: "Python - Two dimensions List"  
date: 2024-11-13 12:00:00 +0900
categories: [Python,list]
tags: [python,list]
comments: true
pin: true
math: true
mermaid: true
---  

<!--more-->

### 이차원 리스트 복사
1.  slice 사용하기
    ```
    arr=[ row[:] for  row in copy] 
    ```

2. list()
    ```
    arr= list(copy)
    ```

3. copy
    ```
    import copy
    arr = copy.copy(tmp)
    ```

4. deepcopy
    ```
    import copy
    arr=copy.deepcopy(tmp)
    ```

### 이차원 리스트 회전

(r,s,c)=(r,s)좌표에서 c 길이부터 시작해서 외부에서 안쪽으로 시계방향으로 회전
1. 가장 왼쪽 값은 tmp 로저장

2. 반시계방향으로 회전 시작점 : (r-s+1 ,c-s)  종료점 : (r-s,c-s)

3. 좌 
- y좌표 : r-s+1 <=  y <= r+s (증가)
- x좌표는 고정: c-s 

4. 하
- y좌표 고정 : r+s
- x좌표 : c-s+1<= x <= c+s (증가)

5. 우
- y좌표 : r+s-1 >= y >= r-s  (감소)
- x좌표 고정 : c+s

6. 상
- y좌표 고정 : r-s
- x좌표 : c+s-1>= x >= c-s  (감소!!)

7. 마지막 처음 값을 저장 
- arr[r-s][c-s+1]=arr[r-s][c-s]

<script src="https://gist.github.com/kevinsung123/47b9b9073f44b34e4f6eab5223b1e52f.js"></script>

### 참고
- [medium - Python functions naming: 10 tips](https://melevir.medium.com/python-functions-naming-tips-376f12549f9)