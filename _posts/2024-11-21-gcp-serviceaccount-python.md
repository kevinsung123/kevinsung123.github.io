---
title: "(2) [트러블슈팅] GCP Serivce Account Upload Public Key with Python SDK"
date : 2024-11-19 09:00:00 +0900
categories: [GCP, ServiceAccount]
tags : [gcp,serviceaccount,python,upload]
---


### **GCP Serivce Account Upload Public Key with Python SDK**

#### **배경**

Python SDK를 활용하여 GCP Serivce Account에 public key를 upload시 에러가 발생
`gcloud cli`로는 정상적으로 추가하였는데, python sdk로는 에러가발생

{: .prompt-warning}

> HttpError 400 when requesting <https://iam.googleapis.com/v1/projects/aignx-test-cloud-setup/serviceAccounts/tanguy-abel-sa@aignx-test-cloud-setup.iam.gserviceaccount.com/keys:upload?alt=json> returned "Invalid value at 'public_key_data' (TYPE_BYTES), Base64 decoding failed for public_key =

#### **공식문서 참고**

| 필드              | 설명                                                                                                                                                         |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **publicKeyData** | RSA 공개 키로, X.509 v3 인증서 형식이어야 합니다. 인증서의 첫 번째 줄은 `-----BEGIN CERTIFICATE-----`, 마지막 줄은 `-----END CERTIFICATE-----`이어야 합니다. |
| **형식**          | Base64로 인코딩된 문자열                                                                                                                                     |
| **예시**          | `MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7+Zv6sU7n9n9sZP5R6cf+YoPfNwsmnU8B+YVe3vZg9Q33tSlgM1FcVxUYZ0YnA2W1G2lXkGU9WGy9+97kI7xA....`                      |
| **주요 사항**     | X.509 v3 인증서로 래핑된 RSA 공개 키여야 하며, Base64로 인코딩된 상태로 제공되어야 합니다. 인증서의 헤더와 푸터를 포함해야 합니다.                    .ㅇㄷ  |

#### **해결**

`gcloud` command으로 payload 분석 시 `publickeyData`는 반드시 `base64-encoded`되어야한다. 그래서 아래와 같이 public key를 변환해야함

```python
import base64
...

iam_service.projects().serviceAccounts().keys().upload(
        name="projects/my-cloud-project/serviceAccounts/my-sa@my-cloud-project.iam.gserviceaccount.com",
        body={
            "publicKeyData": base64.b64encode(public_key.encode("utf-8")).decode("utf-8")
        }).execute()
```

- 공개 키 데이터를 Base64로 인코딩하고 이를 문자열로 변환하는 과정입니다. 각 부분에 대한 설명은 아래와 같음
  
##### **1.`public_key.encode("utf-8")`**

- **목적** : `public key`변수를 UTF-8로 인코딩 형식의 바이트 배열로 변환
- **왜?** : Base64인코딩은 바이트데이터를 텍스트로 변화하기 위한 과정으로 먼저 바이트로 변환해야함

##### **2.`base64.b64encode(public_key.encode("utf-8"))`**

- **목적** : 위에서 바이트 형식으로 변환 `public key`를 Base64로 인코딩
- **왜?** : Base64는 이진데이터를 텍스트 형식으로 변화하는 방법 각 3바이트씩 묶어서 4개의 텍스트문자로 변환 인코딩 결과는 ASCII문자로 이루어진 문자열
  
##### **3.`.decode("utf-8")`**

- **목적** : `base64.b64encode는 Base64로 인코딩된 데이터를 바이트 형식으로 반환. 이 바이트 데이터를 UTF-8문자열로 변환
- **왜?** : GCP API는 Base64로 인코딩된 문자열을 요구하기 때문에, 바이트 형식의 결과를 문자열로 반환
-
- **왜?** : Base64인코딩은 바이트데이터를 텍스트로 변화하기 위한 과정으로 먼저 바이트로 변환해야함

### **참고**

- <https://stackoverflow.com/questions/71037751/invalid-public-key-when-trying-to-upload-a-key-for-a-service-account-using-pytho>
- <https://cloud.google.com/iam/docs/keys-upload?hl=ko#iam-service-accounts-upload-rest>
- <https://cloud.google.com/iam/docs/reference/rest/v1/projects.serviceAccounts.keys/upload>
