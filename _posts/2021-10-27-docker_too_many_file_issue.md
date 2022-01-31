---  
layout: post  
title: "[Issue] too many files issue"  
subtitle: "Dodocker issue - too many file (#35981)"  
categories: docker  
tags: docekr issue
comments: true  
---  

### Issue 
#### dockerd : http : Accept error : accept unix /var/run/docker.sock : accepty4 : too many open files 

#### 문제 
- too many files 라는 메시지를 보내며 dockerd가 정상적인 상황이 아님

#### 해결
- docker daemon이 어떻게 시작되었는지 확인이 필요. 만약 `systemd` 서비스로 되어있다면 limits을 set to `infinity`로 설정 변경 필요(아래 명령어로 확인 필요)
	> cat /proc/$(pidof dockerd)/limits
- docker 서비스 위치 파일 확인
	> sudo systemctl status docker 
- 위의 명령어를 통해 /usr/lib/systemd/system/docker.service 위치 확인
- 위의 daemon 파일을 수정 
	> LimitNOFILE=infinity
- open file 확인
	> ulimit -a
- system 전체의 limit 확인하기
	> open files와 같은 수치 변경 시 시스템 limit보다 작아야 함
	> cat /proc/sys/fs/file-max


### 참조
[github-issue](https://github.com/moby/moby/issues/35961)
[blog](https://devbrain.tistory.com/53)