---
title: "Python Decorator"
date : 2024-11-12 15:00:00 +0900
categories: [Python, Decorator]
tags : [python,decorator]
---


### **Pyhton - Decorator, Wrapper함수 개념**
python에서 **decorator**와 **wrapper**는 함수나 메서드의 동작을 확장하고 수정하는데 사용되는 중요한 개념. decorator는 함수의 호출 전후에 추가 기능을 적용할 수 있고, wrapper 이러한 추가 기능을 감싸고 실행하는 함수이다.

### **1. Decorator 기본 개념**
기존함수를 수정하지 않으면서도 함수의 동작을 확장할 수 있게 해주는 함수이다.
보통 **@deorator_name** 형식으로 함수위에 위치시켜서 사용

```python
@my_decorator
def some_function():
    print("Original function")
```
여기서 **my_decorator**는 **some_function()**에 decorator를 적용하여 원래 함수의 동작을 확장

### **2. Wrapper함수 역할**
decorator는 wrapper함수를 내부에 정의하여 사용한다. 원래 함수 **some_function**을 감싸고, 그 호출 전후에 다른 코드를 추가할 수 있는 역할
- 원래 함수 호출 전후에 추가 동작을 수행
- 원래 함수가 정상적으로 호출되도록 관리
- 필요한 경우 원래 함수의 반환값을 조작하거나 새로운 값을 반환

<br/>

### **3. 예제**

**예제코드**
```python
# 데코레이터 함수 정의
def my_decorator(func):
    # 래퍼 함수 정의
    def wrapper(*args, **kwargs):
        # 추가 기능 1: 원래 함수 호출 전 실행
        print("Function is about to run.")
        
        # 원래 함수 호출
        result = func(*args, **kwargs)
        
        # 추가 기능 2: 원래 함수 호출 후 실행
        print("Function has finished running.")
        
        # 원래 함수의 반환값 반환
        return result
    
    return wrapper

# 데코레이터 적용
@my_decorator
def say_hello():
    print("Hello, world!")

# 함수 호출
say_hello()
```

**실행결과**
```
Function is about to run.
Hello, world!
Function has finished running.
```

**동작과정 설명**
1. **데코레이터 정의**: my_decorator는 인수로 func를 받는 데코레이터 함수입니다. 이때 func는 데코레이터가 적용된 say_hello 함수입니다.
2. **래퍼 정의**: wrapper 함수는 데코레이터 내부에 정의되어 있으며, 원래 함수(func)를 감쌉니다.
3. **래퍼 호출**: say_hello()를 호출하면, 실제로는 wrapper()가 호출됩니다.
4. **추가 동작 수행**: wrapper는 원래 함수 func 호출 전후에 추가 기능을 수행합니다.
5. **원래 함수 호출**: wrapper 안에서 func()를 호출하여 say_hello()의 원래 동작(print("Hello, world!"))을 실행합니다.
6. **래퍼 반환**: wrapper는 원래 함수의 반환값을 그대로 반환하거나, 필요에 따라 조작된 값을 반환합니다.

<br/>

**함수의 인수와 반화값이 있는경우**
wrapper함수는 원래 함수와 동일한 인수를 받아야 하므로 ***args**와 ****kwars**를 통해 모든 위치 인수와 키워드 인수를 받습니다. 

```python
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print("Arguments were:", args, kwargs)
        result = func(*args, **kwargs)
        return result
    return wrapper

@my_decorator
def add(x, y):
    return x + y

# 호출 예시
print(add(3, 5))
```

**출력**
```
Arguments were: (3, 5) {}
8
```

### **4. decorator를 활용하는 상황**
- **로깅**: 함수가 호출될 때마다 로그를 남기기 위해 사용합니다.
- **성능 측정**: 함수가 얼마나 시간이 걸리는지 측정할 때 사용합니다.
- **권한 검사**: 특정 조건을 검사하여 함수 실행 여부를 결정할 때 사용합니다.
- **캐싱**: 동일한 입력에 대해 함수의 결과를 캐싱하여 성능을 향상시킬 때 사용합니다.