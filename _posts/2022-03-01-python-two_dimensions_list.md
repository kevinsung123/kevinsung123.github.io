---  
layout: post  
title: "[python] Python - List"  
subtitle: "Python List"  
categories: python  
tags: python list
comments: true  
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

```
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
7. 마지막 처음 값을 저장 arr[r-s][c-s+1]=arr[r-s][c-s]

def rotate(r, c, s):  
    global arr, N, M  
    # print(r, c, s)  
 # s번만큼 회전함  
 while s > 0:  
     # 가장 처음값  
	 tmp = arr[r - s][c - s]  
     for y in range(r - s + 1, r + s + 1):  # 좌 : x좌표는 고정  
       arr[y - 1][c - s] = arr[y][c - s]
 
     for x in range(c - s + 1, c + s + 1):  # 하 : y좌표는 고정  
       arr[r + s][x - 1] = arr[r + s][x]
       
     for y in range(r + s - 1, r - s - 1, -1):  # 우 x좌표는 고정  
        arr[y + 1][c + s] = arr[y][c + s]  
       
     for x in range(c + s - 1, c - s - 1, -1):  # 상 : y좌표는 고정  
       arr[r - s][x + 1] = arr[r - s][x]  
     # 가장 처음값음 바로 오른쪽에 저장  
     arr[r - s][c - s + 1] = tmp  
     s -= 1  

```


```

### 참고
- [medium - Python functions naming: 10 tips](https://melevir.medium.com/python-functions-naming-tips-376f12549f9)