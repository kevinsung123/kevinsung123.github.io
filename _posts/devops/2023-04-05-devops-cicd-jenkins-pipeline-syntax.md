---  
layout: post  
title: "[Devops] Jenkins Pipeline"
subtitle: "Jenkins Pipeline 개요"  
categories: devops
tags: devops cicd jenkins
comments: true  
---  

## Jenkins Pipeline
---

### What is Jenkins Pipeline?
- Jenkins Pipeline은 Jnekins에 CD(Continuous Delivery) Pipeline 구현 및 통합을 지원하는 일련의 plugin들의 집합
- CD Pipeline은 버전 control을 통하여 sw를 적용하기 위한 프로세스의 자동화된 표현임
- SW의 모든 변화는(source control에서 commit) release 되기 위해서 복잡한 process를 거침
- 이 프로세스는 reliable 그리고 repeatable한 build과정이 포함되고, 여러 단계의 testing과 deployment를 거쳐서 build된다
- Pipeline은 DSL syntax를 통해  복잡한 delivery프로세르를 `as code`로서 간편하게 modeling되도록 제공
- Jenkins Pipeline은 `Jenkinsfile`로 작성 (프로젝트의 source control을 통하여 commit 됨 )
    - 이점
        - 모든 branch와 PR(Pull Request)에대해 pipeline build프로세스를 자동화
        - Code 리뷰 및 반복 
        - audit 추적가능
        - 프로젝트의 멤버들에 의해 view/edit가능하므로 `Single Source of truth` 실현
### Declarative versus Scripted syntax
- Jenkinsfile은 위의 2가지 syntax로 작성 가능
- Declartive pipeline이 더 많은 이점을 가짐
    - scripted syntax보다 풍부한 `syntatical feature`
    - Pipeline code를 더 쉽게 write/read하게 만듬
- 많은 syntatical component(or 'steps')들은 `Jenkinsfile`로 작성
- 

### Why Pipeline?
- Jenkins는 기본적으로 automation 패턴을 support하는 automation engine임
- Pipeline은 간단한 CI부터 복잡한 CD Pipeline까지의 케이스를 지원하기 위해 Jenkins위에 automation tool의 집합을 추가함
- `Cdoe` : Pipeline은 code로 구현, source control을 검사, 팀원에게 edit,review 그리고 iterate할 수 있는 능력을 부여 
- `Durable` : Jenkins controller의 planned or unplanned 재시작 두 case모두 pipeline은 survive
- `Pausable` : Pipeline은 human input 또는 Pipeline run전에 approval를 통하여  stop 그리고 wait 가능
- `Versatile` : 복잡한 실제 CD 요구사항을 지원. (fork/join, loop 그리고 paralle 실행)
- `Extensible` : DSL확장을  그리고 다양한 option을 지원
![Pipeline](https://www.jenkins.io/doc/book/resources/pipeline/realworld-pipeline-flow.png)


### Piepeline Concepts

#### Pipeline
- Pipeline은 CD Pipeline은 user-defined model
- Pipeline의 code는 building application, test 및 delivering을 위한 stage들을 위한 전체 build 프로세스를 정의
[Declarative pipeline syntax](https://www.jenkins.io/doc/book/pipeline/#declarative-pipeline-fundamentals)
#### Node
- node는 Jenkins의 env의 일부 그리고 pipeline을 실행시킬 수 있음
[Scripted pipeline syntax](https://www.jenkins.io/doc/book/pipeline/#declarative-pipeline-fundamentals)
 
#### Stage
- stage block은 현재 Jenkins pipeline의 status/progress를 visualiza할 수 있는 많은 plugin들을 사용하는 전체 Pipeline을 통하여 수행되는 task들의 유일한 subset (ex Build,Test,Deploy stages)

#### Step
- 특정 time(또는 프로세스 step)에서 특별한 무엇을해야하는지 jenkins에 알려주는 `single task`
- ex) `sh` step을 통하여 make shell command를 실행. 
- pugin이 Pipelien DSL(Domain Specific Language)을 확장할때, 그 대표적인 의미는 plugin은 새로 구현된 step이을 의미

### Declarative Pipeline fundamentals
- pipeline block을 전체의 pipeline을 통하여 무엇을 해야되는지 정의

```
Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any             -- 1
    stages {
        stage('Build') {  -- 2 
            steps {
                //        -- 3
            }
        }
        stage('Test') {   -- 4
            steps {
                //        -- 5
            }
        }
        stage('Deploy') { -- 6
            steps {       -- 7
                // 
            }
        }
    }
}
```
#### 1 Execute this Pipeline or any of its stages, on any available agent.
#### 2 Defines the "Build" stage
#### 3 	Perform some steps related to the "Build" stage
#### 4 Defines the "Test" stage.

```
Jenkinsfile (Declarative Pipeline)
pipeline {      1
    agent any 2
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {  3
            steps {  4
                sh 'make'  5
            }
        }
        stage('Test'){
            steps {
                sh 'make check'
                junit 'reports/**/*.xml' 6
            }
        }
        stage('Deploy') {
            steps {
                sh 'make publish'
            }
        }
    }
}
```
#### 1 pipeline is Declarative Pipeline-specific syntax that defines a "block" containing all content and instructions for executing the entire Pipeline.
#### 2 agent is Declarative Pipeline-specific syntax that instructs Jenkins to allocate an executor (on a node) and workspace for the entire Pipeline.
#### 3stage is a syntax block that describes a stage of this Pipeline. Read more about stage blocks in Declarative Pipeline syntax on the Pipeline syntax page. As mentioned above, stage blocks are optional in Scripted Pipeline syntax.
#### 4 steps is Declarative Pipeline-specific syntax that describes the steps to be run in this stage.
#### 5 sh is a Pipeline step (provided by the Pipeline: [Nodes and Processes plugin](https://plugins.jenkins.io/workflow-durable-task-step/)) that executes the given shell command.  
#### 6 junit is another Pipeline step (provided by the [JUnit plugin](https://plugins.jenkins.io/junit/)) for aggregating test reports.
#### 7 sh is a Pipeline step (provided by the Pipeline: Nodes and Processes plugin) that executes the given shell command.


--- 
- [Jenkins pipeline](https://www.jenkins.io/doc/book/pipeline/#declarative-pipeline-fundamentals)
- [Jenkins pipeline syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)

