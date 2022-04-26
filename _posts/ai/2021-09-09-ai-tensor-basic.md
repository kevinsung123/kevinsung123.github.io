---  
layout: post  
title: "[AI] Tensor term"  
subtitle: "AI tensor"  
categories: ai
tags: ai tensor
comments: true  
---  
### Tensor Basic
##### FNN(Fully-connected Neural Network)
- 뉴런을 단계별로 층층히 연결하여 데이터를 흘려보내는 방식의 인공신경망
- Input.Hidden/Output layer들로 구성
- 세로로 묶인 일련의 뉴런의 묶음을 **layer**라고 부름
- 뉴런끼리 레이어간 빽빽하게 연결되어 있어서 이러한 형태의 layer를 **Dense layer** 

##### Tensor
- tensor란 수학적인 개념으로 데이터의 배열
- tensor의 Rank는 간단히 말해서 몇 차원 배열인가를 의미
- 차원의 수는 Rank와 같은말
- matrix의 집합인 tensor는 당연히 3차원 부터 시작하니 최소 3이상의 수
- tensor는 일관된 유형(**dtype**이라고불림)을 가진 다차원 배열. 지원되는 모든 **dtypes**은 **tf.dtypes.DType**에서 볼수 있음
- **Numpy**에 익숙하다면, tensor는 일종의 **np.arrays**와 같음
- 모든 tensor는 python숫자 및 문자열과 같이 변경 불가능
- tensor 내용은 업데이트 불가능하며 새로운 tensor만 생성가능
- Rank/Type
    - 0/scalar : [1]
    - 1/vecotr : [1,1]
    - 2/matrix : [[1,1],[1,1]]
    - 3/3-tensor : [[[1,1],[1,2]]]
    - n/n-tensor : etc
- tensor 생성방법 : **np.array** 또는 **tensor.numpy** 메서드를 이용하여 tensor를 numpy배열로변환 

##### Tensor Shapes (형상정보)
- shape :  tensor의 각 차원의 길이. the length of each the axes of a tensor
- rank : tensor 축의 수. number of tensor axes. a scalar has rank 0, a vector has rank 1, a matrix is rank2
- Axis or Dimension : a particular dimentsion of a tensor
- size : the total number of items in tensor.
```
ex) 
 rank_4_tensor = tf.zeros([3,2,4,5])
 3 2 4 5 
 -> rank 4
 -> 3 : axis 0 
 -> 5 : axis -1
print("Type of every element:", rank_4_tensor.dtype)
print("Number of dimensions:", rank_4_tensor.ndim)
print("Shape of tensor:", rank_4_tensor.shape)
print("Elements along axis 0 of tensor:", rank_4_tensor.shape[0])
print("Elements along the last axis of tensor:", rank_4_tensor.shape[-1])
print("Total number of elements (3*2*4*5): ", tf.size(rank_4_tensor).numpy())
*********************************************
Type of every element: <dtype: 'float32'>
Number of dimensions: 4
Shape of tensor: (3, 2, 4, 5)
Elements along axis 0 of tensor: 3
Elements along the last axis of tensor: 5
Total number of elements (3*2*4*5):  120
```
- axes 때때로 그들의 indices를 표현 

#### Shape
- tensor가 어떻게 생겼는지를 표현하는 방식
- 대괄호 안에 각 차원의 길이(element)를 표기하면 됨
- mnist는 가로 세로 28픽셀을 갖는 행렬데이터이므로 [28,28]고 같이 shape를 표헌 
- color 이미지의 경우 RGB의 세개의 값을 표현해야하므로 3Rank tensor
- 관례적으로 데이터 수는 shape의 맨앞에 써주는 것이 일반적
    - ex) shape[4,100,150,3]



##### Manipulating Shapes
Reshaping a tensor is of a great utility

```
x = tf.constant([[1],[2],[3]])
print(x.shape)
*******output********
(3,1)

# you can convert this object into a Python list, too
print(x.shape.as_list())

# you can reshape a tensor to a new shape
reshaped = tf.reshape(x,[1,3])

```


### 참고
- [rekt77](https://rekt77.tistory.com/102)
- [tensorflow-tensor](https://www.tensorflow.org/guide/tensor?hl=ko)