---
title: "collections defaultdict"  
date: 2021-04-23 12:00:00 +0900
categories: [Python,collections,defaultdict]
tags: [python,collections,defaultdict]
comments: true
pin: true
math: true
mermaid: true
---  


## Python Collection Default dict
---

### python collections 이란?
> python collections are specialized container datatypes providing alternatives to Python's general purposd built-in conatiners dict,list,set and tuple

- python의 built-in type에 mechanisim이 추가됨

### So What exactly is DefaultDict?
- `defaultdict`는 모든 일반적인 목적으로 만든 `dict`
- `keyerror`를 일으키지 않음(일반적인 dict는 handling code를 작성해야하지만 내부에 이미 구현)
- `defaultdict`는 다음 사항이 적용
    1. access할때 dictionary에 key가 미존재시 `keyerror`를 일으키지 않음
    2. `defaultdict` 생성시 default value를 제공해서 자동으로 key가 생성되게함 

![example](https://miro.medium.com/max/1750/1*SIe_ipQF6o37G0u6mKoXBg.png)

### default value 생성 
- 아래는 `defaultdict`를 생성할때 `int, float and str`로 생성하는 예제
```
a_dct = defaultdict(int)   # The Default Value is "0"
a_dct = defaultdict(float)   # The Default Value is "0.0"
a_dct = defaultdict(str)   # The Default Value is ""
```
- default value를 자동으로 조회 가능

- `list, tuple`로도 생성가능 (Using defaultdict with list)
    - key 존재유무와 상관없이 `append`와 같은 list function을 사용가능
![example2](https://miro.medium.com/max/1750/1*9BW-GUCUV_FaTajcEIPIWg.png)

- **extreamly careful about**
    - `defaultdict`를 `list, tuple, int, float`로 만들때 overwrite and assign (with totally different)가능, 이런 상황시 code fail
![example3](https://miro.medium.com/max/1750/1*jXHATFe_KN9317R7n7Kxlw.png)