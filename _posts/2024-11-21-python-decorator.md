---
title: "Python Decorator"
date : 2024-11-12 15:00:00 +0900
categories: [Python, Decorator]
tags : [python,decorator]
---


### Pyhton - Decorator, Wrapper함수 개념 
python에서 **decorator**와 **wrapper**는 함수나 메서드의 동작을 확장하고 수정하는데 사용되는 중요한 개념. decorator는 함수의 호출 전후에 추가 기능을 적용할 수 있고, wrapper 이러한 추가 기능을 감싸고 실행하는 함수이다.

### Decorator 기본 개념
기존함수를 수정하지 않으면서도 함수의 동작을 확장할 수 있게 해주는 함수이다.
보통 **@deorator_name** 형식으로 함수위에 위치시켜서 사용

```python
@my_decorator
def some_function():
    print("Original function")
```

