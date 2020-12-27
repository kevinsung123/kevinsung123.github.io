#### Install Docker Engine on Ubuntu
#### Prequisites
- OS Requirements
	- 64bit version of Ubuntu versions
	- architectures : `x86_64`, `amd64`,`arm64`,`armfh`
#### Supported storage drivers
- `overlay2` : default로 사용
- `aufs`
- `btrfs`
#### Install Methods
1.  Docker's repositories를 구성하고 설치 (추천)
2.  DEB package 다운 및 수동 설치(air-gapped system 페쇄망, 인터넷 단절환경0
3. 환경 개발 및 테스트를 위해서 automated convenience script 사용 
---
#### Install using repository
#### SET UP THE REPOSITORY
1. `apt` package index를 업그레이드 그리고 HTTPS를 통해 respository설치
	- `$ sudo apt-get update`
	- ``` 
		$ sudo apt-get install \
		apt-transport-https \
		ca-certifications  \
		curl \
		gnupg-agent \
		software-properties-common
		```
2. Add Docker's official GPG key
- `$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
- `$ sudo apt-key fingerprint 0EBFCD88`		
3. 아래 명령어 통해 `stable repository` 구성
	-  ```
		$ sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	   $(lsb_release -cs) \
	   stable"
		```
