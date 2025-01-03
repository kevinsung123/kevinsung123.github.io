---
title: "find명령어 사용법"
categories: [linux, tool]
tags: [linux,shell,find]
---


## **7 Uses of find Command in Linux**
>
> Find it and do what you want

find명령어는 back-end 개발자라면 꼭 알아야할 tool이다

#### **Scenario**

> Linux서버에서 **logs** 디렉터리가 있는 경우, 마지막 엑세스 시간이 1년 >
> 이상인 로그파잎을 삭제하려면 어떻게할까?

<br/>

#### **Answers**

**cd** 명령어로 해당 디렉터리 이동 후 아래 command로 처리한다

<br/>

```bash
find . -type f -atime +365 -exec rm -rf {} \; 
```

아래 7가지 실용적인 용도의 명령어들을 정리해보자

#### **0. 이름이나 정규식으로 파일 찾기**

- **.** symbol은 현재경로를 의미하고 아래 명령어를 통해서 찾는다

```bash
find . -name test.txt
```

- pdf파일을 찾을떄는 아래와 같이 명령어를 이용

```bash
find . -name "*.pdf"
```

- 기본적으로 **find**은 정규파일을 찾지만, 아래와같이 명확하게하는게 더 좋다

```bash
find . -type f -name "*.pdf"
```
<br/>

#### **1. 다른 타입의 파일을 찾을떄**

- directory를 찾을경우

```bash
find . -type d -name "yang*"
```

- symbolic link를 찾을떄

```bash
find . -type l -name "yang*"
```

<br/>

#### **2. 특정 timestamp로 찾을떄**

특정 timestamp로 파일을 찾을떄 아래 3가지 timestamp유형을 알아야한다

- **Access timestamp(atime)** : 파일을 읽은 마지막 시각
- **Modified timestamp(mtime)** : 파일 내용이 수정된 마지막 시각
- **Change timestamp(ctime)** : 파일의 메타(ownership,location,file type 그리고 권한)가 수정된 마지막 시각

인터뷰 질문과 같이 접근 시각이 1년넘은 파일은 아래와 같이 command를 사용하면 된다

```bash
find . -type f -atime +365
```

**mtime**이 5일전인 파일을 찾으려면 **+**포함시키면 안된다(이것은 **larger than**을 의미)
```bash
find . -type f -mtime 5
```

명백하게 **+**는 **larger than**의미 이고 **-**는 **less than**의미이다
그래서 ctime이 5일과 10일 사이인 파일은 아래와 같이 찾아야한다

```bash
find . -type f -ctime +5 -ctime -10
```
<br/>

#### **3. 사이즈별로 파일을 찾을떄**

**-size** 옵션을 사용하여 파일을 찾을 수 있음

- **b*** : 512 byte block(default)
- **c*** : bytes
- **w*** : two-byte words
- **k*** : Kilobytes
- **M*** : Megabytes
- **G*** : GIgabytes
-

10MB와 1GB 사이에 파일을 찾으려면 아래와 같이 명령어
```bash
find . -type f -size +10M -size 1G
```
<br/>

#### **4. 권한별로 파일을 찾을떄**

파일 권한 777인 파일을 찾는 명령어
```bash
find . -type f -perm 777
```

<br/>

#### **5. ownership으로 파일을 찾을떄**

**-user** 옵션을 활용
```bash
find . -type f -user yang
```

<br/>

#### **6. 파일을 찾은뒤 수행 명령어**

파일을 찾은 다음 우리는 보통 수행이 필요하다. 삭제,검사 등등  **-exec** 명령어를 활용한다

```bash
find . -type f -atime +365 -exec rm -rf {} \;
```

- **rm -rf**해당 파일으 찾은 뒤 삭제, **{}**은 찾은결과에대한 placeholder

{: .prompt-danger}

> 파일을 삭제하는 경우 매우 중요. 신중하게 테스트 후 수행
>

**-exec**옵션 뒤에는 반드시 semicolon이 와야한다.

<br/>

### 참고

- [medium](https://medium.com/techtofreedom/7-uses-of-find-command-in-linux-c45f70d7351a)
