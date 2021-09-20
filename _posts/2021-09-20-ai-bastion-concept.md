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

### 참고
- [wiserloner-tistory](https://wiserloner.tistory.com/239)
