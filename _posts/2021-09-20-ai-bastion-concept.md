---  
layout: post  
title: "[AI] Concept"  
subtitle: "AI Term "  
categories: ai
tags: ai term
comments: true  
---  
## AI Conecpt

---

### 시그모이드 뉴런(Sigmoid Neuron)
- 가중치의 합을 0과 1사이의 실수로 변환
- sigmoid function을 사용
- 양의 값이 크면 클수록 로, 작으면 작을수록 0으로 변환해주는 S자모형의 함수
- logistic함수라고도 함
- neural network에서 활성함수(activation func)이란 입력층에서 얻은 Xn와 해당 자극들에게 대한 Wn의 가중치를 곱하여 모두 더한 값을 다른 신경망에게 전달하기 위하여 어떻게 처리할까의 문제
- Sigmoid함수의 겨우는 보단 자연스러운 자극 gradient를 만들수 있는 자연상수를 이용하여 입력값을 처리하여 출력값을 만들어냄
![sigmoid](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcVhzmw%2Fbtqw9NPffnW%2FhFtbnE8GK5MzhVkrb7gWQk%2Fimg.png)

- **퍼센트론(perceptron)** : 가중합한 결과에 커트라인을 두는 방식으로 1이나 0이냐를 가르는 방식의 뉴런을 일컫음
- sigmoid를 쓰는 가장 큰 이유? 미분이 가능하다(differentiable) 그래서 미분가능한 sigmoid 함수를 쓴곤함

---

### Deep Learning

#### Deep Neural Network
- sigmoid 뉴런과 같은 형태의 인공뉴런을 여러 층 연결하면 인공 신경망이 된다. 일반적으로 `두 층 이상의 뉴런을 쌓게 되면 Deep`하다고 말한다
- input layer : 데이터가 들어오는 layer
- output layer : 결과를 출력하는 마지막 layer
- hidden layer : 이 두 레이어 사이에 있는 레이어는 몇 개가 있든지간에 모두 hidden layer라고 부름

#### Deep learning 정의
- 기계학습 알고리즘의 종류
    - `use a cascade of multiple layers` of nonlinear processing units for feature extraction and transformation. each successvie layers uses the output from the previous layers as input
    - 특징을 추출하거나 변형하기 위해 `비서현 처리유닛(시그모이드 뉴런)`을 순차적으로 연결되는 여러 레이어를 사요. 각각의 이어지는 레이어는 이전 레이어의 출력을 입력으로 받아들임
    - `learn multiple levels of representations` that correspond to differenct levels of abstraction; the levels form a hierarchy of concepts 
    - 다양한 레벨의 표현(feautre)을 학습하는데, 이 표현들은 서로 다른 추사황 레벨과 상응한다. 이는 레벨은 개념의 계층을 이룬다.

---

### Multi Layrer Perceptron
- 여러층의 neuron들을 쌓아 구성한 신경망
- 각 layers는 모든 node끼리 서로 연결되어 weight를 가지는 것이 특징
- 가장 간단한 형태의 신경망으로, 학습 파라미터 수에 비해 성능이 높지는 않아 효율적이지는 않지만 간단한 실습에 사용
- Tensorflow Developer Certificate에서도 관련 문제가 나옴

--- 

### Loss Function
loss function은 값을 예측하려할 때 데이터에대한 예측값과 실제의 값을 비교하는 함수로 모델을 훈련시킬 때 오류를 최소화 시키기 위해 사용되며, 주로 regression(회귀)에서 사용한다.
모델의 성능을 올리기 위해 loss함수를 임의적으로 변형 가능

#### Loss Function 종류
##### MSE(Mean_Squared_error)
- 예측한 값과 실제 값 사이의 평균 제곱 오차를 정의. 차가 커질수록 제곱 연산으로 인해서 값이 더욱 뚜렷해짐

##### RMSE(Root Mean Squared Error)
- MSE에 root를 씌운 것으로 MSE와 기본적으로 동일. `MSE값은 오류의 제곱을 구하기 떄문에 실제 오류 평균보다 더 커지`는 특성이 있어 왜곡을 줄여준다

##### Binary Crossentropy
- 실제 label과 예측 label간의 교차 엔트로피 손실을 계산. label class(0,1)가 2개만 존재할때 사용

##### Categorical Crossentropy
- 다중 분류 손실함수로 출력값이 one-hot encoding된 결과로 나오고 실측 결과와의 비교시에도 실측 결과는 one-hot encoding형태로 구성된다.
- 출력 값이 one-hot encoding된 결과로 나온다. -> label(y)을 one-hot encoding해서 넣어줘야 함
- sample이 여러개의 class에 속함

##### Sparse_Categorical_Crossentropy
- 위와 같은 다중 분류 손실함수이지만, 샘플값은 `정수형 자료`이다
    - e.g. [0,1,2] -> Dense(3, activation='softmax')로 하고 출력값도 3개가 나오게 된다
    - 즉 샘플 값을 입력하는 부분에서 별도 one-hot encoding하지 않고 정수값 그래도 줄 수 있다. compile단계에서 loss func만 바꿔주면 된다.
- integer type 클래스 -> one-hot encoding하지 않고 정수 형태로 label(y)을 넣어줌
- sample이 오직 하나의 class


### 참고
- [wiserloner-tistory](https://wiserloner.tistory.com/239)
