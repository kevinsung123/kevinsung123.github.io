---  
layout: post  
title: "[Leetcode] 146.LRUCache"  
subtitle: "1.Two-sum"  
categories: leetcode  
tags: leetcode lru-cache
comments: true  
---  

### Background
#### 페이지 교체 알고리즘(page-replacement algorithm or cache replacemnt)
- 컴퓨터는 보통 주기억 장치인 ram과 보조기억 장치인 hard나 ssd의 대용량 기억장치를 가지고 있음
- ram이 속도가 빠르기 때문에 보조기억장치로 부터 data를 ram에 저장해놓고 ram에 있는 data를 가지고 빠르게 cpu가 연산을 함
- ram을 같은 크기의 block으로 구성해서 운용하는데 이 block를 `page`라고 일컫음
- 만약 cpu가 계산을 할때 data가 page에 있다면 `cache hit`, 없을 경우 보조기억장치로부터 data를 page로 옮겨온 후에 계산 하는데 이때를 `cache miss`라고 일컫음. hit일떄가 miss일떄보다 시간 단축
- hit와 miss의 시간 차이로 인해 보다 빠른 연산을 위해 page에 여러 정보 중 어떤 정보를 오래 저장해 놓아야 하는지가 매우 중요한 문제. 이때문에 관련 알고리즘들이 존재
- page-replacement 알고리즘 종류
    - FIFO(First In First Out)
    - LIFO(Last In First Out)
    - FILO(First In Last Out)
    - OPT(OPTimal Page Replacement)
    - LRU(Leastly Recently Used)
    - Coundt-Based
    - LFU(Leastly Frequently Used)
    - MFU(Most Frequently Used)
#### LRUCache
- LRU란 Least Recently Used Algorithm의 약자로 Cache에서 memory를 다루기 위한 알고리즘
- cache가 사용하는 리소스는 제한되어 있고, 제한된 리소스 내에서 데이터를 빠르게 저장하고 접근할 수 있어야한다
- 이를 위해 LRU알고리즘은 메모리 상에서 가장 최근에 사용된 적이 없은 cache의 메모리부터 대체하여 데이터를 갱신
- 이 이론의 가설은 제일 오랫동안 참조되지 않은 데이터를 제거하는 방법
![LRUCache](https://upload.wikimedia.org/wikipedia/commons/8/88/Lruexample.png)  

위의 예시는 A-B-C-D-E-D-F를 접근 할때의 알고리즘


### Problem
[leetcode](https://leetcode.com/problems/lru-cache/)

Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

Implement the LRUCache class:
- LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
- int get(int key) Return the value of the key if the key exists, otherwise return -1.
- void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.

Follow up:
Could you do get and put in O(1) time complexity?

### Solving
- LRUCache를 구현하는데 O(1) Time Complexity로 구현
- 순서가 있는 OrderedDict로 구현
- cache를 조회 시 (get)
    - key 존재 시 : 조회한 값을 맨 오른쪽으로 이동 및 값을 return
    - key 미존재 시 : -1를 return
- cache에 data를 입력 시(put)
    - key 존재 시 : data를 맨 오른쪽 이동(조회 하였으므로)
    - key 미존재 시 : 
        - capacity 미만 : 값을 추가
        - capacity 초과 : LRU(Least Recently Used)값을 삭제 및 신규 값 추가

### Code
<script src="https://gist.github.com/kevinsung123/332aff480d516faa34f5fca0151e5cbb.js"></script>
### 참고
[wikipedia](https://en.wikipedia.org/wiki/Cache_replacement_policies#Least_recently_used_(LRU))
[page-blog](https://gomguard.tistory.com/115)