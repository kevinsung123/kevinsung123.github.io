---  
layout: post  
title: "[Docker] Dockerfile 작성"  
subtitle: "Dockerfile 작성"  
categories: python  
tags: skills module
comments: true  
---  

<!--more-->

---

### Dockerfile 작성
- Dockerfile 명령은 항상 `FROM`으로 시작. 없으면 이미지가 생성되지 않음
- 이미지를 생성할때에는 Dockerfile이 있는 딩렉터리에서 docker build명령을사용
```
$ sudo docker build --tag example .
$ sudo docker build --tag pyrasis/example .
```
- `--tag` 또는 `-t` 옵션으로 이미지 이름을 설정 가능

--- 

#### dockerignore
- dockerfile과 같은 directory에 있는 모든파일을 context라고 함. 이미지 생성시 context를 모두 docker deamon에 전송하므로 필요없는 파일이 포함되지않도록 함
- context에서 파일이나 directory를 제외하고 싶을떄 `.dockerignore`파일을 사용

#### FROM
- 어떤 이미지를 기반으로 이미지를 생성할지 결정 
- 맨앞에 항상설정
- image가 local에 있으면 바로 사용하고 없으면, Docker Hub에서 다운로드
- FROM이 2개이면 2개의 image가 생성

---

#### MAINTAINER
- 이미지를 생성한 사람의 정보를 설정
- MAINTAINER <작성자 정보>
` MAINTAINER Hong, Gildong <gd@yuldo.com>`

---

#### RUN
- FROM에서 설정한 이미지 위에서 스크립트 혹은 명령을 실행
- FROM으로 설정한 이미지에서 포함된 /bin/sh 실행 파일을 사용

---

#### CMD
- `container가 시작되었을때` 스크립트 혹은 명령을 실행 `docker run`명령으로 container 생성하거나 docker start명령으로 정지된 container를 시작할때 실행 
- CMD는 Dockerfile에서 `한번만 실행`
##### ENTRYPOINT를 사용할때
``` 
ENTRYPOINT ["echo"]
CMD ["hello"]
```
- CMD [ "ARG1", "ARG2]는 ENTRYPOING에 설정한 명령에 매개변수를 전달하여 실행
- Dockerfile에 ENTRYPOINT가 있으면 CMD는 매개변수만 전달. 그래서 CMD는 독자적으로 파일 실행 불가

---

#### ENTRYPOINT
- `container가 시작되었을때` 스크립트 혹은 명령을 실행 `docker run`명령으로 container 생성하거나 docker start명령으로 정지된 container를 시작할때 실행 
- ENTRYPOINT Dockerfile에서 `한번만 실행`

##### CMD 와 ENTRYPOINT 차이점
- CMD/ENTRYPOINT는 container가 생성될 때 명령이 실행되는것은 동일하지만, `docker run`명령에서 동작방식이 다름
- docker run명령어시 CMD는 무시
- ENTRYPOINT는 docker run 명령에서 실행할 파일을 설정하면 `무시되지 않고`, 실행할 파일 설정 자체를 매개변수로 받아서 처리

---

#### EXPOSE
- host와 연결할 포트번호를 설정

---

#### ENV
- 환경변수를 설정 
- 설정한 환경변수는 RUN,CMD,ENTRYPOING에서 적용
` ENV <환경변수> <값>`

#### ADD

#### COPY
#### VOLUMNE
#### USER
#### WORKDIR

