---
title: "Pandas DataFrame Basics: How To Perform Indexing And Slicing"  
date: 2021-04-23 12:00:00 +0900
categories: [Python,pandas]
tags: [python,pandas]
comments: true
pin: true
math: true
mermaid: true
---  


## Python Pandas DataFrame Basics: How To Perform Indexing And Slicing
---

## 1. Introduction 
- pandas는 data analysis를 위한 오픈소스 python 라이브러리
- spread-sheet같은 data를 아래와 같은 기능을 하도록 지원 
    - fast-data loading
    - manipulating
    - aligning
    - mering
    - among other functions
- pandas의 이런 기능을 잘 이용하기 위해서 pandas는 2가지 새로운 type data를 이용
    1. **Series**
    2. **Dataframe**


> Series: Pandas series are basically dataset having only one row or one column. Means, if we filter out only one row or only one column from a dataframe, its called “series”. 
- dataframe으로부터 one row or one column을 가지는 dataset

> Dataframe: The DataFrame represents your entire spreadsheet or rectangular data, whereas the Series is a single column of the DataFrame.  
- 전체 data를 가짐 반며에 Series는 Dataframe의 one column or one row
- Dataframe은 Series Object들의 dictionary or collection으로 취급


#### Dataframe example
![example](https://miro.medium.com/max/1161/1*eH1aoTy_1vmFn0nm6XpkmQ.png)
#### Series example
 - 위의 dataframe에서 3번째 index를 추출 또는 one row를 추출하면 그것이 series object가 된다
#### filtering one row
![series-example](https://miro.medium.com/max/752/1*TtCtnswZiE56A43QoojPMw.png)
#### slicing one column
![ex](https://miro.medium.com/max/1001/1*Ap45iPiYb_PG1SQSGdS5JA.png)

---

## 2.Dataframe Explained in Detail
#### 2.1 Get the number of rows and columns
- `df.shape`은 첫번째 row은 `tuple`을 반환 그리고 2번째 row부터 column을 반환
- shape는 dataframe의 attribute이기 때문에 function이나 method가 아님
- shape[0] : 행
- shape[1] : 열
![test](https://miro.medium.com/max/790/1*bNxF7_RRYfL1bH8JLE-vRg.png)

#### 2.2 Get the column names
- `df.columns` method는 dataframe의 column명을 가져옴
![df.columns](https://miro.medium.com/max/1400/1*biTHDrCgQFYId9TNWJTS-Q.png)

#### 2.3 Get the dtype of each column
![df.dtypes](https://miro.medium.com/max/564/1*ZS4EyVRdOwObAkyTy99Iug.png)

#### 2.4 Get more information about our data
![df.info](https://miro.medium.com/max/834/1*0kDrGT4Y_T6Fv18J8hCyjQ.png)


#### 2.5 Pandas Type Versus Python Types
![type-versus](https://miro.medium.com/max/1400/1*2T-tpls38xuWUk02WROXew.png)

---

## 3. Lookig at columns, rows, cells
data가 너무 많으므로 handling할 경우, subsets of data를 보고 data를 handling한다
---

#### 3.1 Subsetting Columns
##### 3.1.1 Subsetting Columns by name
- data의 특정 column만 보고 싶은 경우 `square bracket`를 사용
![square.bracket](https://miro.medium.com/max/646/1*OaqNjla02FqvO_0MsHb3Uw.png)
- 여러 column을 subset으로 지정
![square.bracket.2](https://miro.medium.com/max/914/1*NsIntRZrZziIVHGbmMoTjA.png)

##### 3.1.2 Subsetting Columns by Range
- built-in range function을 활용하여 생성가능
- 특정 begin and end value값을 지정하여 해당 범위 subset자동 생성
---

#### 3.2 Subsetting Rows
- rows은 multiple way로 subset 생성가능
![subset.rows](https://miro.medium.com/max/1120/1*6OAeU_cifn-siTVkHcmnAg.png)

##### 3.2.1 Subset Rows by Index Label : loc
- `loc[integer]`를 활용하여 특정 row의 data를 가져옴
![loc](https://miro.medium.com/max/882/1*sKHi5HZnEuNtQtl2XW4ryg.png)

##### 3.2.2 Subset Rows by Row Number: iloc
- `iloc`는 loc와 유사하지만, row index number를 활용
- index label이 같으면 `iloc`와 `loc`과 같은 동작으로 사용
- index label은 row number가 필요
---

#### 3.3 Mixing it up : Subsetting Multiple rows and colums
- `loc`그리고 `iloc` attribute는 subset of columns, rows, or 둘다 가져 올 수 있음
- `comma의 left` : subset의 row values
- `comma의 right` : subset의 column values
> df.loc[[rows],[columns]] or df.iloc[[rows],[columns]]

##### 3.3.1 Subsetting columns using loc 
- python slicing syntax을 colon을 사용 
- `df.loc[:,[columns]]`와 같은 syntax로사용
![ex](https://miro.medium.com/max/978/1*pbZpYbBgU-mPAm0GFkAG-g.png)

##### 3.3.2 Subsetting columns uinsg iloc
![ex](https://miro.medium.com/max/794/1*5x4hews-g-xVJOUN9ExN0Q.png)


##### 3.3.3 Slicing Cclumns
- python slicing syntax `,`column은 range syntax와 유사
![ex](https://miro.medium.com/max/788/1*OuwkZ4rDvyszzMejF0ce0Q.png)


### 참고
[medium](https://medium.com/devops-bites/pandas-dataframe-basics-how-to-perform-indexing-and-slicing-95cc46fac1e1)

[docs-python](https://docs.python.org/3/library/collections.html#collections.namedtuple)