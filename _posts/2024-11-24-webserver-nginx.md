---
title: "Nginx 튜닝"
date : 2024-11-24 09:00:00 +0900
categories: [Webserver,Nginx]
tags : [webserver,nginx,]
---



### **Nginx오류 배경**
website,API 또는 서비스가 더 많은 동시 트래픽을 받기 시작하면 user는 500유형 오류를 겪기 시작함.

정적파일을 요청하거나 캐시(FastCGI,proxy)에서 제공하는 경우 nginx제한으로 인해 500오류 발생 

nginx오류 확인 시 `Too many open files`라는 줄이 있음. 

두 가지 제한을 모두 높여 nginx가 기본매우 보수적인 설정보다 더 많은 트래픽을 처리하도록 설정

#### **Rasing connection limit in Nginx**
- Linux기반 시스템에서 `default open file limt`은 `1024`
- Nginx의 기본 `worekr_connections`는 `768`으로 매우 낮으며 트래픽 급증 시 쉽게 고갈
- Nginx는 proxy 연결 1개를 위해서는 2개의 `open files`가 필요 (한개는 `receiving` 다른 하나는 `sending`)
- 그래서 기본 Nginx설정에서 768*2=`1536 file descriptiors`를 사용
- 시스템 open file limit는 보통`1024`롤 셋팅되어 이론적으로 1024/2=`512`연결을 maximum으로 사용

#### **1. Linux에서 maximum open files을 증가**
- 아래 명령어는 hard 그리고 soft limit open file확인 명령어
  
```
ulimit -Hn
ulimit -Sn
```

- 1-core 32768
- 2-core 65536
- 4-core 131072
- 8-core 262144
- 아래 명령어는 soft limit open file 수정 
  
```
perl -i -p -e 's/# End of file/* soft nofile 32768\n# End of file/' /etc/security/limits.conf
```

- 아래 명령어는 hard limit을 수정 

```
echo 'fs.file-max=2097152' >> /etc/sysctl.conf
```

#### **2. Nginx에서 open file 증설**
- nginix에서 open file에 대한 제한은 일반적으로 `/etc/nginx/nginx.conf`에 주있는 `worker_rlimit_nofile`을 사용하여 설정 
- 아래 명령어는 시스템 설정된 최대값의 절반만 사용. 다른 절반은 다른 사용자와  프로세스에 남겨둠

```
perl -i -p -e 's/events {/worker_rlimit_nofile 16384;\n\nevents {/' /etc/nginx/nginx.conf
```

#### **3. Nginx에서 worker의 연결을 늘리는명령**
- 아래 명령어는 `worer_connections`의 값을 찾고 더 높은값으로 수정 
  
```
perl -i -p -e 's/worker_connections.+;/worker_connections 4096;/' /etc/nginx/nginx.conf
```


### **참고**
- <https://robert-michalski.com/blog/nginx-raise-connection-limit/>

