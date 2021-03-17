---  
layout: post  
title: "[Python] Collection모듈 - OrderedDict"  
subtitle: "1.Two-sum"  
categories: python  
tags: collections ordereddict
comments: true  
---  

### OrderedDict
- python의 collections 모듈에 존재하는 자료구조인 OrderedDict는 기본 dictionary와 거의 비슷하지만, 입력된 item의 순서를 기억하는 `Dictionary class`. 
- iterating을 할때, 먼저 추가된 key의 item을 반환
- 정렬된 dictionary를 만들떄 유용

<script src="https://gist.github.com/kevinsung123/62224fee00d06ae72097e3a163f8577e.js"></script>

### Method
####  popitem(last=True)

item을 반환 및 삭제하는 method. popitme()인자인 last=은 `True일 경우 LIFO방식`으로 값을 반환 및 삭제, `False일 경우 FIFO방식`으로 값을 반환 & 삭제

####  move_to_end(key,last=True)

맨 오른쪽(뒤) 또는 맨 왼쪽(앞)으로 이동해주는 메소드. `last=True` 일 경우 맨오른쪽(뒤) 이동하고 ,`False`인 경우 맨 앞으로 이동

<script src="https://gist.github.com/kevinsung123/20418c8bef6366232e5a81f6ea1de4dd.js"></script>

### 참고
[blog](https://excelsior-cjh.tistory.com/98)

[docs-python](https://docs.python.org/3.3/library/collections.html#collections.OrderedDict)