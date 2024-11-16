---
title: "Cloud Asset를 활용한 GCE리스트 추출 스크립트"
date : 2024-11-14 17:00:00 +0900
categories: [GCP,CloudAsset]
tags : [gcp,cloudasset,pyython]
---


### **Cloud Asset를 활용한 GCE리스트 추출 스크립트**

### **배경 및 목적**
GCP에서 관리하는 GCE가 매우 많을경우 계층구조(hierarchy)가 복잡할때 ex) Organizaion-Folder-Project 한번에 GCE리스트를 추출하기 위해 작성 


### **사전 준비**
1. Google Cloud SDK 설치 및 인증
2. **google-cloud-asset** 설치
```bash
pip install google-cloud-asset

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
그래서 성능을 개선해보자

**Key Optimizations:**
Parallel Folder Lookups: Using ThreadPoolExecutor, we fetch all folder names in parallel, which speeds up the folder name retrieval.
Efficient Dataframe Construction: Instead of modifying the DataFrame in each loop iteration, we append rows to a list and construct the DataFrame at the end.
Reduced API Calls: Increased the page_size to 100, reducing the number of calls mad



### **참고**
- https://python.plainenglish.io/13-python-shortcuts-every-developer-should-use-for-faster-coding-a9609daacc51
- https://cloud.google.com/python/docs/reference/cloudasset/latest/google.cloud.asset_v1.types.SearchAllResourcesRequest
- https://cloud.google.com/python/docs/reference/cloudasset/latest/google.cloud.asset_v1.types.SearchAllResourcesResponse