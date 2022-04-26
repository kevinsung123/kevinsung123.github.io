---  
layout: post  
title: "[AI] Concept"  
subtitle: "AI Basic Concept "  
categories: ai
tags: ai conecpt
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


--- 

## Loss
- 학습할 대상인 weight와 bias등을 묶어서 `parmeter`라고 부름
- performance measure : 인공신경말 모델이 얼마나 좋은지를 평가 하는 기준. 모델이 예측한 예측값과 맞추어야하는 모범답안 y의 차이를 정량화해주는 함수
- 이러한 차이 `d(y,y')`를 우리가 가진 모든 데이터에 대해 구하여 더한 것을 Loss 또는 Cost라고 부름
- 둘다 모델이 정답을 얼마나 못맞췄느냐를 정량화해주는 값
```
학습의 목적은 d(y,y')가 차이를 나타내는 0이상의 값이라면 학습의 목적은 L(w,b)=0 or minimize L(w,b)이 되도록 하는 w,b 찾기이다
```

---

## 경사하강법(Stochastic Gradient Descent)
- 학습의 목적은 모델의 예측값과 실제 정답값의 차이를 최소화하는 파라미터(w,b) 구하기!
- loss가 작아질 수 있도록 파라미터를 조금씩 개선된 방향으로 업데이트해주는 녀석이 바로 "경사하강법"
- 임의로 초기화된 weight를 어떻게 바꾸어야 loss를 줄일까?
    1. 현재 weight값에서 loss에대한 (편)미분을 구함
    2. 미분의 기울기를 체크해서 기울기가 +라면 weight가 작아져야 loss도 줄어들것이니 weight값을 약간 줄여서 업데이트 
    3. 미분의 기울기를 체크해서 기울기가 -라면 weight가 커져야 loss도 줄어들것이니 weight값을 약간 키우도록 업데이트 하면 됩니다.
- 경사(미분 기울기)내려가는 방향으로 파라미터 업데이트를 진행하기 떄문에 이런 이름이 
- SGD(Stochastic Gradient Descent)

---

## Summary
- loss함수란 모범다운과 예측값의 차이를 정량화하는 함수
- 학습의 목적은 loss가 가능한 작아지도록 하는 모델의 파라미터(weight, bias)를 찾는 것
- 경사하강법을 통해서 loss가 작아지도록 하는 파라미터의 업데이트 방향을 찾고, 파라미터를 해당 방향으로 약간 업데이트 하는 방법
- 경사하강법을 통해 파라미터를 업데이트를 반복하다 보면, 최적의 파라미터를 찾음

---

## softmax
- softmax는 output layer에 적용되는 함수로 output뉴런의 결과값을 각 클래스가 정답일 확률로 변환해주는 역할을 함
- score에 대한 총합을 1로 맞추어서, class간 상대적인 비교가 가능하게 하는 softmax

## Epoch
- 모든 training데이터를 한번씩 업데이트를 진행하면 한 epoch이 끝난 것 

## Iteration 
- 한번의 업데이트 진행 단위

## Mini-batch
- 한 iteration을 진행할 training data의 예제의 묶음

---

## 하이퍼파라미터(Hyperparameter)
- 파라미터는 모델의 학습데이터를 보면서 데이터를 더 잘 맞출 수 있도록 최적화해나갈 weight나 bias와 같은것
    - 우리가 조절하는 것이 아니라 loss값을 줄이기 위해 SGD를 통해 조금씩 고쳐 나감
    - 사람이 설정하는 것이 아니라 데이터를 통해 자동 업데이트
- 하이퍼파라미터는 그 이외의 모든 사람이 설정하는 옵션값들
    - neuron network 아키텍처는 어떻게 구성할지, layer는 몇개나 쌓을 것 이며, 한 later당 node수는 얼마나 많이 할 것인지. 
    - 나의 설정에 따라 인공신경망 구조가 깊고 뚱뚱하게, 아주 복잡해지거나 얇고 날씬해서 단순해짐
    - 모델의 capacity(complexity)를 결정
    - training동안 학습됮 ㅣ않음 
    - e.g  learning rate, hidden size, layer수 mini-batch size, feautre수 

### learning rate(학습률)
- weight를 더 나은 방향으로 업데이트하려 한다면, 미분을 통해 기울기를 구하고, 그 기울기의 반대 방향으로 조금 이동시킨다면 loss가 더 낮아질 수 있음
- a : 업데이트의 크기, 폭을 결정, 양의 실수값
- 크게 설정할 수록 나는 파라미터를 크게 업데이트 
- 작은 값으로 설정한다면, 조금씩 업데이트


---

## Activation function
- 활성화 함수란? 인공신경망의 각 뉴런에 데이터를 가중합하고 난 뒤 취하는 함수를 의미
- neuron이 가중합을 하고 난 결과를 부드런 S자모양의 함수를 적용하여 0-1로 변환하는 sigmoide함수를 activation func으로 채택 
- **Relu(Reactified Linear Unit)**
    - 비선형함수. 음수값은 0으로 변환하고 양수값으 그대로 returb
    - sigmoid의 단점을 개선
        - 입력값을 0-1로 변환하는 계산하는 과정 복잡
        - 가장 큰 문제는 `neuron의 가중치 결과가 몹시 크거나 작을경우 sigmoid의 gradient(기울기)가 거의 0에 가까워짐
    - relus는 계산이 간편 가중합의 결과가 몸시 크거나 작아도 기울기가 0,1로 고정
    - sigmoid를 쓰는 경우보다 6배정도 모델을 빠르게 수렴시키는 효과
    


### 참고
- [wiserloner-tistory](https://wiserloner.tistory.com/239)
