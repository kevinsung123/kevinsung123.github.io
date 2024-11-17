---
title: "Concurrent모듈을 활용하여 병렬/비동기 처리"
date : 2024-11-17 17:00:00 +0900
categories: [Python,Concurrent]
tags : [python,concurrent,]
---



### **비동기**

#### **concurrent.futuers모듈**

Python에서 병렬작업을 쉽게 처리할 수 있도록 도와주는 고수준의 Interface를 제공. 이 모듈은 Thread Pool또는 Process Pool에 제출하여 비동기 실행을 관리

#### **주요 구성요소**

1. **Executoer** 클래스

- **concurrent.futures.Executor**는 추상클래스이며, 병렬 실행환경을 제공
- 두가지 주요 서브클래스틀 제공
  - **ThreadPoolExecutor** :  스레드를 사용하여 병렬 실행을 처리
  - **ProcessPoolExecutor** : 프로세스 사용하여 병렬 실행 처리

1. **Future객채**

- 작업이 완료될때 결과를 나타나는 객체
- **Future**객체를 통해

1. **비동기 작업 제출 및관리**

- **submit()** 또는 **map()** 메서드를 사용하여 작업을 제출
- **as_completed** 및 **wait** 함수로 작업의 완료상태를 관리

#### **주요 메서드 및 함수**

1. **submit()** : 작업을 비동기로 제출하여 Future객체를 반환

```python
executor.submit(func, *args, **kwargs)
```

2. **map()** : 1. **submit** : 작업을 비동기로 제출하여 Future객체를 반환

```python
executor.map(func, iterable, timeout=None)
```

1. **as_completed()** : 1. **submit** : 작업 완료 순서대로 Future객체를 반환

```python
as_completed(futures, timeout=None)
```

1. **wait()** : 1. **submit** : 작업이 완료되거나 취소될 떄까지 대기

```python
wait(futures, return_when)
```

### 예제

**ThredPoolExecutor사용**
```python
from concurrent.futures import ThreadPoolExecutor, as_completed
import time

def task(n):
    time.sleep(n)
    return f"Task {n} completed"

with ThreadPoolExecutor(max_workers=3) as executor:
    futures = [executor.submit(task, i) for i in [3, 1, 2]]

    for future in as_completed(futures):  # 완료된 순서대로 처리
        print(future.result())


```

**ProcessPoolExecutor사용**
```python
from concurrent.futures import ProcessPoolExecutor
import os

def square(n):
    return n * n

with ProcessPoolExecutor(max_workers=4) as executor:
    results = executor.map(square, range(10))
    print(list(results))  # [0, 1, 4, 9, ..., 81]
```

**스크립트**
```python
from google.cloud import asset_v1
from google.cloud import resourcemanager_v3
from concurrent.futures import ThreadPoolExecutor, as_completed
import pandas as pd
import time

# Google Cloud 클라이언트 초기화
FOLDER_CLIENT = resourcemanager_v3.FoldersClient()
ASSET_CLIENT = asset_v1.AssetServiceClient()

folder_cache = {}


def fetch_folder_name(folder_id):
    if folder_id in folder_cache:  # 캐시확인
        return folder_cache[folder_id]

    try:
        time.sleep(0.1)  # 속도 제한
        folder = FOLDER_CLIENT.get_folder(name=f"folders/{folder_id}")
        folder_name = folder.display_name
        folder_cache[folder_id] = folder_name
        return folder_name
    except Exception as e:
        print(f"Error retrieving folder {folder_id}: {e}")
        return None


def get_folder_names(folder_id_list):
    folder_names = {}

    # 멀티스레딩: 최대 5개의 스레드 사용
    with ThreadPoolExecutor(max_workers=5) as executor:
        # 태스크 제출: fetch_folder_name 호출
        # future_to_id : dictionary
        # Future객체와 (idx,folder_id) 튜플을 매핑한 dict
        # Future객체를 key로 사용하여 해당 작업과 관련된 idx,folder_id를 값으로 저장

        future_to_id = {
            executor.submit(fetch_folder_name, folder_id): (idx, folder_id)
            for idx, folder_id in enumerate(folder_id_list)
        }

        # 완료된 태스크에서 결과 수집
        # 완료된 작업의 결과를 순차적으로 가져옴
        for future in as_completed(future_to_id):
            idx, folder_id = future_to_id[future]  # 인덱스와 ID 가져오기 (위에서 저장한 tuple)
            try:
                name = future.result()  # fetch_folder_name의 반환값
                if name:  # 이름이 유효한 경우만 추가
                    folder_names[f"folder_{idx}_name"] = name
            except Exception as e:
                print(f"Error in future for folder {folder_id}: {e}")

    return folder_names

```

#### **함수 1: fetch_folder_name(folder_id)**

- **역할**:
주어진 folder_id에 대해 Google Cloud API를 호출하여 폴더의 display name을 가져옵니다. 가져온 이름은 캐시에 저장하여, 동일한 folder_id에 대해 반복적으로 API를 호출하지 않도록 합니다.

- **주요 동작**:
- **캐시 확인**:
folder_id가 이미 folder_cache에 저장되어 있으면, 저장된 이름을 반환합니다.
캐시를 통해 불필요한 API 호출을 줄이고 응답 속도를 높입니다.
- **API 호출**:
FOLDER_CLIENT.get_folder를 사용해 Google Cloud API로 폴더 정보를 가져옵니다.
folder.display_name 속성을 추출하여 폴더 이름을 반환합니다.

- **에러 처리**:
API 호출 실패 시 예외를 출력하고 None을 반환합니다.

#### **함수 2: get_folder_names(folder_id_list)**

- **역할**:
폴더 ID 목록을 입력받아 각 폴더의 이름을 가져오고, 결과를 딕셔너리로 반환합니다. 반환 형식은 {"folder_{idx}_name": folder_name}입니다.

### concurrent.futures vs 멀티스레딩/멀티프로세싱 모듈

| **Feature**              | **concurrent.futures**               | **threading / multiprocessing**        |
| ------------------------ | ------------------------------------ | -------------------------------------- |
| **추상화 수준**          | 고수준 (더 쉽고 간결)                | 저수준 (세부 제어 가능)                |
| **스레드/프로세스 관리** | 자동 (풀 관리)                       | 수동 (직접 생성 및 관리)               |
| **적합한 작업 유형**     | 병렬 작업 (I/O 또는 CPU)             | 더 복잡한 동작 필요 시                 |
| **코드 복잡성**          | 낮음 (간단한 API로 작업 가능)        | 높음 (스레드/프로세스 수동 제어 필요)  |
| **성능 튜닝**            | 제한적 (풀 크기 등 기본 제공 수준)   | 유연함 (정교한 설정 및 최적화 가능)    |
| **에러 처리**            | 내장된 에러 추적 및 재시도 기능 제공 | 수동으로 처리 코드 구현 필요           |
| **유지보수성**           | 좋음 (표준화된 인터페이스)           | 복잡한 로직일 경우 유지보수 어려움     |
| **사용 사례**            | 단순 병렬 실행, 작업 큐 처리         | 고급 병렬 처리, 사용자 정의 워크플로우 |

### **참고**

- <https://docs.python.org/ko/3.7/library/concurrent.futures.html>
- <https://docs.python.org/ko/3/library/concurrent.futures.html>
