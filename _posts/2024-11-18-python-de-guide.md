---
title: "Python for Data Engineering Best Practices: A Introductory Guide"
date : 2024-11-18 16:00:00 +0900
categories: [Python, guide]
tags : [python,bestpractices,guide]
---


### **Python for Data Engineering Best Practices: A Introductory Guide**

### **PEP-8 Style Guide for Python Code**

- PEP 8은 Guido van Rossum, Barry Warsaw, Nick Coghlan이 작성한 Python 코드의 공식 스타일 가이드
- 2001년에 처음 제안되었으며, 코드의 가독성과 일관성을 개선하여 개발자가 서로 작업을 더 쉽게 이해하고 유지 관리를 목표

#### **Key Points**

- **Indentation** : 들여쓰끼 수준마다 4 space 사용
- **Line Length** : 최대 79줄로 제한
- **Blank Liens** : 빈 줄을 사용하여 최상위 함수/클래스 정의를 구분하고, 함수 내에서 논리섹션 나타남
- **Imports** : 일반적으로 별도의 줄에 있어야 하며, 특정 순서를 따라야함. 표준 라이브러리 가져오기, 관련 타사 가져오기, 로컬 애플리케이션/라이브러리별
- **Whitespaces** : 불필요한 공백 제거
  
```python
# Correct
 spam(ham[1], {eggs: 2})
 foo = (0, 1, 2)
 
 # Incorrect
 spam( ham[ 1 ], { eggs: 2 } )
 foo = ( 0, 1, 2 )

```

### **PEP 20 - The Zen of Python**

- **Tim Peters**가 작성하였으며, Python 프로그램 작성하기 위한 지침 원칙을 설명

- 19개의 격언이 포함되어있으며, 단순성,가독성, 명확하고 간결한 코드의 중요성을 강조
  
#### **Key Aphorism**

- **Readability counts** : 변수의 가독성을 쉽게해야함
- **Simple is better than complex**

```python
# Good
def get_even_numbers(numbers):
    return [n for n in numbers if n % 2 == 0]

# Bad
def get_even_numbers(numbers):
    even_numbers = []
    for n in numbers:
        if n % 2 == 0:
            even_numbers.append(n)
    return even_numbers

```

### **Code Documentation**

- docstring(PEP 257)과 주석을 사용하여 모듈, 클래스, 함수에 대한 문서를 제공

### **PEP 257 — Docstring Conventions**

- `David Goodger`에 의해 작성
- 주요 목적은 docstring의 형식, 구조 및 내용에 대한 지침을 제공하여 Python 코드를 이해하고 유지 관리하기 쉽게 만드는 것
  
### **Difference Between a Module, Function, and Class**

#### **Module**

- Python 정의와 문자을 포함하는 파일
- function,class,variable를 정의할 수 있으며 실행 가능한 코드 포함
- ex) math_operations.py 여러 function/class를 포함

#### **Function**

- 단일 관련 작업을 수행하는데 사용되는 체계적이고 재사용 가능한 코드블록 `def`를 사용하여 정의

#### **Class**

- `object(특정 data structure)`를 생성하고, 상태에 대한 초기값을 제공하고, 동작(member function or method)를 구현하기 위한 `blueprint(청사진)`
- ex)  기본적인 산술 연산을 위한 메서드가 있는`Calcurator`  class

#### **DocString의 exmaple**

- Module DocString
  
```python
"""
math_operations.py

This module provides basic mathematical operations such as addition,
subtraction, multiplication, and division.

Functions:
    add(a, b) -> int or float
    subtract(a, b) -> int or float
    multiply(a, b) -> int or float
    divide(a, b) -> float

Classes:
    Calculator - A simple calculator class that uses the functions in this module.
"""

def add(a, b):
    """Return the sum of a and b."""
    return a + b

def subtract(a, b):
    """Return the difference of a and b."""
    return a - b

def multiply(a, b):
    """Return the product of a and b."""
    return a * b

def divide(a, b):
    """Return the quotient of a and b. Raise ZeroDivisionError if b is zero."""
    if b == 0:
        raise ZeroDivisionError("division by zero")
    return a / b
```
  
- Class DocString

```python
class Calculator:
    """
    A simple calculator class to perform basic arithmetic operations.

    Methods:
        add(a, b) -> int or float
        subtract(a, b) -> int or float
        multiply(a, b) -> int or float
        divide(a, b) -> float
    """
    
    def add(self, a, b):
        """Return the sum of a and b."""
        return a + b
    
    def subtract(self, a, b):
        """Return the difference of a and b."""
        return a - b
    
    def multiply(self, a, b):
        """Return the product of a and b."""
        return a * b
    
    def divide(self, a, b):
        """Return the quotient of a and b. Raise ZeroDivisionError if b is zero."""
        if b == 0:
            raise ZeroDivisionError("division by zero")
        return a / b
```

- Function DocString

```python
def add(a, b):
    """
    Return the sum of a and b.

    Args:
        a (int or float): The first number.
        b (int or float): The second number.

    Returns:
        int or float: The sum of a and b.
    """
    return a + b
```

### **Naming Convention**

- 코드의 `readability(가독성)`과 `maintenance(유지보수)`를 위해서는 매우 중요
- variables,functions,classes 그리고 constants를 위한 Naming Convention이 존재

#### **Variable and Functions** : `snake_case`사용

```python
def calculate_area(radius):
    pi = 3.14
    return pi * radius ** 2
```

#### **Classes** : `camel_case`를 사용

```python
class MyClass:
    pass
```

#### **Constants** : `UPPERCASE_WITH_UNDERSCORES`를 사용

```python
MAX_CONNECTIONS = 10
```

#### **Testing**

- testing은 코드의 `correctness(정확성)`과 `reliability(신뢰성)`을 보장하기 위해 매우 중요
- 여러 framework가 존재 `unittes`, `pytest`, `nose`
  
```python
import unittest

def add(a, b):
    return a + b

class TestMathOperations(unittest.TestCase):
    def test_add(self):
        self.assertEqual(add(1, 2), 3)
        self.assertEqual(add(-1, 1), 0)

if __name__ == '__main__':
    unittest.main()
```

#### **Version Control**

- 코드베이스의 변경사항을 관리
- `Git`과 같은 Version Control System을 사용
  
```
# Good commit message
 Fix bug in user authentication
 
 # Bad commit message
 Fixed stuff 
```

#### **Dependency Management**

안정적이고 재현 가능한 개발 환경을 유지하는 데 필수적입니다. 가상 환경과 `requirements.txt` 또는 `Pipfile`과 같은 종속성 관리 파일은 프로젝트 종속성을 격리하는 데 도움이 됩니다

#### **Performance**

- 코드의 `bottle neck(병목현상)`식별하고 해결
- profiling 도구는 성능 측정에 도움
- `cProfile`은 Python표준 라이브러리 포함된 서능 프로파일링도구
- 프로그램에서 실행시간을 분석하여 각 함수가 얼마나 자주 호출되고, 각각의 실해에 얼마만큼의 시간이 걸리는지를 측정
  
#### **cProfile**

1. **주요기능**
   - 함수 호출 수 분석 : 각 함수가 호출된 횟수
   - 실행 시간 측정 : 각 함수의 실행시간
   - 성능 병목 파악 : 가장 실행 시간이 오래 걸리는 함수나 호출 빈도가 높은 함수를 찾아냄

- **Sample Code**
  
```python
import cProfile

def test_function():
    total = 0
    for i in range(100000):
        total += i
    return total

cProfile.run('test_function()')

```

- **Output**

```
         4 function calls in 0.004 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.003    0.003    0.004    0.004 <ipython-input-1>:4(test_function)
        1    0.000    0.000    0.004    0.004 <string>:1(<module>)
        1    0.000    0.000    0.004    0.004 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```

- `ncalls`: 함수 호출 횟수
- `tottime`: 함수 자체를 실행하는 데 걸린 총 시간
- `percall`: 호출당 평균 시간 (tottime/ncalls)
- `cumtime`: 함수 실행과 하위 호출을 포함한 총 시간
- `filename:lineno(function)`: 함수 위치와 이름

- **장점**
  - 표준 라이브러리에 포함되어 별도 설치가 필요 없음
  - 상세하고 신뢰할 수 있는 성능 분석 정보를 제공
  - 간단한 사용법과 다양한 출력 옵션을 지원

- **단점**
  - 프로파일링 오버헤드로 인해 코드 실행 속도가 느려질 수 있음
  - 멀티스레드나 비동기 코드 분석은 추가 도구가 필요할 수 있음

### **참고**

- <https://medium.com/@opcfrance/python-for-data-engineering-best-practices-a-introductory-guide-d2752f220696>
