---
title: "3 Key Skills for Handling Modules in Python"  
date: 2021-03-27 12:00:00 +0900
categories: [Python,module]
tags: [python,module]
comments: true
pin: true
math: true
mermaid: true
---  

---  
layout: post  
title: "[Python] 3 Key Skills for Handling Modules in Python"  
subtitle: "3 Key Skills for Handling Modules in Python"  
categories: python  
tags: skills module
comments: true  
---  

<!--more-->

---

## 3 Key Skills for Handling Modules in Python

Python에서 module은 python code를 포함하는 파일 그것의 `.py`라는 suffix가 붙음
일반적으로 관련 class또는 function을 모듈에 넣고 전체프로그램을 다른 module로 분리하는것이 좋은 programming practice이다

아래에는 module을 잘 사용하고 관리하기 위한 좋은 3가지 skill에대한 소개

---

### 1. Import Python Modules Skillfully

##### (1) Don't use an asterisk to import all things at once
- 모든 모듈을 import할떄 가장 기본적인 방법은 asterisk를 사용하는 것
    `from module_a import *`
- 그러나 위의 방법은 무엇을 import했는지 불명료하고 bug를 일으킬 가능성이 있음
    - 현재 파일의 name이 다른 imported name과 총동 가능성
    - imported module에 새로운것을 추가하면, 모든 new names은 또한 import된다. name conflict를 일으킬 가능성이 높음
- 필요한 모듈부분만 import 하는것은 좋은 습관이다    

#### (2) Give it a nickname for convenience
- datascientist라면 아래코드가 친숙할 것이다
```
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
```
- `as` keyword를 alias를 줌으로써 긴이름의 module을 더 짧게사용

#### (2) Use relative imports smartly
- dots`.`를 사용함으로써 현재 파일의 상대 경로 모듈을 더 효과적으로 가져옴
```
from . import module_a
from .. import module_b
```
- single dot은 `module_a`는 현재 파일의 위치에서 같은 directory에서 import(its's siblings)
- two dots은 `module_b` 현재 파일의 위에서 상대적으로 위의 directory에서 import(it's parent)

---

### 2. Execute Python Moduels as Scripts
- importing module에다가 또한 우리는 module을 개별적으로 script같이 실행가능
- 아래는 예시
`test.py`라는 모듈이 있고 아래 code가 포함
`print("Yang Zhou")`

terminal에서 module을 실행 시킬때, 아래와 같은 command를 입력
![sample](https://miro.medium.com/max/6000/1*Hf2a0I3GU_z88Ri30MqMTg.png)

위에 예와 같은이 `python`을 module이름 앞에 붙여서 실행

- `text.py`가 function or class를 포함시 우리는 `main`function을 포함하여 실행

```
def output_author(name):
    print(name)

if __name__ == "__main__":
    import sys
    output_author(name=sys.argv[1])
```

- module이 다른 module에 import 되면 main function은 실행하지 않으므로 유연성을 제공

---

### 2. Manage Python Modules by Packages
- python package는 다른 module들을 grouping시킴. logically related module들을 package에 넣는것은 좋은 습관
!(blog)[https://miro.medium.com/max/568/1*iy9OaOsJ9nU9OL2r702aBw.png]
- 위의 예시에서는 blog 그리고 mysite라는 2개의 python package그리고 migration이라는 blog의 sub package가 존재
package를 사용함으로써 프로젝트를 좀더 논리적으로 명확하게 관리가능



### 참고
[medium](https://medium.com/techtofreedom/3-key-skills-for-handling-modules-in-python-d644c5e5682)

[docs-python](https://docs.python.org/3/library/collections.html#collections.namedtuple)