#### Docker Overview

### Docker Cocepts
- Docker는 개발자 및 관리자를 위해 컨테이너와 함꼐 애플리케이션을 `build, run and share`하기 위한 `platform` 
- application을 deploy하기 위해 컨테이너의 사용을 `컨테이너화 containerization` 이라고도 부름
- Containerization은 대중적이고 인기있게 사용
	- Flexible(유연함)
		- 복잡한 애플리케이션을 `컨테이너화containerized` 가능
	- LightWeight (가벼움)
		- Container는 `host kernel을 사용하고 공유`하므로 virtual machine보다 시스템리소스 사용 측면에서 더 효율적으로 사용 
	- Portable(이식성높음)
		- build locally, deploy to the cloud, and run anywhere
	- Loosely coupled 
		- Container은 higly self sufficient and encapsulated.  (다른것에 영향을 끼지치않음)
	- Scalabe(확장성)
		- datacenter를 가로질러서 container를 증가시키고 자동으로 확장(분산)가능
	- Secure
		- 사용자의 어떠한 구성 필요없이 프로세스에 적극적인 제약과 격리를 적용
---		
### Images and containers
- 기본적으로 container는 hosts와 다른 container로부터 격리 시키기 위한 어떤 encapsulation feature가 추가되고 적용된 실행 중 인 프로세스이다
-  컨테이너 격리의 가장 중요한 측면 중 하나는 각 container는 자체 개인의 파일시스템과 상호 작용하고, 이 파일시스템은 Docker image로 제공
- 이 image에는 애플리케이션 실행에 필요한 모든 것을 제공- code/binary/ runtimes/ dependencies/ 그리고 다른 어떤 파일시스템
### Container and virtual machines
#### container
- Linux 기본적으로 실행하고 다른 containter들과 host machine kernel을 공유한다 
- 별도의 프로세스를 실행
- 다른 실행 파일보다 더 많은 메모리를 사용하지 않으므로 가볍다
![enter image description here](https://docs.docker.com/images/Container@2x.png)

#### Virtual machines
- 반면에 vm은 hypervisor를 통해 host 리소스에 가상으로 접근할수있는  철저히 guest os 에서 실행
- 일반적으로 VM은 `애플리케이션 로직에서 소비하는 것보다 더많은 오버헤드를 일으킴`
- ![enter image description here](https://docs.docker.com/images/VM@2x.png)

---
### Docker Engine
- Docker Engine은 client-server application
	- server는 daemon 프로세스라고불르는 `long-running` 프로그램의 종류이다 
	- 프로그램과 특정한 인터페이스를 하는 REST API를 통해 daemon과 통신하고 지시를 구성
	- CLI 클리이언트를 통해 통신
	- ![enter image description here](https://docs.docker.com/engine/images/engine-components-flow.png)
	- CLI는 Docker REST API를 통해 Docker daemon과 통신 및 제어를 한다
---
### Docker Architecture
- Docker는 client-server 아키텍처 사용
- Docker client는 Docker daemon에게 얘기함
	- building
	- running
	- distributing 
- Docker client와 Docker daemon같은 시스템에서 작동
- Docker client를 통해 remote Docker daemon에게 통신연결
- Docker client 및 daemon은 REST API를 통해 서로 통신 UNIX sockets 그리고 network interface를 통해서
- ![enter image description here](https://docs.docker.com/engine/images/architecture.svg)
### The Docker daemon
- docker daemon `dockerd` 는 Docker API 요청을 듣고 Docker object를 관리 (image, containters, network, volumes)
### The Docker Client
-`docker`는 많은 Docker user들이 Docker와 통신하는 주요 방법
- `docker run`과 같은 명령어를 사용시, client는 명령어를 `dockerd`에게 보내고 그것을 실행
- `docker`는 Docker API를 사용
### Docker registries
- Docker registiy 는 Docker 이미지를 저장
- Docker Hub는 pulbic registry 이다 (누구나 사용가능)
### SERVICES
- service는 multiple Docker daemon들에게 container를 확장가능
#### NAMESPACES
- `namespace`라고 불리는 기술을 사용 
- 격리된 workspace `cotainer`라고 불리는 장소를 제공
- `container`를 실행시, Docker는 container를 위한 namespace를 생성
- 이 namespace들은 격리된 계층을 제공
- 각각의 container는 분리된 `namespace`를 실행 그리고 그것의 접근은 namespace에 한정
- Docker Engine은 다음의 namespace 를 사용
	- `pid` namespaces : Process isolation (PID: process ID)
	- `net`namespaces : Managing network interfaces(NET: networking)
	- `ipc`namespaces: Managing access to IPC 리소스 (IPC : InterProcess Communication)
	- `mnt` namespaces :  Managin filesystem mount points : (MNT: mount)
	- `uts` namespaces : Isolatiing kernel and version identifies (UTS : Unix Timeshraring System)
### Control Groups
- `control groups(cgroups)`f라고 불리는 기술을 Docker Engine이 사용
- 특정 리소스들의 집합의 애플리케이션으로 제한
- cgroup를 제어하는것을 통해 Docker Engine은 hardware 리소스를 공유 제한 및 제약을 강제로 적용 
	- ex) 특정 container에 메모리를 한정
### Union file systems
- layer를 생성함으로써 Union File systtem UnionFS를 제공
- ligthweight 그리고 fast
-  Docker Engine은 UnionFS를 사용하여 container를 위한 block를 제공
- Docker Engine은 multiple UnionFS variants(AUFS, btrfs,vfs, DeviceMapper를 사용)
### Container Format
- Docker engine은 `namespace`, `cgroups`, `UnionFS`를 wrapper하여 container format을 사용
- 기본 container format은 `libcontainer`라고 부름

