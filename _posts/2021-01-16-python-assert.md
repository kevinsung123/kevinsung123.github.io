---  
layout: post  
title: "[Python]Assert"  
subtitle: "Assert구문"  
categories: python  
tags: python assert
comments: true  
---  

### assert(가정설정문)
- 어떤 조건을 테스트하는 디버깅 보조 도구

```
Assertions or assert statement are build into python and are a tool for debugging
try to assert its authorityt over the rest of the code wher checking for a condititon specified by the programmer
```
- example
```
speed라는 변수가 0이상인지를 체크할때, True이면 아무일도 발생 안하고 프로그램 정상실행. condititon이 faile이면 AssertionError를 일으킴
```

### 일반 예외처리와 다른점?
- if try except구문을 사용한 예외처리와 다른 역할을 함
- File Not Found와 같은 예상되는 에러 조건을 검사하기 위해 사용되는 것은 올바른 활용 방식이 아님
- 예상하지 않은 프로그램의 상태를 확인하기 위해 활용해야함
- 구문의 조건을 만족하지 않으면 프로그램이 정상적으로 실행되지 않고 종료되는데, 이는 프로그램의 버그가 있다는 것을 의미
- 런타임 환경이 아닌 `디버깅 환경`에 도움을 주는 역할

### Syntax
- assert condtition , erroe_message(optional)
- Parameter
  - condition : the boolean condititon returning true/false
  - error_message : the optional argument to be printed in console in case of Assertion Error
- `assert_stmt ::= "assert" expression1 [",",expression2]`
- expression1은 테스트 조건이고 뒤의 `expression2`는 테스트조건이 거짓일때 예외의 메시지로 전달
- 위의 문법을 인터프리터가 해석하는 방식의 수도코드
```
if __debug__:
  if not expression1:
    raise AssertionError(expression2)
```
- Assertion구문은 debug라는 전역변수를 검사 
- 일반적인 상황에서는 항상 참이지만 `최적화가 필요한 경우에는 거짓`
- Aseertion구문을 예외처리에 잘못 활용하게되면 코드가 의도한대로 동작하지 않을 수 있음 
- 데이터 유효성을 검증하는데 Assertion구문을 사용하면 안됨!

### Where Not Assertions?

 ```
assert (    
       speed >= 0,    
       "Speed should be non-negative!"
)
```
- `tuple` 구문의 경우 Non-empty일떄 항상 참을 반환
- `()`구문은 항상 tuple object를 반환 하므로 항상 `True` 이런경우 조심해야함

- `PYTHON OPTIMIZE ENVIRONMENT` 에서는 실행이 불가


### 참조
- [docs.python.assertion](https://docs.python.org/3/reference/simple_stmts.html#grammar-token-assert-stmt)
- [An Intro to Python Assert Statements-medium](https://medium.com/better-programming/an-intro-to-python-assert-statements-bdd45834d303)
 - [tutorialsporint](https://www.tutorialspoint.com/python/assertions_in_python.htm)
 = [Python : Don't user aseert for Data Evalution](https://medium.com/@crystelpheonix/python-dont-use-assert-for-data-evaluation-721bfa93c571)