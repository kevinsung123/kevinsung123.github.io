---
title: "Cloud Asset를 활용한 GCE리스트 추출 스크립트"
date : 2024-11-15 17:00:00 +0900
categories: [GCP,CloudAsset]
tags : [gcp,cloudasset,pyython]
---


### **Cloud Asset를 활용한 GCE리스트 추출 스크립트**

### **배경 및 목적**
GCP에서 관리하는 GCE가 매우 많을경우 계층구조(hierarchy)가 복잡할때 ex) Organizaion-Folder-Project 한번에 GCE리스트를 추출하기 위해 작성.
기존에 Compue Enigne API로는 특정 프로젝트에 인스턴스 리스트만 조회하여 상위 레벨의 폴더까지 리스팅 하기 어려웠음.  


### **환경**

{: .prompt-info}

> python 3.10.15
> 
> google-cloud-asset 3.27.1
> 
> google-cloud-resource-manager 1.13.1

<br/>

### **사전 준비**
1. Google Cloud SDK 설치 및 인증
2. **google-cloud-asset** 설치

```bash
pip install google-cloud-asset
pip install google-resource-manager
```
<br/>

### **Python코드**

```python
from google.cloud import asset_v1
from google.oauth2 import service_account
from google.cloud import resourcemanager_v3
import pandas as pd

# 서비스 계정 키 파일 경로
KEY_PATH = "path/to/your-service-account-key.json"

# 서비스 계정 인증 설정
# credentials = service_account.Credentials.from_service_account_file(KEY_PATH)
# client = asset_v1.AssetServiceClient(credentials=credentials)


folder_client = assetmanager_v3.FoldersClient()


def get_folder_name(folder_id_list):
    """
    Retrieve the display name of a Google Cloud folder.

    Args:
        folder_id (str): The ID of the folder to look up.

    Returns:
        str: The display name of the folder, or None if not found or access is denied.

    Raises:
        Exception: If there is an error while retrieving the folder's details.
    """

    try:
        # 폴더 정보를 가져오기
        folders = {}
        for idx, folder_id in enumerate(folder_id_list):
            folders[f'folder_{idx}name'] = folder_client.get_folder(name=f'{folder_id}').display_name
        return folders
    except Exception as e:
        print(f"Error occurred: {e}")
        return None


def search_all_assets():
    # 검색할 범위 설정 (프로젝트, 폴더, 조직 중 하나)
    # asset Manager v3 클라이언트 생성
    SCOPE = "projects/YOUR_PROJECT_ID"  # 또는 "folders/FOLDER_ID", "organizations/ORG_ID"

    # 필터링할 리소스 유형 (예: Compute Engine 인스턴스)
    ASSET_TYPES = ["compute.googleapis.com/Instance"]
    QUERY=f"folders:{folder_id}"
    asset_client = asset_v1.AssetServiceClient()


    # 요청 파라미터 설정
    request = asset_v1.SearchAllassetsRequest(
        scope=SCOPE,
        asset_types=ASSET_TYPES,  # 특정 리소스 유형만 필터링 (선택사항)
        query="",  # 쿼리 조건 (예: "name:my-instance") - 선택사항
        page_size=10  # 한 번에 가져올 리소스 수
    )

     print(f"Searching assets in {SCOPE}...")
    response = asset_client.search_all_resources(request=request)
    print(f"Total assets found : {len(list(response))}")
    # 페이지 순회
    all_results = list(response)

    # 결과저장
    expected_columns = ['folder_1_name', 'folder_1_name', 'folder_2_name', 'folder_3_name', 'folder_4_name',
                        'project',
                        'name', 'create_time', 'ip', 'machineType', 'zone', 'status']
    df = pd.DataFrame()
    for idx, asset in enumerate(all_results):
        folder_dict = get_folder_name((list(reversed(asset.folders))))
        for seq, name in folder_dict.items():
            df.loc[idx, f'folder_{seq}_name'] = name
        df=df.reindex(columns=expected_columns,fill_value=None)
        df.loc[idx, 'project'] = asset.name.split('/')[4]
        df.loc[idx, 'name'] = asset.name.split('/')[8]
        df.loc[idx, 'ip'] = ''.join(asset.additional_attributes['internalIps'])
        df.loc[idx, 'machineType'] = ''.join(asset.additional_attributes['machineType'])
        df.loc[idx, 'state'] = asset.state


# 함수 실행
if __name__ == "__main__":
    search_all_assets()


```

### **성능 개선**
위의 코드에서 1개의 dataframe 처리시 거의 1초가 걸린다.
그래서 성능을 개선해보자. 원인으로는 Folder name구하는 API가 오래걸림. 그리고 Dataframe 구조를 효율화시키는 방안으로 개선

**Key Optimizations:**
- Parallel Folder Lookups: Using ThreadPoolExecutor, we fetch all folder names in parallel, which speeds up the folder name retrieval.
- Efficient Dataframe Construction: Instead of modifying the DataFrame in each loop iteration, we append rows to a list and construct the DataFrame at the end.
- Reduced API Calls: Increased the page_size to 100, reducing the number of calls mad

```python
from google.cloud import asset_v1
from google.cloud import resourcemanager_v3
from concurrent.futures import ThreadPoolExecutor
import pandas as pd

# Google Cloud 클라이언트 초기화
FOLDER_CLIENT = resourcemanager_v3.FoldersClient()
ASSET_CLIENT = asset_v1.AssetServiceClient()

def get_folder_names(folder_id_list):
    """
    Retrieve display names for a list of Google Cloud folder IDs.

    Args:
        folder_id_list (list): List of folder IDs.

    Returns:
        dict: Dictionary with folder sequence as key and folder name as value.
    """
    def fetch_folder_name(folder_id):
        try:
            folder = FOLDER_CLIENT.get_folder(name=f"folders/{folder_id}")
            return folder.display_name
        except Exception as e:
            print(f"Error retrieving folder {folder_id}: {e}")
            return None

    folder_names = {}
    with ThreadPoolExecutor() as executor:
        results = executor.map(fetch_folder_name, folder_id_list)
        for idx, name in enumerate(results):
            folder_names[f"folder_{idx + 1}_name"] = name
    return folder_names

def search_all_assets():
    """
    Search for all assets within a specified scope and process the results.
    """
    SCOPE = "projects/YOUR_PROJECT_ID"  # Specify the scope
    ASSET_TYPES = ["compute.googleapis.com/Instance"]

    # Request to search all assets
    try:
        request = asset_v1.SearchAllResourcesRequest(
            scope=SCOPE,
            asset_types=ASSET_TYPES,
            page_size=10,
        )
        response = ASSET_CLIENT.search_all_resources(request=request)
    except Exception as e:
        print(f"Error during asset search: {e}")
        return

    # Define expected columns for the DataFrame
    expected_columns = [
        'folder_1_name', 'folder_2_name', 'folder_3_name', 'folder_4_name',
        'project', 'name', 'create_time', 'ip', 'machineType', 'zone', 'state'
    ]
    df = pd.DataFrame(columns=expected_columns)

    # Process assets and populate the DataFrame
    for idx, asset in enumerate(response):
        try:
            # Extract folder information
            folder_ids = list(reversed(asset.folders))
            folder_dict = get_folder_names(folder_ids)

            # Extract other asset details
            asset_data = {
                **folder_dict,
                'project': asset.name.split('/')[4],
                'name': asset.name.split('/')[-1],
                'create_time': asset.create_time,
                'ip': ''.join(asset.additional_attributes.get('internalIps', [])),
                'machineType': ''.join(asset.additional_attributes.get('machineType', [])),
                'zone': asset.additional_attributes.get('zone', ''),
                'state': asset.state.name,
            }

            # Add to DataFrame
            df = pd.concat([df, pd.DataFrame([asset_data])], ignore_index=True)
        except Exception as e:
            print(f"Error processing asset {asset.name}: {e}")

    # Reindex to ensure all columns are present
    df = df.reindex(columns=expected_columns, fill_value=None)

    # Save or process the DataFrame as needed
    print(df.head())

# Run the function
if __name__ == "__main__":
    search_all_assets()
```

### **한계점**

{: .prompt-danger}

> 429 quota exceeded for quota metric folder v3 get request and limit folder v3 get reqeusts per minute of service cloudresourcmnager.googlepias.com

Google Cloud API 호출에서 **429 Quota Exceede** 에러는 API호출이 서비스 한도를 초과해서 발생. 이는 **FoldersClient.get_folder()**호출이 짧은 시간 내에 너무 많이 발생하여 나타남.

<br/>

### **해결 방안**

1. **요청속도 제한**
Python **time.sleep**을 활용하여 속도 제어

2. **병렬 요청조정**
요청이 동시에 많이 발생하지 않도록 제한
**ThreadPoolExecutor**에서 **max_workers**를 조정하여 동시에 처리되는 작업 수 를 제한 

3. **폴더 데이터 캐싱**
같은 폴더에 대해 반복적으로 요청이 발생하지 않도록 캐시를 활용 **dict**에 이미 요청한 폴더의 ID 이름을 지정하고 중복요청을 방지


**위의 해결책을 적용한 최종 스크립트**
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


def search_all_assets():
    """
    Search for all assets within a specified scope and process the results.
    """
    SCOPE = "projects/YOUR_PROJECT_ID"  # Specify the scope
    ASSET_TYPES = ["compute.googleapis.com/Instance"]

    # Request to search all assets
    try:
        request = asset_v1.SearchAllResourcesRequest(
            scope=SCOPE,
            asset_types=ASSET_TYPES,
            page_size=10,
        )
        response = ASSET_CLIENT.search_all_resources(request=request)
    except Exception as e:
        print(f"Error during asset search: {e}")
        return

    # Define expected columns for the DataFrame
    expected_columns = [
        'folder_0_name', 'folder_1_name', 'folder_2_name', 'folder_3_name', 'folder_4_name',
        'project', 'name', 'create_time', 'ip', 'machineType', 'zone', 'state'
    ]
    df = pd.DataFrame(columns=expected_columns)

    # Process assets and populate the DataFrame
    for idx, asset in enumerate(response):
        try:
            # Extract folder information
            folder_ids = list(reversed(asset.folders))
            folder_dict = get_folder_names(folder_ids)

            # Extract other asset details
            asset_data = {
                **folder_dict,
                'project': asset.name.split('/')[4],
                'name': asset.name.split('/')[-1],
                'create_time': asset.create_time,
                'ip': ''.join(asset.additional_attributes.get('internalIps', [])),
                'machineType': ''.join(asset.additional_attributes.get('machineType', [])),
                'zone': asset.additional_attributes.get('zone', ''),
                'state': asset.state.name,
            }

            # Add to DataFrame
            df = pd.concat([df, pd.DataFrame([asset_data])], ignore_index=True)
        except Exception as e:
            print(f"Error processing asset {asset.name}: {e}")

    # Reindex to ensure all columns are present
    df = df.reindex(columns=expected_columns, fill_value=None)

    # Save or process the DataFrame as needed
    print(df.head())


# Run the function
if __name__ == "__main__":
    search_all_assets()

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

- **주요 동작**:
- **멀티스레딩 설정**:

**ThreadPoolExecutor**를 사용해 폴더 이름을 병렬로 가져옵니다.
max_workers=5로 설정해 동시에 5개의 요청을 처리합니다. 이는 속도 제한 및 API 부하를 고려한 값입니다.

- **태스크 제출**:

executor.submit(fetch_folder_name, folder_id)를 사용해 각 폴더 ID에 대해 fetch_folder_name 호출 작업을 스레드 풀에 제출합니다.
반환된 future 객체와 folder_id의 매핑을 future_to_id 딕셔너리에 저장합니다.

- **결과 수집**:
as_completed(future_to_id)를 사용해 완료된 작업의 결과를 순차적으로 가져옵니다.
각 future 결과에서 폴더 이름을 가져와 {"folder_{idx}_name": folder_name} 형식으로 딕셔너리에 추가합니다.

= **에러 처리**:

작업 중 예외가 발생한 경우 해당 폴더 ID와 함께 에러 메시지를 출력합니다.

### **비동기**
#### **concurrent.futuers모듈**
Python에서 병렬작업을 쉽게 처리할 수 있도록 도와주는 고수준의 Interface를 제공. 이 모듈은 Thread Pool또는 Process Pool에 제출하여 비동기 실행을 관리

#### **주요 구성요소 
1. **Executoer** 클래스
- **concurrent.futures.Executor**는 추상클래스이며, 병렬 실행환경을 제공
- 두가지 주요 서브클래스틀 제공
  - **ThreadPoolExecutor** :  스레드를 사용하여 병렬 실행을 처리
  - **ProcessPoolExecutor** : 프로세스 사용하여 병렬 실행 처리 

2. **Future객채**
- 작업이 완료될때 결과를 나타나는 객체
- **Future**객체를 통해 

3. **비동기 작업 제출 및관리**
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


### **참고**
- https://docs.python.org/ko/3.7/library/concurrent.futures.html
- https://docs.python.org/ko/3/library/concurrent.futures.html
- https://velog.io/@jaewan/Pythonconcurrent.futures-%EB%AA%A8%EB%93%88
- https://python.plainenglish.io/13-python-shortcuts-every-developer-should-use-for-faster-coding-a9609daacc51
- https://cloud.google.com/python/docs/reference/cloudasset/latest/google.cloud.asset_v1.types.SearchAllResourcesRequest
- https://cloud.google.com/python/docs/reference/cloudasset/latest/google.cloud.asset_v1.types.SearchAllResourcesResponse
- https://chatgpt.com/c/67382b99-39f0-8011-8513-e3dec4a58a97
- https://chatgpt.com/c/67382b99-39f0-8011-8513-e3dec4a58a97