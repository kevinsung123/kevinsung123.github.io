## docker image 
#### docker 이미지 다운로드
-`$ docker pull [옵션] 이미지명[:태그명]`
### docker 이미지 목록 표시
-`$ docker image ls [옵션] [repository name]`
- option
	- `--all` : 모든 이미지 표시
	- `--digests` : 다이제스트를 표시할지 말지
	- `--no-trunc` : 결과를 모두 표시
	- `--q` : 이미지 ID만표시
---
## docker 확인 
#### docker 버전확인
- `$ dockver version`
#### docker 실행버전확인
- `$ docker system info`
#### dockver 디스크 이용현황
- `$ dockver system df`
#### docker 이미지확인
- `$ docker imags ls`
#### docker 컨테이너 확인
- `$ docker ps `
----
## docker container 실행
#### docker image를 container로 실행
- `$ docker run --publish 8000:8080 --detach --name bb bulletinboard:1.0`
	- publish : host 포트 8000을 container 포트 8080으로 포워딩
	- detach : 이 container를 backgroud로 실행
	- name : container에게 이름을 설정 
- `$ docker run --name webserver -d -p 80:80 nginx`

### #docker로 가동시킨 container 확인
-`$ docker container ps`

#### docker container 상태확인
-`$ docker container stats [container name]`
-`$ docker container top [container name]`

#### docker container 시작
- `$ docker container start [container-id] or [container name]`
#### docker container 정지
- `docker container stop [옵션] <컨테이너 식별자> [컨테이너 식별자]`
- 옵션 
	- t : 컨테이너 정지시간을 지정
#### 강제종료
-`docker container kill `

