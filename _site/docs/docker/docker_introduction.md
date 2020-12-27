### Docker란?
 - 컨테이너 기술을 사용하여 애플리케이션의 실행 환경을 구축 및 운용하기 위한 플랫폼
 - 애플리케이션의 실행에 필요로한 것을 하나로 모아 Docker이미지를 관리함으로써 이식성을 높임
 
### 1. **컨테이너 기술의 개요**
-----
#### 1-1. **컨테이너란 ?**
- Host OS상에 논리적인 구획(컨테이너)을 만들고, 애플리케이션을 작동시키기 위해 필요한 라이브러리나 애플리케이션을 하나로 모아, 마치 별도의 서버처럼 제공
- Host OS의 리소스를 논리적으로 분산, 여러개의 컨테이너가 공유
- 오버헤드가 적고 가볍다
- 애플리케이션의 실행환경을 모음으로써, 이식성을 높이고 portable, 확장성이 좋은 환경 지향
※ 오버헤드 : 가상화를 수행하기 위해 필요한 CPU,Memory,Disk등 사용량
※ 서버가상화 기술
	- 호스트형 서버 가상화 
		- oracle의 VM VirtualBox,
		- VMware의 VMware Workstation Player
	- 하이퍼바지어형 서버 가상화
		- Host OS없이 HW를 직접제어 자원을 효율적 이용
		- 단, 가상환경마다 별도의 OS가 작동하므로 가상환경 시작에 걸리는 오버헤드 단점
		- Microsoft Windows Server의 Hyper-V
		- Citrix의 XenServer
	
![enter image description here](https://www.docker.com/sites/default/files/d8/styles/large/public/2018-11/container-what-is-container.png?itok=vle7kjDj)

### 2. **컨테이너의 역사**
---
- FressBSD Jail
	- 오픈소스인 UNIX의 FreeBSD의기술
   	-  2000년에 FreeBSD 4.0에서 도입
    - 특징 			
		 1. 프로세스 구획화 			
		 2. 네트워크 구획화 			
		   3. 파일시스템 구획화	
		    		
 	- Solaris Container
		 - Oracle의 상용 UNIX인 Solaris에서 사용하는 컨테이너 기술
		 - 2005년에 release된 Solaris10에 추가된 기능
		- 특징
			1. Solaris 존 : 하나의 OS공간을 가상적으로 분할하여 여러OS가 작동하는것처럼 SW 파티셔닝기술
			2. Solaris 리소스매니저
	 - Linux Container(LXC)
		  - Linux상에서 사용하는 컨테이너 환경을 LXC
		  - Linux커널의 컨테이너 기능을 이용하기 위한 툴이나 API제공
		  - **namespace와 cgroups**라는 리소스 관리 장치를 사용하여 분리된 환경 제공 
		  - 특정 디렉토리를 루트 디렉토리로 변경하는 chroot를 사용하여 분리환경 만듬
		  - Docker이전버전에서는 LXC사용, 현재버전은 미사용

####  참고
- CNCF(Cloud Native Computing Foundation) 
	- 클라우드 네이티브 컴퓨팅을 추진하는 조기
	- 2016년 Linux Foundation으로부터 정식 발족
	- 컨테이너 오케스트레이션 툴인 kubernetes
	- 모니터링을 하는 Prometheus
	- 로그수집하는 Fluetnd
	- 컨테이너 런타임인 container 및 rkt
	- 서비스 디스크버리인 CoreDNS
	- RPC프레임워크인 gRPC
	- 위를 포함하는 16개 프로젝트를 관리
	- 성숙도	
		- Inception
		- Incubating
		- Graduated
	- Docker는 물론 Google, Mircrosoft, Amazon 등과 같은 주요 퍼블릭 클라우드 업체를 플래티넘 넘버로
	- Red Hat, VMWare, IBM, Intel등 많은 기업이 참ㅇ여
	- http://www.cncf.io 
### 3.  **Docker 개요**
----
#### 1. **Docker?** 
- 애플리케이션의 실행에 필요한 환경을 하나의 이미졸 모아두고, 그 이미지를 사용하여 다양한 환경에서 				
- 애플리케이션 실행환경을 구축 및 운용하기 위한 오픈소스 플랫폼 
- 내부에서 컨테이너기술을 사용
- [Docker공식사이트](www.docker.com)
####   2. **프로그래머에게 Docker란?**
- 웹시스템 개발 애플리케이션을 제품환경에서 가동시키기 위해서 
	- 애플리케이션 실행모듈(프로그램 본체)
	- 미들웨어나 라이브러리
	- OS/네트워크 인프라 환경설정
- waterfall모델로 개발시 개발 및 테스트 환경에서 올바르게 작동해도 Staging, production환경에서 정상적으로 작동하지 않는 경우도 있음
	- Docker에서는 이러한 인프라 환경을 컨테이너로 관리
	- 애플리케이션에 실행에 필요한 모든 파일 및 디렉토리들을 컨테이너로 모음
	- 이러한 컨테이너의 바탕이 되는 Docker이미지를 Docker Hub와 같은 Repository에 공유
	- 프로그래머는 Docker를 사용하여 개발한 애플리케이션의 실행에 필요한 모든것이 포함되어 있는 이미지를 배포
	- 애플리케이션 개발부터 테스트, production환경에 대한 전개를 모두 애플리케이션 엔지니어가 수행 하는 것 이 가능
	- 지속적인 CI/CD가 가능하고 변화에 강한 시스템 구축 가능
	 ```
	※ 애플리케이션이식성 
	한번 만들면 어디서든지 작동하는 SW의 특성을 이식성(portability)이라고 한다
	Docker는 이식성이 높기 때문에 클라우드 시스템과의 친화력이 높음
	개발한 업무 애플리케이션을 On-premise환경-> Cloud 및 Cloud->On-premise환경에서 쉽게 가능
	클라우드 Iaas서비스는 시스템이 사용한 리소스(CPU,GPU,메모리,Disk)용량에 따라 요금측정
    ```
### 4. **Docker기능**
---
####  다음과 같은 기능 3가지
- Docker 이미지를 만드는 기능(Build)
- Docker 이미지를 공유하는 기능(Ship)
- Docker 컨테이너를 작동시키는 기능(Run)
#### 1. Docker이미지를 만드는 기능(Build)
- 프로그램본체, 라이브러리, 미들웨어, OS/네트워크 설정등을 하나모로 모아서 Docker 이미지생성
- 컨테이너의 바탕이 바로 이미지
- Docker에서는 하나의 이미지에는 하나의 애플리케이션만 넣어 두고, 여러 개의 컨테이너를 조합하여 서비스를 구축!
- Docker 이미지의 정체는 애플리케이션에 실행에 필요한 파일들이 저장된 디렉토리
- Docker 명령을 사용하면 이미지를 tar파일로 출력가능
- Docker이미지 만드는방법
	1. Docker 명령을 사용하여 수동 생성
	2. Dockerfile이라는 설정파일을 만들어 그것을 바탕으로 자동으로 이미지 생성가능 ( 더 바람직)
- Docker이미지는 겹처서 사용 가능
#### 2. Docker이미지를 공유하는 기능(Ship)
- Docker이미지는 Docker레지스트리에 공유 가능
- Docker허브에서 Ubuntu나 Centos와 같은 Linux 배포판 기본기능을 제공하는 베이스이미지 배포
- 기본 베이스 이미지에 미들웨어나 라이브러리 전개 할 애플리케이션 등을 넣은 이미지를 겹처서 독자적인 Docker 이미지로 구축 가능
- Automated Build : Docker Hub는 GItHub나 Bitbucket과 연계가능 
	- Github상에서 Dockerfile을 관리하고, 거기서 Docker이미지를 자동으로 생성하여 Docker Hub공유 가능
- Docker Container Trust
	- Docker이미지의 제공자를 검증할 수 있는 기능
	- Docker 레지스트리에 이미지를 송신하기 전에 로컬환경에서 비밀키를 사용하여 이미지에 서명
	- 그 이후, 이미지를 이용할때는 이미지 제공자의 공개키를 사용하여 실행하려고 하는 이미지가 정말 제공자가 작성한 것 인지를 확인
	- Docker Security Scanning
		- Docker이미지를 검사하여 이미 알려진 보안상의 취약성이 없다는 것을 확인
#### 3. Docker컨테이너를 작동시키는 기능(Run)
- Docker이미지를 가지고 여러개의 컨테이너 기동 가능
- 컨테이너 기동, 정지, 파기는 Docker명령을 사용
- 이미 움직이고 있는 OS상에서 프로세스를 실행시키는 것과 유사 (속도 빠름)
- 하나의 Linux 커널을 여러개의 컨테이너에서 공유
- 컨테이너 안에서 작동하는 프로세스를 하나의 그룹으로 관리
- 각 그룹마다 각각 파일 시스템/ 호스트명/ 네트워크등을 할당
- 그룹이 다르면 프로세스나 파일에 대한 액세스 불가능
- 이러한 구조를 사용하여 컨테이너를 독립된 공간으로서 관리 
- Linux커널기능(namespace, cgroups)기술이 사용
- Production환경에서는 모든 Docker 컨테이너를 한대의 호스트 머신에서 작동시키는일은 드뭄
- 시스템의 트랙픽 증감이나 가용성 요건, 신뢰도 요건등을 고려한 후에 여러 대의 호스트 머신으로 된 분산환경을 구축 
- 보통 컨테이너 관리에 대해서는 오케스트레이션 툴을 이용!!
### 5. Docker 컴포넌트
---
- Docker Engine(핵심)
	- Docke 이미지를 생성하고 컨테이너를 기동시키기 위한 Docker의 핵심기능. Docker명령 실행이나 Dockerfile에의한 이미지 생성
- Docker Registry(이미지 공개 및 공유)
	- Docker이미지를 공개 및 공유하기 위한 레지스트리 기능
- Docker Compose(컨테이너 일원관리)
	- 여러개의 컨테이너 구성정보를 코드로 정의하고, 명령을 실행함으로써 애플리케이션 실행 환경을 구성하는 컨테이너들을 일원 관리하기 위한 툴
- Docker Machine(Docker 실행환경 구축)
	- 로컬 호스트용인 Virtual Box, AWS EC2나 MS의 Azure와 같은 클라우드 환경에서 Docker 실행환경을 명령으로 자동 생성하기 위하 툴
	 
