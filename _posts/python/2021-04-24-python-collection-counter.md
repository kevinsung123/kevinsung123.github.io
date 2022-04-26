---  
layout: post  
title: "[Python] Python collections counter"  
subtitle: "Python collections counter"  
categories: python  
tags: collections counter
comments: true  
---  

### Collection - Counter
- Container에 동일한 값의 자료가 몇개인지를 파악하는데 사용하는 객체
> A Counter is a dict subclass for counting hashable objects. It is an unordered collection where elements are stored as dictionary keys and their counts are stored as dictionary values. Counts are allowed to be any integer value including zero or negative counts. The Counter class is similar to bags or multisets in other languages.
- `collections.Counter()`의 결과값은 dictionary 형태로 출력

### 1. Counter()의 다양한 입력값들
#### 리스트(list)
- lst = ['aa', 'cc', 'dd', 'aa', 'bb', 'ee']의 요소 개수를 collections.Counter()를 이용하여 구할 수 있다. 출력 결과는 Dictionary형태로 반환하여 준다.

```
collections.Counter 예제 (1)
list를 입력값으로 함
import collections
lst = ['aa', 'cc', 'dd', 'aa', 'bb', 'ee']
print(collections.Counter(lst))

결과
Counter({'aa': 2, 'cc': 1, 'dd': 1, 'bb': 1, 'ee': 1})

```

#### 딕셔너리(Dictionary)
- `collections.Counter()`의 입력값은 `Dictionary` 형태로 넣어주면 결과 또한 `Dictionary`이다

```
collections.Counter 예제 (2)
dictionary를 입력값으로 함
import collections
print(collections.Counter({'가': 3, '나': 2, '다': 4}))
'''
결과
Counter({'다': 4, '가': 3, '나': 2})
'''
```

#### 값=개수형태
- `collections.Counter()`에는 값=개수형태로 입력이 가능하다.
```
collections.Counter 예제 (3)
'값=개수' 입력값으로 함
import collections
c = collections.Counter(a=2, b=3, c=2)
print(collections.Counter(c))
print(sorted(c.elements()))

##결과
Counter({'b': 3, 'c': 2, 'a': 2})
['a', 'a', 'b', 'b', 'b', 'c', 'c']

```

#### 문자열string
- 문자열 입력시 `{문자 : 개수}` dictionary형태로 반환


### 2. Counter의 메소드들
#### update()
- counter값의 갱신 하는 것 의미. 

#### elements()
> Return an iterator over elements repeating each as many times as its count. Elements are returned in arbitrary order. If an element’s count is less than one, elements() will ignore it.


- 입력된 값의 요소에 해당하는 값을 풀어서 반환. element는 무작위로 반환 대소ㅜㄴ자를 구분하여  `sorted()`을 이용하여 정렬해줄 수 있다
```
collections.Counter 예제 (6)
elements() 메소드 사용
import collections
c = collections.Counter("Hello Python")
print(list(c.elements()))
print(sorted(c.elements()))
'''
결과
['n', 'h', 'l', 'l', 't', 'H', 'e', 'o', 'o', ' ', 'y', 'P']
[' ', 'H', 'P', 'e', 'h', 'l', 'l', 'n', 'o', 'o', 't', 'y']
'''
c2 = collections.Counter(a=4, b=2, c=0, d=-2)
print(sorted(c.elements()))
'''
결과
['a', 'a', 'a', 'a', 'b', 'b']
'''
```

#### most_common()
> Return a list of the n most common elements and their counts from the most common to the least. If n is omitted or None, most_common() returns all elements in the counter. Elements with equal counts are ordered arbitrarily

- `most_common`은 입력된 값의 요소들 중 빈도수가 높은 순으로 상위 개를 list안의 tuple로 반환

```
collections.Counter 예제 (7)
most_common() 메소드 사용
import collections
c2 = collections.Counter('apple, orange, grape')
print(c2.most_common())
print(c2.most_common(3))
'''
결과
[('a', 3), ('p', 3), ('e', 3), ('g', 2), (',', 2), ('r', 2), (' ', 2), ('n', 1), ('l', 1), ('o', 1)]
[('a', 3), ('p', 3), ('e', 3)]
'''
```

### 참고
- [blog](https://excelsior-cjh.tistory.com/94)