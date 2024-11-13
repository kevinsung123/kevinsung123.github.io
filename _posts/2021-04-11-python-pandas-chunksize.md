---
title: "Pandas - Chunksize"  
date: 2021-04-23 12:00:00 +0900
categories: [Python,pandas]
tags: [python,pandas]
comments: true
pin: true
math: true
mermaid: true
---


### namedtuple
dicionary와 같은 container을 지원. 특정 값에 hash를 적용한 key를 포함. key, idex 둘다 접근 가능. tuple의 성질을 가졌고, tuple은 일반적으로 index로 접근하므로 직관적이지 않음. namedtuple은 field의 key(이름)을 붙여 사용 가능


---

### Access options
- Access by index : The attribute values of namedtuple() are ordered and can be accessed using the index number unlike dictionaries which are not accessible by index.

- Access by keyname : Access by keyname is also allowed as in dictionaries.

- using getattr() :- This is yet another way to access the value by giving namedtuple and key value as its argument.

--- 

### Conversion Operations
- **_make()** : iterable객체를 argument로 넘겨  namedtuple()로 return
- **_asdict()** : OrderDict()로 return ( namedtupel()의 mapping된 value로 구성)
- **\*\*(double start) operator** : dictionary를 namedtuple()로 변환

---

### Additional Operations
- **_fields** : namespace의 모든 keyname을 return
- **_replace()** : keyname을 넘겨 value값을 변환

---

### Example
<script src="https://gist.github.com/kevinsung123/7385f076603c1bd5bbd13f2998ead973.js"></script>


### 참고
[geeks](https://www.geeksforgeeks.org/namedtuple-in-python/)

[docs-python](https://docs.python.org/3/library/collections.html#collections.namedtuple)