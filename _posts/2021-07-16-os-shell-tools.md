---
title:  "proces 확인하기"
categories: [linux, tool]
tags: [linux,shell]
---

### Linux tools that I learned 10 years ago, which I still use every day

<!--more-->
### `ps` and `htop` - listeing and finding proceess
- `htop` 프로그램은 더 유연하고 사용하기 쉬움
- terminal에서 sorting column을 mouse로 지원
![htop](https://miro.medium.com/max/1575/1*0WsxoUIZsK4wvTskHFhv_w.png)

--- 

### `ss` and `netstat` - what ports is that process using
- `netstat`은 old way이고 요즘 배포판은 `ss`가 많이 적용
- `ss -ntaupe`
- `ss -ntpl` : listening port만 찾기 위함
#### options 
- `-n` : lists processing using numeric address
- `-t` : list TCP connections
- `-a` : list all connections  listening and establised
- `-u` : lists UDP connections
- `-p` : shows the process using the socket - probably the most useful 
- `-e` : shows some extened information like the uid

### Shell job control - fg/bg/jobs 
- fg <jobnumber>
- bg <jobnumber>
- ds
### 참고
- [medium - Linux tools tips](https://medium.com/james-reads-public-cloud-technology-blog/linux-tools-that-i-learned-10-years-ago-which-i-still-use-every-day-9289f952f169)