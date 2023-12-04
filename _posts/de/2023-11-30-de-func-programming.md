---  
layout: post  
title: "[DE] Functional Programming in Data Engineering with Python — Part 1"
subtitle: "Functional Programming in Data Engineering with Python — Part 1"  
categories: de
tags: de 
comments: true  
---  
## Functional Programming in Data Engineering with Python — Part 1

### What is functional programming?
- 함수프로그래밍은 함수를 사용하여 bug-resistant program그리고 응용프로그램을 구축하는데 사용되는 declartive type of programming

- 작업수행방법( imperative programming)에 대한 단게를 지정하는 대신에 side effect를 완화를 위한 순수기능과 immutable data structure사용을 강조하는 computing paradigm


### Function 특징 
- An input (parameter for another function)
- An output (result from another function)
Also, functions:

- are treated as first-class citizens `(first-class functions)`
- can be passed into other functions as arguments or returned from other functions `(higher-order functions)``
- can be connected with other functions to form new ones `(function composition)``
- should be designed to work with other functions `(reusability)``

### Core principles of functional programming 

1. monoids
2. immutability
3. recursion
4. function composition
5. dependency injection
6. currying
7. referential transparency
8. lazy evaluations

#### 1. monoids
- closure : input/output type은 같다 
- identity : empty 또는 string을 입력값을 넣으면 결과가 그대로 유지
- associativity : 원하는대로 값을 순서대로 지정할 수 있지만, 여전히 동일한 답을 얻을 수 있음

#### 2. Immutability
- object는 immutable 
- functional programming에서  object가 생성되거나 초기화되면 상태를 변경할 수 없는 경우
##### Mutable data structure
- lists
- dictionaries
- sets

##### Immutable data structure
- strings
- tuples
- frozensets


### 참고
- ![medium]https://blog.det.life/functional-programming-in-data-engineering-with-python-part-1-c2c4f677f749)
