---  
layout: post  
title: "[BigQuery]Apply ML using SQL with BigQuery ML"  
subtitle: "Apply ML using SQL with BigQuery ML"  
categories: gcp  
tags: bigquery ml 
comments: true  
---  
<!--more-->


## Choose the right model type for your structed data use case
### BigQuery ML Decision Tree
![bigquery-ml](\assets\img\post_img\2021-03-14-bigquery-ml.PNG)
- structured data를 활용하여 ML을 할떄 적절한 model type을 찾아야함
- 어떤 activity를 할 것이느냐에 따라 다름
- Supervised ML는 아래 3종류로 분류
	1. forecaset
		- linear regression
	2. classify
		- logistic regression (binary or multi-class)
	3. recommend
		- matrixx factorization
- 더 복잡한 model도 가능
	- deep neural network
	- decision tree
	- random forests
	- 
- 적절한 model을 선택 한 후, 학습을 위한 `high-quality training data`가 필요
- Machine Learning
	- Machine : linear regression과 같은 알고리즘 혹은 tool
	- Learning : `Insights` 즉 ,model은 known과 unknown data사이 관계에대한 통찰력(우리가 modeling라고 부른는 것)

---

### Scenario : Predicting customer lifetime value
#### raw data
![biguerty-ml-2](\assets\img\post_img\2021-03-14-bigquery-ml-2.PNG)
- record or row는 1개의 instance or observation
- 위의 예시는 8개의 instance가 존재
- `label`은 역사적으로 알려진 답
	- ex) 이 특정한 고개들이 얼마나 소비하였는지
	- 미래의 데이터는 `unknown` 이거나 `missing`
- model, traning 그리고 prediction이 필요
- 가령, website에서 많은 시간을 소비한 트랜잭션을 만든 고객을 알고 있다면, 그 고객들이 매출을 위한 high LTV라고 밝혀졌다면, 우리는 이 데이터를 활용하여 `prediction`이 가능
	- 예측을 위해서 `linear regression`을 활용
- label은 또한 `binary value`가 될 수도 있음
	- ex) high-value customer or not 
- table의 columns들은 `features`라고 부름 또는 `potential features`
	- model의 `input`
- table의 각각의 column의 quality를 이해하고, 다른 팀들과 더 많은 `features`를 찾는것은 ML 프로젝트에서 가장 어려운 파트 중 하나
- `Feature Engineering` : combine or transform features과정을 일컫음

---

### Create models with SQL
#### Common Creating model
- ML model을 작업하기 위해서는 보통 data scientists들은 datalake로부터 조금씩 data를  IPython Notebook으로 추출하여 pandas같은 data handling framework를 활용 매우 많은 시간이 소모
- custome model을 만들기 위해서 모든 데이터를 전처리/변형을 하고 모든 feature engineering이 필요
- model을 만들고 tnesorflow 같은 라이브러리를 활용하여 traning을 함
- 더 많은 feature가 필요하거나 performance를 향상 시키기 위해서 위의 과정을 계속 반복해야함

#### BigQuery ML in 2 steps
1. Create Model with SQL
2. Predict Model
	- learning rate 또는 training/test data를 BigQuery ML은 자동 수행
	- 옵션을 사용하여 해당 데이터를 분할 또는 테스트하고 학습률 및 기타 다른 hyperparamter를 수동으로 설정하기위한 정규화 또는 다른 전략을 직접 설정가능
	- hyperparamter? ML을 학습을 할 때에 더 효과가 좋도록 하는 주 변수가 아닌 자동 설정되는 변수를 의미
		1. learning rate - gradient를 할때에 iteration을 얼마나 gap으로 빠르게/느리게 결정 계수
		2. error function - 실제 output/계산한 output사이의 차이 
		3. batch size - data를 어떻게 그룹지어 학습 시킬지 
		4. epoch - training 반복횟수
		5. hidden layer의 개수
		6. 각 parameter의 초깃값
		7. regulzarizaion term parameter - ML을 통해 결국 하고싶은것은 error function을 최소화 시키는 Weight를 찾아내느것. 이를 찾는 과정에서 overfitting문제가 자주 등장. 이를 해결하기 위해 regularization term을 error-function에 더하여 추가항을 만들우점 
	
3. profit, review the results

#### Supported Features
- Standard SQL and UDFS within the ML queries
- Linear Regression(Forecasting)
- Binary and Multi-class Logistics Regression(Classficiation)
- Model evalutaion functions for stadard metrics, including ROC and precision-recall curves
- Model weight inspection
- Feature distribution analysis through statndard fucntions


---

### Phases in ML model lifecycle
#### The End-to-End BQML Process


### 참고
[cousera : bigquery-ml-create-models-with-sql](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/o0sgc/bigquery-ml-create-models-with-sql)