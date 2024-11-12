---
title: "zombie process 처리방법"
categories: [linux, tool]
tags: [linux,shell,zombie]
---

### How to identify and kill zombie/defunct processes in Linux without reboot 
- Linux에서는 maximum process 개수가 잇고 그리고 process id가 존재
- maximum에 다다르면, 새로운 process를 시작이 불가능
- zombie process는 `그들이 parent process로부터 적절하게 정리되지 않은 dead process`이다
- process가 linux에 죽을때, 메모리로부터 모든것을 즉시 제거한다. 
    1. process status는 EXIT ZOMBIE로 변하고 parent process는 child process로부터 `SIGCHLD` signal을 받는다
    2. parent process는 dead process의 exit status를 읽기 위해 `wait() 시스템 콜`을 호출
    3. parent process는 dead process로부터 정보를 얻는다
    4. `wait()`이 호출 된 후, zombie process는 완전히 메모리부터 제거
- 위의 과정은 보통 굉장히 빨리 발생하고 system에 zombie process로부터 쌓이는 것을 보지 못함
- parent process가 적절히 프로그래밍 되지 않고, wait() 시스템 호출을 절대로 하지 않으면, 그것의 zombie children은 계속 메모리에 남는다

### Steps to attempt killing processes without system reboot
1. identify the zombie processes
> top -b1 -n1 | grep Z

```
27230 root   20  0   0  0  0 Z 0.0 0.0  0:00.00 java <defunct>
27231 root   20  0   0  0  0 Z 0.0 0.0  0:00.00 java <defunct>
27264 root   20  0   0  0  0 Z 0.0 0.0  0:00.00 java <defunct>
27265 root   20  0   0  0  0 Z 0.0 0.0  0:00.00 java <defunct>
```

2. Find the parent of zombie processes
> ps -A -ostat,ppid | grep -e '[zZ]'| awk '{ print $2 }' | uniq | xargs ps -p

```
PID TTY     TIME CMD
27229 pts/0  00:00:00 example_Java_program.jar
Note the parent process ID (ppid) is 27229
```

3. Send SIGCHLD signal to the parent process. This signal tells the parent process to execute the wait() system call and clean up its zombie children
> kill -s SIGCHLD ppid 

4.  Identify if the zombie processes have been killed
- If there are still zombie processes then the parent process isn't programmed properly and is ignoring SIGCHLD signals.



### 참고
- [linkedin](https://www.linkedin.com/pulse/how-identify-kill-zombiedefunct-processes-linux-without-george-gabra)

