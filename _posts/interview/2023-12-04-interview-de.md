---  
layout: post  
title: "[DE] Data Engineering Interview Questions"  
subtitle: "Tips for prepare for a job interview "  
categories: it
tags: it Interview
comments: true  
---  
## Data Engineering Interview Questions



### Q1) What is your DE like on a day-to-day basis?
### A1)
- DE툴과 framework 에대한 풍부한 열정과 경험을 보여주고자함
- 몇가지 데이터파이프라인 예시를 제공해주면서 답변을 장식함
- `tutorial`이라는 말을 언급을 안하는게 좋고 
```
… a full-lifecycle project from requirements gathering to data pipeline design and go live.
(요구사항 수집부터 데이터파이프라인 설계, 실시간 운영에 이르기까지 lifecycle 프로젝트..)
```
- 예시답변
   - 현재 데이터 품질업무가 주이며, 데이터플랫폼에 데이터를 load하기 전에 행조건을 사용하여 데이터를 확인할 수 있는 데이터파이프라인을 설계하고 구축했다.
   - SDK와 함께 작업하여 데이터를 DW에 로드하는 방법을 알고있다고 언급 등
- 참고 : ![Python for Data Engineers]https://towardsdatascience.com/python-for-data-engineers-f3d5db59b6dd?

### Q2) How do you create data pipelins?
### A2)
- third-party ETL tools(fivetran,stich)등 직접 작성할 수 있는 맞춤형 데이터 커넥를 모두 사용할 자신이 있음을 분염히 얘기한다
- 데이터 파이프라인은 A지점에서 B지점의 목적지로 데이터를 추출, 변환 및 로드 하는 것 
- 따라서 batch(chunk단위로 aggregate and process), streaming(process and load record by record), cdc(A지점에서 변경사항을 식별 및 캡처하여 B에 로드)등 주요 3가지 데이터 파이프라인 설계 패턴을 따르는 방법을 알고 설명하는게 좋음
   1. batch 
   2. streaming
   3. cdc
- 예시
   1. MySQL binary log file을 사용하여 실시간 데이터를 DataWareHouse 솔루션으로 이동 가능 
      - 주의애헛 사용해야 하며 항상 데이터 파이프라인에 가장 비용 효율적인 도구는 아니지만 언급할 가치가 있음)
      - 개념 설계도를 따라 모든것을 정리. 많은 ETL을 설명하는데 도움이 됨

### Q3) What do you know about data platform design?
### A3)
- 한마디로(In a nutshell), 파이프라인을 구축할 떄 사용할 수 있는 도구를 선택할 수 있는 데이터플랫폼 아키텍처 유형은 4가지입니다.
- `이 질문의 핵심은 바로 적절한 DE도구와 기법을 선택하는데 도움이 된다`
- Data Lake, Data Warehouse, Lake houses는 각각의 장점이 있고, 각각의 목적에 부합
- 4번쨰 아키텍처 유형은 분산된 Data Meseh : `데이터 관리가 분산된 Data Mesh`
- Data Mesh는 서로다른 데이터 도메인(기업부서)을 보유하고 있고, 각자의 팀과 공유 데이터 리소스가 있을때의 상태를 정의
- 좀더 혼란스러울 수 있지만, 많은 기업이 데이터 관료주의(Data bureaucracy)를 줄이기 위해 이 모델을 선택 
- 대표적으로 데이터 웨어하우스는 데이터 레이크에 비해 더 나은 데이터 거버넌스를 제공. 
- ANSI-SQL기능이 내장되엉 ㅣㅆ어 데이터 스택이 좀더 현대적이고 유연해보임
- 레이크 또는 웨어하우스로 전화하는 과정은 주로 사용자의 기술에따라 달라짐
- DW솔루션은 더 많은 상호 작용성을 지원하는 SQL우선제품(Snowflake, BigQuery)등 선택의 폭을 좁힘
` 데이터레이크는 프로그래밍 기술을 가진 사용자를 위한 것이며, Databricks,Galaxy,DataProc,EMR과 같은 Python 우선 제품을 사용하고자 함 `
* 참고 ( 데이터 관료주의(Data Bureaucracy ))
   - 조직이나 기업 내에서 데이터에 대한 중앙 집중적이고 체계적인 통제 및 관리를 강조하는 접근 방식을 나타냅니다. 이 개념은 기업이나 조직에서 데이터를 중앙에서 통제하고 정규화하여 효율적인 데이터 활용과 안전성을 확보하려는 의도를 반영합니다.
##### 주요 특징 
   1. 중앙화된 데이터 관리 : 데이터 관리가 중앙 집중화 (통제와 책임이 특정한 관리부서나 팀에게 위임 이를 통해 일관성 있는 데이터 정책 시행 )
   2. 데이터 표준화 : 데이터 일관성과 표준화를 강조. 표준 데이터 정의, 용어, 및 데이터 모델이 정의되고 준수. 이는 데이터 품질과 해석의 일관성을 유지하는데 도움 
   3. 보안과 규제준수 : 중앙화된 데이터 관리는 규제를 준수하고, 데이터를 보호하기 위해 필요한 정책 및 절차를 관리하기 위해 용이
   4. 일관된 데이터 접근 권한 : 중앙에서 통제되며 필요에 따라 사용자나 팀에게 일관된 방식으로 부여. 데이터의 무단사용을 방지하고 비즈니스 목표에 따라 데이터를 효과적으로 활용 
   5. 데이터 품질관리 : 데이터 품질을 중요하게 여김. 데이터의 정확성,일관서으,완전성을 유지하기 위한 일련의 품질관리 프로세스가 중앙에서 관리 
- 데이터 관료주의가 모든 상황에 적합한것은 아니며, 떄로는 빠르게 변화하는 비즈니스 환경에 따라 더 유연하고 탄력적인 데이터 관리가 필요. 이에 대한 대안으로 데이터 민주주의 (Data Democracy)등이 제시. 이는 데이터에 대한 분산된 접근을 허용하고 조직내 다양한 팀이나 개인이 보다 쉽게 데이터를 활용가능 
. 그런다음 프로토타입인 funciontal model이 뒤따르며, 이 작업에 우리의 개념적 모델이 작동한한다는 것을 증명하는 것을 목표로 함

### Q4) What is data modeling?
### A4)
- 데이터 모데릴은 entity(tables,views,silos,data lakes)간의 관계를 사용하여 데이터를 변화하기 때문에 데이터 엔지니어링의 필수적인 부분.
- 이 프로세스가 개념적(Conceptual)이고 물리적은(Physical)측면에서 어떻게 작동하는지 이해하고 있음을 보여주고 있음 
- 항상 비즈니스 프로세스 또는 데이터 변환작업에 대해 모델을 만드는 개념에서 시작
- 결국 필요한 모든 물리적 개체와 개체를 포함하는 최종 인프라를 포함하는 물리적 모델을 만들 것입니다
- 개념적 데이터 모델링에는 클라우드 저장소에 반구조화된 데이터 파일이 포함된 모든 유형의 데이터 플랫폼이 포함될 수 있습니다
![Orchestrate Machine Learning Pipelines with AWS Step Functions](https://pub.towardsai.net/orchestrate-machine-learning-pipelines-with-aws-step-functions-d8216a899bd5)
- `DBT 및 Dataform`
 - 이 작업에 사용할 수 있는 템플릿 엔지에 대해 잘알고 있다는점을 어필하는것이 좋음.
 - 데이터 변환 unit test그리고 데이터 환경에 많은 도움을 되고, human error 그리고 배포 workflow를 개선하는 데 도움이 됨.
 - ![Continuous Integartion and Deployment for Data Platforms](https://towardsdatascience.com/continuous-integration-and-deployment-for-data-platforms-817bf1b6bed1?)

### Q5) What is the difference between Star and Snowflake schema?
### A5)
-  면접관이 데이터엔지니어링 설계 스미카에 대한 지식을 테스트하는 경우가 많음
- 간결하게 설명하고 `start schema는 하나의 fact table에 연결된 초대형 비정규화 데이터셋을 활용하는 설계`
- start schema는 OLAP 스타일의 분석 파이프라인에 더 적합
- 해당 데이터셋의 데이터는 항상 최신은 아니지만, 이런한 방식으로 구체화 해야하고 필요한 경우 필요한 필드를 업데이트 할 수 있어야함
- `snowflake schema`는 중앙에 동일한 fact table이 있지만, 많은 다른 fact 및 dimension 테이블과 연결 됨
- 이 테이블들은 일반적으로 비정규화되어있음
- 이 스키마 디자인은 데이터가 항상 최선이어야하는 `OLTP`데이터 처리에 더 적합
- 응용 프로그램에서 빠르게 개별행을 검색해야하는 경우 강점을 보임

### Q6) On a scale from 1 to 10 how good are your SQL skills?
### A6)
- 아래는 merge 구문을 사용하여 증분 테이블을 생성 
```
reate temp table last_online as (
    select 1 as user_id
    , timestamp('2000-10-01 00:00:01') as last_online
)
;
create temp table connection_data  (
  user_id int64
  ,timestamp timestamp
)
PARTITION BY DATE(_PARTITIONTIME)
;
insert connection_data (user_id, timestamp)
    select 2 as user_id
    , timestamp_sub(current_timestamp(),interval 28 hour) as timestamp
union all
    select 1 as user_id
        , timestamp_sub(current_timestamp(),interval 28 hour) as timestamp
union all
    select 1 as user_id
        , timestamp_sub(current_timestamp(),interval 20 hour) as timestamp
union all
    select 1 as user_id
    , timestamp_sub(current_timestamp(),interval 1 hour) as timestamp
;

merge last_online t
using (
  select
      user_id
    , last_online
  from
    (
        select
            user_id
        ,   max(timestamp) as last_online

        from 
            connection_data
        where
            date(_partitiontime) >= date_sub(current_date(), interval 1 day)
        group by
            user_id

    ) y

) s
on t.user_id = s.user_id
when matched then
  update set last_online = s.last_online, user_id = s.user_id
when not matched then
  insert (last_online, user_id) values (last_online, user_id)
;
select * from last_online
;
```

### Q7) How do I get 10 out of 10 in SQL?
### A7)
- 테이블을 구조 배열로 변환하여 UDF로 전달하는 것과 같은 특정 도구에 대한 전문 지식과 매우 까다롭고 명확한 관련이 있을 것입니다.

- 이것은 각 행 또는 테이블에 복잡한 논리를 가진 사용자 정의 함수(UDF)를 적용해야 할 때 유용합니다.

- 테이블을 항상 TYPE STRUCT 객체들의 배열로 간주하고 그 각각을 UDF에 전달할 수 있습니다. 논리에 따라 다릅니다. 예를 들어, 저는 구매 스태킹에서 만료 시간을 계산할 때 이 테이블을 사용합니다:
```
select 
     target_id
    ,product_id
    ,product_type_id
    ,production.purchase_summary_udf()(
        ARRAY_AGG(
            STRUCT(
                target_id
                , user_id
                , product_type_id
                , product_id
                , item_count
                , days
                , expire_time_after_purchase
                , transaction_id 
                , purchase_created_at 
                , updated_at
            ) 
            order by purchase_created_at
        )
    ) AS processed

from new_batch
;

```

### Q8) What is the difference between OLAP and OLTP?
### A8)
- OLAP는 보고 및 대규모 데이터 처리와 같은 분석목적으로 데이터를 집계하고 저장하는것을 목표
- 때문에 여기는 비정규화된 super big table을 매우 자주 봄
- OLTP는 단일 transaction에 초점이 있고 빠른 데이터 처리가 필요 
- 좋은예는 인앱 구매, 사용자계정 관리 및 저장소 콘텐츠 업데이트. 
- OLTP 데이터는 dimension table이 대부분 정규화된 snowflow 패턴을 사용하여 연결된 indexing 테이블에 저장

### Q9) What data engineering frameworks do you know?
### A9)
- 우리는 모든것을 알 수없음
- 모든 데이터 엔지니어링 도구와 framework에대해 경험이 필요한 것 은 아님
- Python ETL, Bonoboo,Apache Airflow, Bubbles, Kestra, Luigi 
- `모든 framework를 완벽하게 경험 할 필요는 없지만 자시간을 보여주는것은 필수`
- 다양한 데이터 도구로 자신감을 입증하기 위해 최소한 1-2개 정도는 학습한 다은 기본 원칙(data engineering princple)을 사용해야함.
- 이 접근 방식을 사용하면 거의 모든 DE질문에 대답가능
`Why did you do it this way? — I got this from basic principles.`
- exmaple) Apache Airflow
![Apache airlfow](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*19K0sqfmIUkIgJnP9PcBGg.png)
- 이상과 같이 Apache Airway에서 몇 가지 사항을 배우고 간단한 파이프라인 예제로 시연하면 됩니다. 예를 들어 데이터를 클라우드 스토리지(bq_export_op)로 내보낸 후 ml_engine_training_op을 실행하고 이 워크플로우를 매일 또는 매주 실행할 수 있습니다.
- 아래는 간단한 data pipeline graph : 데이터를 cloud storage에 export 한 후 ML Engine training operator를 사용하여 ML모델을 훈련
```
"""DAG definition for recommendation_bespoke model training."""

import airflow
from airflow import DAG
from airflow.contrib.operators.bigquery_operator import BigQueryOperator
from airflow.contrib.operators.bigquery_to_gcs import BigQueryToCloudStorageOperator
from airflow.hooks.base_hook import BaseHook
from airflow.operators.app_engine_admin_plugin import AppEngineVersionOperator
from airflow.operators.ml_engine_plugin import MLEngineTrainingOperator

import datetime

def _get_project_id():
  """Get project ID from default GCP connection."""

  extras = BaseHook.get_connection('google_cloud_default').extra_dejson
  key = 'extra__google_cloud_platform__project'
  if key in extras:
    project_id = extras[key]
  else:
    raise ('Must configure project_id in google_cloud_default '
           'connection from Airflow Console')
  return project_id

PROJECT_ID = _get_project_id()

# Data set constants, used in BigQuery tasks.  You can change these
# to conform to your data.
DATASET = 'staging' #'analytics'
TABLE_NAME = 'recommendation_bespoke'


# GCS bucket names and region, can also be changed.
BUCKET = 'gs://rec_wals_eu'
REGION = 'us-central1' #'europe-west2' #'us-east1'
JOB_DIR = BUCKET + '/jobs'

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': airflow.utils.dates.days_ago(2),
    'email': ['mike.shakhomirov@gmail.com'],
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 5,
    'retry_delay': datetime.timedelta(minutes=5)
}

# Default schedule interval using cronjob syntax - can be customized here
# or in the Airflow console.
schedule_interval = '00 21 * * *'

dag = DAG('recommendations_training_v6', default_args=default_args,
          schedule_interval=schedule_interval)

dag.doc_md = __doc__


#
#
# Task Definition
#
#


# BigQuery training data export to GCS

training_file = BUCKET + '/data/recommendations_small.csv' # just a few records for staging

t1 = BigQueryToCloudStorageOperator(
    task_id='bq_export_op',
    source_project_dataset_table='%s.recommendation_bespoke' % DATASET,
    destination_cloud_storage_uris=[training_file],
    export_format='CSV',
    dag=dag
)


# ML Engine training job
training_file = BUCKET + '/data/recommendations_small.csv'
job_id = 'recserve_{0}'.format(datetime.datetime.now().strftime('%Y%m%d%H%M'))
job_dir = BUCKET + '/jobs/' + job_id
output_dir = BUCKET
delimiter=','
data_type='user_groups'
master_image_uri='gcr.io/my-project/recommendation_bespoke_container:tf_rec_latest'

training_args = ['--job-dir', job_dir,
                 '--train-file', training_file,
                 '--output-dir', output_dir,
                 '--data-type', data_type]

master_config = {"imageUri": master_image_uri,}

t3 = MLEngineTrainingOperator(
    task_id='ml_engine_training_op',
    project_id=PROJECT_ID,
    job_id=job_id,
    training_args=training_args,
    region=REGION,
    scale_tier='CUSTOM',
    master_type='complex_model_m_gpu',
    master_config=master_config,
    dag=dag
)


t3.set_upstream(t1)
```

### Q10) What would you use to orchestrate your data pipelines?
- data pipeline을 조정하는 ETL 프레임워크와 데이터 파이프라인을 조정하는 프레임워크를 구별하는 것은 매우 중요.
- airflow, prefect,dagester,kestra,argo,luigi --> 현재 가장 인기있는 오픈소스 프로젝트들
- 좋은 답변은 자신만의 특수도구를 사용하여 데이터 파이프라인을 조정을 수행 할 수 잇는 능력이 있다는것을 어필해야함
- ex) aws를 선호한다면 Cloud Formation(IAC) 그리고 Step function을 사용하여 데이터 파이프라인을 배포하고 조정 할 수 있음
- 우리는 플랫폼에 독립적인 Terraform(IAC)와 Serverless를 사용하여 데이터 파이프라인 조정 로직은 갖춘 micro service를 배포할 수 있음

### Q11) What is your programming language?
- 이것은 회사의 stack달려있음
- 
### Q12) What is *args and **kwargs?
- 일반적으로 이전 질문에서 주요 언어가 python이라고 하면 다음 질문이 될 것
- 함수 인수에 대한 질문에 대하는 것이 취업면접에서 가장 일반적으로 하는 질문
- 차이점
    - *args, **kargs(keyword)은 함수에 가변 인수를 전달 하는데 사용되는 키워드 
    - *args : 가변 숫자의 위치를 전달하는 사용 이는 `tuple`로 저장 
    - **kargs : 가변 숫자의 키워드 인수를 전달하는데 사용. `dictionary`로 저장 
```
def my_function(*args, **kwargs):
    print(args)
    print(kwargs)

my_function(1, 2, 3, name="John", age=30)

----- output ------------
(1, 2, 3)
{'name': 'John', 'age': 30}
```

```
def sum_example(*args):
    result = 0
    for x in args:
        result += x
    return result

print(sum_example(1, 2, 3))

def concat(**kwargs):
    result = ""
    for arg in kwargs.values():
        result += arg
    return result

print(concat(a="Data", b="Engineering", c="is", d="Great", e="!"))
```

### Q13) How good are you with CLI tools and shell scripting?
- Cloud Vencodr cli은 REST APPI기반으로 하며, 강력한 cli를 통해 데이터 엔지니어가 Cloud Servcie Endpoint와 통신하여 리소스를 설명하고 수정할 수 있도록 함 
- 데이터 엔지니어는 bash scripting과 함꼐 chaing 명령어를 사용하여 cli tool을 사용가능 
- 아래 에시는 AWS Lambda function이 pipeline manager를 호출 
```
aws lambda invoke \
    --function-name pipeline-manager \
    --payload '{ "key": "something" }' \
    response.json
```
- 아래 예시는 lambda package를 위한 저장 bucket이 있는지 확인하고 lambda함수로 ETL서비스를 업로드하고 배포 
```
# ./deploy.sh
# Run ./deploy.sh
LAMBDA_BUCKET=$1 # your-lambda-packages.aws
STACK_NAME=SimpleETLService
APP_FOLDER=pipeline_manager
# Get date and time to create unique s3-key for deployment package:
date
TIME=`date +"%Y%m%d%H%M%S"`
# Get the name of the base application folder, i.e. pipeline_manager.
base=${PWD##*/}
# Use this name to name zip:
zp=$base".zip"
echo $zp
# Remove old package if exists:
rm -f $zp
# Package Lambda
zip -r $zp "./${APP_FOLDER}" -x deploy.sh

# Check if Lambda bucket exists:
LAMBDA_BUCKET_EXISTS=$(aws  s3 ls ${LAMBDA_BUCKET} --output text)
#  If NOT:
if [[ $? -eq 254 ]]; then
    # create a bucket to keep Lambdas packaged files:
    echo  "Creating Lambda code bucket ${LAMBDA_BUCKET} "
    CREATE_BUCKET=$(aws  s3 mb s3://${LAMBDA_BUCKET} --output text)
    echo ${CREATE_BUCKET}
fi

# Upload the package to S3:
aws s3 cp ./${base}.zip s3://${LAMBDA_BUCKET}/${APP_FOLDER}/${base}${TIME}.zip

# Deploy / Update:
aws --profile $PROFILE \
cloudformation deploy \
--template-file stack.yaml \
--stack-name $STACK_NAME \
--capabilities CAPABILITY_IAM \
--parameter-overrides \
"StackPackageS3Key"="${APP_FOLDER}/${base}${TIME}.zip" \
"AppFolder"=$APP_FOLDER \
"LambdaCodeLocation"=$LAMBDA_BUCKET \
"Environment"="staging" \
"Testing"="false"
```

### Q14) How do you deploy your data pipelines?
- 정답이나 오답은 없지만, pipeline단계를 수동으로 만든 다음 vendor의 콘솔에서 배포하는것은 최선의 답변이 아님
- 좋은 답은 스크립트를 언급
- 인터뷰 진행자에게 최소한 shell script에 익숙한 중간 사용자라는 것을 알려줌
- 배치하는 것은 무엇이든 bash 스크립트와 cli도구를 사용하여 배치할 수 있다고 말함
- 종종 모범사레로 간주되는 최적의 방법은 Infrastructrue를 코드로 사용하여 CI/CD도구를 사용하여 Pipeline을 구축

### Q15) How good are you with Data Science?
### Q16) What do you know about data quality and data reliability?
- 데이터플랫폼에서 데이터 품질을 보장할 수 있는 가능한 방법에 대해 질문을 받을 수도 있기 때문에 이는 항상 좋은 질문
- 데이터 정확성 측면에서 데이터 파이프라인을 개선하는 것은 데이터 엔지니어의 일상적인 작업 중 하나 
- 데이터 엔지니어는 데이터 소스를 연결하고 데이터를 추출해야하는 파이프라인을 배치한 다음 비즈니스 요구사항에 따라 변환해야 하는 경우가 많음
` 필요한 모든 filed가 존재하는지(데이터 품질), 누락된 데이터가 없는지(데이터 신뢰성) 확인하고자 한다`
- self-fixing 파이프라인을 언급하는 것이 좋음. 당신이 파이프라인을 어떻게 구축해야 하는지 아는게 좋음 
- 데이터 엔지니어는 ETL파이프라인과 유사하게 데이터 품질 파으피라인을 구축 가능.
 ex) 하나의 데이터셋에 row condition을 사용하고 결과에 따라 수정 단계를 구축하려면 누락된 데이터를 추출하여 로드해야함
 `데이터셋에 행 조건을 사용하는 것은 데이터 품질을 보장하는것을 목표로 함`
- 데이터 품질 검사는 스크립트로 예약할 수 있으며, 특정 조건을 충족 하지 못하는 경우 이메일 알림을 보냄
- SQL로 수행도 가능하며, 이에 국한 될 필요는 없음
-  It will use SQL with row conditions to check if there are any records with NULL `payment_date`. It will also check for duplicates.
```
with checks as (
    select
      count( transaction_id )                                                           as t_cnt
    , count(distinct transaction_id)                                                    as t_cntd
    , count(distinct (case when payment_date is null then transaction_id end))          as pmnt_date_null
    from
        production.user_transaction
)
, row_conditions as (

    select if(t_cnt = 0,'Data for yesterday missing; ', NULL)  as alert from checks
union all
    select if(t_cnt != t_cntd,'Duplicate transactions found; ', NULL) from checks
union all
    select if(pmnt_date_null != 0, cast(pmnt_date_null as string )||' NULL payment_date found', NULL) from checks
)

, alerts as (
select
        array_to_string(
            array_agg(alert IGNORE NULLS) 
        ,'.; ')                                         as stringify_alert_list
    
    ,   array_length(array_agg(alert IGNORE NULLS))     as issues_found
from
    row_conditions
)

select
    alerts.issues_found,
    if(alerts.issues_found is null, 'all good'
        , ERROR(FORMAT('ATTENTION: production.user_transaction has potential data quality issues for yesterday: %t. Check dataChecks.check_user_transaction_failed_v for more info.'
        , stringify_alert_list)))
from
    alerts
;
```
### Q17) What algorithm would you use to extract or process a very large dataset?
- 파이썬을 좋아한다면 아마도 pandas 라이브러리를 인터뷰에서 언급했을것
- 하지만, pandas는 big dataset과 잘 어울리지 않음. 특시 데이터 변환
- 항상 시스템의 메모리에만 제한. 
- `적절한 답은 이 작업을 위해 확장 가능한 솔루션을 찾을 수 있다고 언급해야됨`
- 간단한 python generator을 언급해보자
    - python yield는 generator를 반환
    - generator? 여러개의 데이터를 미리 만들어 놓지 않고 필요할때마다 즉석에서 하나씩 만들어내는 객체
    - generator는 결과값을 나누어서 얻을 수 있어서 `성능 측면에서 이점`
    - ex) 1초에 a/b/c 출력하는 return 함수는 3초후 a-c출력. generator는 1초마다 a-c출력
    - `return키워드는 모든 결과값을 메모리에 올려야하지만, yield는 결과값을 하나씩 메모리에 올려놓음`
    - `lazy iterator`라고도 부름
    - 특히 메모리에 한번에 올리기에는 `부담스러운 대용량 파일을 읽거나, 스트림 데이터를 처리`할때 상당히 유용
```
# Create a file first: ./very_big_file.csv as:
# transaction_id,user_id,total_cost,dt
# 1,John,10.99,2023-04-15
# 2,Mary, 4.99,2023-04-12


# Example.py
def etl(item):
    # Do some etl here
    return item.replace("John", '****') 

# Create a generator 
def batch_read_file(file_object, batch_size=19):
    """Lazy function (generator) can read a file in chunks.
    Default chunk: 1024 bytes."""
    while True:
        data = file_object.read(batch_size)
        if not data:
            break
        yield data
# and read in chunks
with open('very_big_file.csv') as f:
    for batch in batch_read_file(f):
        print(etl(batch))

# In command line run
# Python example.py
```
### Q18) When would you use Hadoop in your pipelines?
- Apache재단에서 개발한 오픈소스 빅데이터 처리 프레임워크로 분산 데이터 처리의 모든 이점을 제공 
- 대용량 데이터를 처리하는 데이터 파이프라인에서 큰 인기를 끌었떤 이유
- 데이터 품질(HDFS)와 확장성scalability(map-reduce)을 보장하는 것을 목표로 하는 고유한 구성요소를 가지고 있음
- hadoop에대한 경험이 없더라도 hadoop위에 수많은 도구가 구축되어있으므로 이러한 것들을 언급하는 것만으로도 충분.
 ex) Apache Pig(MR에서 하둡작업을 실행하는 프로그래밍 플랫폼), Apache Hive(SQL on Hadoop)등을 사용하여 hadoop과 통합되는 DW프로젝트
### Q19) How would you approach a big data migration project?
- 면접관들이 데이터 마이그레이션에 대한 경험과 데이터 검증이 완료되었을때의 접근 방식을 이해하기를 원하기 때문에 직문 면접 중 이런 질문을 받을 수 있음
- 여기서는 비즈니스 요구사항부터 시작하는 것이 좋음
- `비용 효율성, 데이터 거버넌스 또는 전체 데이터베이스 성능`을 일 수 있음
- 이러한 요구사항에 따라 데이터 마이그레이션 프로젝트의 대상 지점으로 최적화 솔루션을 선택
- ex) 현재 데이터 플랫폼이 데이터 레이크에 구축되어 있고, 데이터에 엑세스하려는 비즈니스 이해 관계자가 많은 경우에는 ANSI-SQL 데이터웨어하우스 솔루션 중에서 더 나은 데이터 거버넌스와 세분화된 엑세스 제어 긴으을 제공 할 수 있어야함
- 반대로 데이터 웨어하우스 솔루션에 데이터 스토리지와 관련된 비용 효율성을 문제가 있는 경우 데이터 레이크로 마이그레이션 하거나 archiving 하는것이 좋음
- 데이터 마이그레이션이 완료 된 후 데이터의 유효성을 검증하고자 함
- 데이터 엔지니어는 데이터 일관성을 최우선 과제로 삼고 있으며, 마이그레이션이 완료되면 데이터가 손실되지 않는지 검증하는 방법을 알고 있음을 보여줘야함
- ex)  데이터웨어하우스 파티션당 총 record수를 계산한 다음, 이를 데이터레이크 파티션의 record수와 비교
- count(*) 가장 저렴한 동작이지만, data validation을 하는데 굉장히 효율적이고 빠름
- 
### Q20) Which ETL tools do you know and how is it different from ELT?
- third-party 도구뿐만 아니라 자체 맞춤형 data connector 및 loader를 작성하여 데이터를 추출,변환 및 로드하는 방법을 알고 있음을 보여줍니다
- Fivetran, titch 등 ETL에 도움이 되는 중앙관리 솔루션 존재 사실을 간단히 언급. 
- 종종 처리된 record수에 따라 가격이 결저되는 그들의 가격 모델을 언급하는 것을 잊지 않아야함
- coding을 할줄 알면 ETL도구 필요없음
- MySQL이나 Postgres DB에서 수백만 데이터를 추출한 기사를 예로들면, `강력한 data connector를 만들고 chunk단위로 추출하는 방법을 메모리 효율적으로 설명`
- 이런것들은  서버리스로 설계되어 클라우드에 쉽게 배포하고 스케쥴링 가능
- own bespoke data loading manager(자체 맞춤형 데이터 로드 매니저)를 만들수 있음
-![medium](https://towardsdatascience.com/building-a-batch-data-pipeline-with-athena-and-mysql-7e60575ff39c)
### Conclusion
- 데이터 엔지니어링 인버튜에서 ...에대한 접근방식은 무엇입니까? 라는 질문은 매우 일반적
- 이러한 시나리오 질문에 대답할 준비를 해야함
- 인터뷰 중 파이프라인 이나 데이터 플랫폼에 설계를 하도록 요청할 수 있음
- 더 넓은 그림을 살펴보고, 모든 데이터 플랫폼에는 고유한 비즈니스 및 기능 요구사항이 있음
- 이 문구를 넣은 다음 이러한 요구사항에 따라 데이터 도구를 선택할 것임을 언급하는것이 좋음
- 데이터 파이프라인 예제를 사용하여 답변을 장식하면 가장 확실하게 통과 가능

### 참고
- ![medium](https://towardsdatascience.com/data-engineering-interview-questions-fdef62e46505)
