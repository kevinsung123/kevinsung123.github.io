---
title: "Python Tips"
date : 2024-11-18 12:00:00 +0900
categories: [Python, Tip]
tags : [python,tip]
---


### **Python Coding TIP**

#### **1. Iterate with `enumerate` instead of `range(len)`**

```python
for i in range(len(my_list)):
    print(i, my_list[i])
```

- **enumerate** cleaner,faster, dare
  
```python
for i, value in enumerate(my_list):
    print(i, value)
```

#### **2. Use List Comprehsnsion instead of Raw Loops**

```python
squared = []
for num in range(10):
    squared.append(num ** 2)
```

- **enumerate** : concise,elegant, easier to read

```python
squared = [num ** 2 for num in range(10)]
```

#### **3. Sort Complex Iterables with the Built-in `sorted` method**

{: .prompt-tip}

> sorted() doesn’t just sort lists—it works with any iterable. Flex those skills!

```python
sorted_employees = sorted(employees, key=lambda x: x['age'])
```

#### **4. Define Default Values in Dictionaries with `.get()` and `.setdefault()`**

```python
value = my_dict['nonexistent_key'] if 'nonexistent_key' in my_dict else 'default'
```

- default value없이 dictionary key 조회시 KeyError가 발생하므로 다음과 같이 조회

```python
value = my_dict.get('nonexist
value = my_dict.setdefault('nonexistent_key', 'default')ent_key', 'default')
```

#### **5. Count Hashable Objects with `collections.Counter`**

#### **TO_BE**

```python
from collections import Counter

word_counts = Counter(['apple', 'banana', 'apple'])
# Output: Counter({'apple': 2, 'banana': 1})
```

#### **6. Merge Dictionaries with the Double Asterisk Syntax**

```python
dict1 = {'a': 1, 'b': 2}
dict2 = {'b': 3, 'c': 4}

merged = {**dict1, **dict2}
# Output: {'a': 1, 'b': 3, 'c': 4}
```

#### **7. Handle Exceptions Like a Pro with `try/else`**

- **else** : exception이 발생하지 않을떄 로직작성

```python
try:
    result = risky_operation()
except SomeError:
    handle_error()
else:
    handle_success()
```

#### **8. Fast String Concatenation with .join()**

```python
# Inefficient
result = ""
for s in list_of_strings:
    result += s

# Efficient
result = ''.join(list_of_strings)
```

#### **9. The Walrus Operator (:=): Assign While You Check**

- walrus operator (python3.8에서 출시)

```python
data = input("Enter something: ")
if len(data) > 10:
    print("Long input!")
```

```python
if (data := input("Enter something: ")).strip() and len(data) > 10:
    print("Long input!")
```

#### **10. `collections.defaultdict`: Because Normal Dictionaries Are So Last Year**

- dictinary에서 key가 없을경우 에러가 발생할떄  사용
- 자동으로 new key에 접근할때 first value를 생성

```python
from collections import defaultdict
my_dict = defaultdict(int)
my_dict["counter"] += 1
```

#### **11. Context Managers: Stop Forgetting to Close Files**

- `with`구문은 자동으로 file을 닫음

```python
with open('data.txt', 'r') as file:
    data = file.read()
```

#### **12. setdefault(): Make Dictionaries Smarter**

```python
my_dict = {}
if "fruits" not in my_dict:
    my_dict["fruits"] = []
my_dict["fruits"].append("apple")
```

- key check를 하고 default값으로 초기화
  
```python
my_dict = {}
my_dict.setdefault("fruits", []).append("apple")
```

### **참고**

- <https://python.plainenglish.io/13-python-shortcuts-every-developer-should-use-for-faster-coding-a9609daacc51>
- <https://medium.com/@abdur-rahman/11-tips-to-instantly-improve-your-python-code-edf23fd93241>
