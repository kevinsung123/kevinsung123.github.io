---
title: "만료기간이 있는 Service Account key생성"
date : 2024-11-14 00:00:00 +0900
categories: [GCP, ServieAccount]
tags : [gcp,serviceaccount]
---


### **만료기간이 있는 Service Account key생성*

```python
from google.cloud import iam_credentials_v1
import datetime
import json

def create_service_account_key(project_id, service_account_email, key_output_file):
    """
    GCP 서비스 계정 키 파일을 생성하고 저장합니다.
    
    Args:
        project_id (str): GCP 프로젝트 ID.
        service_account_email (str): 서비스 계정 이메일.
        key_output_file (str): 키 파일을 저장할 경로.
    
    Returns:
        None
    """
    # IAM Credentials 클라이언트 초기화
    client = iam_credentials_v1.IAMCredentialsClient()

    # 요청 구성
    name = f"projects/-/serviceAccounts/{service_account_email}"
    
    try:
        # 서비스 계정 키 생성
        key_response = client.generate_access_token(
            name=name,
            delegates=[],
            scope=["https://www.googleapis.com/auth/cloud-platform"],
            lifetime=datetime.timedelta(days=365)  # 365일 동안 유효
        )
        access_token = key_response.access_token

        # 키를 파일에 저장
        with open(key_output_file, "w") as f:
            json.dump({"access_token": access_token}, f)

        print(f"키 파일이 '{key_output_file}'에 저장되었습니다.")
    except Exception as e:
        print(f"키 생성 중 오류 발생: {e}")

# 실행 예제
if __name__ == "__main__":
    PROJECT_ID = "your-project-id"  # GCP 프로젝트 ID
    SERVICE_ACCOUNT_EMAIL = "your-service-account@your-project-id.iam.gserviceaccount.com"
    KEY_OUTPUT_FILE = "service-account-key.json"

    create_service_account_key(PROJECT_ID, SERVICE_ACCOUNT_EMAIL, KEY_OUTPUT_FILE)
```

### **참고**
- https://cloud.google.com/iam/docs/reference/credentials/rest/v1/projects.serviceAccounts/generateAccessToken
- https://chatgpt.com/c/673a95d9-f19c-8011-bfd8-231d5dcaa7d7