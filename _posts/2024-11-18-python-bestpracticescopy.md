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
  
##### **Key Aphorism**

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


### **참고**
- https://python.plainenglish.io/13-python-shortcuts-every-developer-should-use-for-faster-coding-a9609daacc51