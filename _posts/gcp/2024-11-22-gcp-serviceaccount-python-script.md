---
title: (3) GCP Serivce Account key Python Script
date : 2024-11-19 09:00:00 +0900
categories: [GCP, ServiceAccount]
tags : [gcp,serviceaccount,python,upload]
---


### **GCP Serivce Account Key 생성 (만료일 포함)**

#### **배경**

Python SDK를 활용하여 GCP Serivce Account key생성시 GCP자체적으로 key 만료일 지정하는 기능이 없어서 
해당 스크립트 개발

#### 로직 및 Python 스크립트

1. openssl을 사용하여 prviate/public key 생성
2. GCP서비스게정에 public key를 업로드
3. 서비스계정의 key파일 생성 및 다운로드

```python
# basic
from google.oauth2 import service_account
from google.cloud import iam_credentials_v1
from google.cloud import iam_admin_v1
from google.cloud.iam_admin_v1 import types
from googleapiclient.discovery import build
import sys
import os
import subprocess
from datetime import datetime
import datetime
from typing import List
from typing import Optional
import json
from common import logger_config
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))


# Logger

# google-cloud

LOG_OUTPUT = "log"
fiel_name = "file_name"
current_date = datetime.now().strftime('%Y-%m-%d')
log_file_name = f"{LOG_OUTPUT}_{fiel_name}_{current_date}.log"
logger = logger_config.setup_logger(file_name, log_file_name)


def list_service_account(project_id: str) -> List[iam_admin_v1.ServiceAccount]:
    """_summary_
    Get list of project service accounts
    Args:
        project_id (str): _description_

    Returns:
        List[iam_admin_v1.ServiceAccount]: _description_
    """
    iam_admin_client = iam_admin_v1.IAMClient()
    request = type.ListServiceAccountRequest()
    request.name = f"projects/{project_id}"

    accounts = iam_admin_client.list_service_accounts(request=request)
    logger.info(acccounts)
    return accounts.accounts


def get_service_account(project_id: str, account: str) -> iam_admin_v1.ServiceAccount:
    """_summary_
    Get Certain Service account
    Args:
        project_id (str): _description_
        account (str): _description_

    Returns:
        iam_admin_v1.ServiceAccount: _description_
    """
    iam_admin_client = iam_admin_v1.IAMClient()
    request = types.GetServiceAccountKeyRequest()
    request.name = f"projects/{project_id}/serviceAccounts/{account}"

    account = iam_admin_client.get_service_account(request=request)
    logger.info(accounts)
    return account


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


def generate_keys():
    """
    Generate private and public keys using OpenSSL.
    Logs generated keys to predefined file locations.
    """
    try:

        subprocess.run(
            ["openssl", "req", "-x509", "--nodes", "-newkey", "rsa:2048"
             "-days", str(DAYS_VALID),
             "-keyout", PRIVATE_KEY_FILE,
             "-out", PUBLIC_KEY_FILE,
             "-subj", "/CN=unused"
             ],
            check=True
        )
        logger.info(f"Generated private key: {PRIVATE_KEY_FILE}")

    except subprocess.CalledProcessError as e:
        logger.error("Error during OpenSSL operations:", e)
        exit(1)


def upload_public_key(service_account_email: str, project_id: str) -> dict:
    """
    Upload a public key to a GCP service account.

    Args:
        service_account_email (str): The email of the service account.
        project_id (str): The ID of the GCP project.

    Returns:
        dict: The API response containing details of the uploaded key.
    """
    try:

        iam_service = build("iam", "v1")

        # 공개 키를 파일로부터 읽기 (바이트 형식으로 읽어야 함)
        with open(PUBLIC_KEY_FILE, "rb") as key_file:  # 'rb' 모드를 사용하여 바이트 형식으로 읽기
            public_key = key_file.read()

        # 공개 키를 Base64로 인코딩
        #
        public_key_base64 = base64.b64encode(public_key).encode(
            "utf-8").decode("utf-8")  # 바이트 데이터를 Base64로 인코딩하고 문자열로 변환

        # GCP에 공개 키 업로드 요청
        key_request = iam_service.projects().serviceAccounts().keys().upload(
            name=f"projects/{project_id}/serviceAccounts/{service_account_email}",
            body={
                "publicKeyData": public_key_base64  # Base64로 인코딩된 공개 키 데이터
            }
        )
        key_response = key_request.execute()
        logger.info(f"Public key uploaded successfully. Key ID: {
                    key_response['name']}")
        return key_response
    except Exception as e:
        logger.error(f"Error uploading public key: {e}")
        exit(1)


def get_service_account_client_id(service_account_email: str) -> Optional[str]:
    """
    Retrieve the client ID (uniqueId) of a service account.

    Args:
        service_account_email (str): The email of the service account.

    Returns:
        Optional[str]: The client ID (uniqueId) or None if not found.
    """
    try:
        service = build("iam", "v1")
        request = service.projects().serviceAccounts().get(
            name=f"projects/-/serviceAccounts/{service_account_email}"
        )
        response = request.execute()
        client_id = response.get("uniqueId")
        return client_id
    except Exception as e:
        logger.error(f"Error retrieving service account client ID: {e}")
        return None


def list_keys(service_account_email: str) -> Optional[dict]:
    """
    List and return the most recent key for a service account.

    Args:
        service_account_email (str): The email of the service account.

    Returns:
        Optional[dict]: The most recent key details or None if no valid keys are found.
    """
    iam_service = build("iam", "v1")
    keys = (
        iam_service.projects()
        .servcieAccounts()
        .keys()
        .list(name='/projects/-serviceAccounts/{service_account_mail}')
        .execute()
    )
    sorted_keys = sorted(keys['keys'], key=lambda x: datetime.datetime.fromisoformat(
        x["validAfterTime"].replace('Z', "+00:00"), reverse=True))

    for key in sorted_keys:
        date_format = "%Y-%m-%dT%h:%m:%SZ"
        valid_after = key['validAfterTime']
        valid_after_date = datetime.datetime.strptime(valid_after, date_format)

        valid_beforer = key['validBeforeTime']
        valid_before_date = datetime.datetime.strptime(
            valid_beforer, date_format)

        date_difference = abs((valid_before_date-valid_after_date).days)

        if date_difference == 90:
            return key


def create_service_account_key(service_account_email, project_id):

    try:

        client_id = get_service_account_client_id(service_account_email)
        private_key_id = list_keys(
            service_account_email).get('name').split('/')[5]

        with open(PRIVATE_KEY_FILE, "rb") as key_file:
            private_key = key_file.read()

        private_key_decode = private_key.decode('utf-8')

        data = {
            "type": "service_account",
            "project_id": project_id,  # GCP 프로젝트 ID
            "private_key_id": private_key_id,  # 서비스 계정의 Private Key ID
            "private_key": private_key,  # Private Key (PEM 형식으로 제공된 값)
            "client_email": client_email,  # 서비스 계정의 이메일
            "client_id": client_id,  # 서비스 계정의 클라이언트 ID
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url": f"https://www.googleapis.com/robot/v1/metadata/x509/{service_account_email.replace('@', '%40')}"
        }

        logger.info(data)
        service_account=service_account_email.strip('@')[0]
        with open(f'{service_account}.json','w') as json_file:
            json.dump(data,json_file,indent=4)

    except Exception as e:
        logger.error("Error creating service account key :{e}")
        exit(1)
```
### **참고**

- <https://stackoverflow.com/questions/71037751/invalid-public-key-when-trying-to-upload-a-key-for-a-service-account-using-pytho>
- <https://cloud.google.com/iam/docs/keys-upload?hl=ko#iam-service-accounts-upload-rest>
- <https://cloud.google.com/iam/docs/reference/rest/v1/projects.serviceAccounts.keys/upload>
