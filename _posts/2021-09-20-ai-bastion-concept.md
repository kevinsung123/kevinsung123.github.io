---  
layout: post  
title: "[AI] Concept"  
subtitle: "AI Term "  
categories: ai
tags: ai term
comments: true  
---  
### AI Conecpt

#### 시그모이드 뉴런(Sigmoid Neuron)
- 가중치의 합을 0과 1사이의 실수로 변환
- sigmoid function을 사용
- 양의 값이 크면 클수록 로, 작으면 작을수록 0으로 변환해주는 S자모형의 함수
- logistic함수라고도 함
- neural network에서 활성함수(activation func)이란 입력층에서 얻은 Xn와 해당 자극들에게 대한 Wn의 가중치를 곱하여 모두 더한 값을 다른 신경망에게 전달하기 위하여 어떻게 처리할까의 문제
- Sigmoid함수의 겨우는 보단 자연스러운 자극 gradient를 만들수 있는 자연상수를 이용하여 입력값을 처리하여 출력값을 만들어냄
![sigmoid](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcVhzmw%2Fbtqw9NPffnW%2FhFtbnE8GK5MzhVkrb7gWQk%2Fimg.png)


### 참고
- [rekt77](https://rekt77.tistory.com/102)
- [tensorflow-tensor](https://www.tensorflow.org/guide/tensor?hl=ko)