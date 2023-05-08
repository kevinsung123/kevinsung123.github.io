---  
layout: post  
title: "[Devops] Jenkins"
subtitle: "Jenkins 개요"  
categories: devops
tags: devops cicd jenkins
comments: true  
---  

## Jenkins Item(project)의 종류
---

### Jenkins item
- freestyle project
    - 간단한 빌드 및 배포 
- pipeline 
    - 스크립트 언어인 Groovy 문법을 통해 일련의 작업들의 순서와 흐름 정의
    - 작어별 success/fail 유무와 로그 파악하기에 유용
- multipipeline
    - git branch를 토대로 여러개의 branch를 하나의 job으로 관리하는 item
###  multibranch pipeline
- Git branch를 토대로 Jenkins pipeline을 만듬
- 소스control에서 새로운 branch를 자동감지 후 각각의 branch의 pipeline을 생성
- pipeline이 build 시작할때 jenkins는 build 단게를 위한 jenkinsfile을 활용

![multibranch](https://devopscube.com/wp-content/uploads/2020/06/jenkins-multibranch-pipeline.jpg)
- branch discovery를 토대로 PR(Pull Request)를 지원
- branch 요구사항에 맞게 job을 build하기위해 조건 로직을 추가가능
- 예를들어 feature branch는 오직 unit testing 그리고 sonar analysis만 하고 싶다면, condition을 주어서 deployment stage를 skip하면 됨
![condition](https://devopscube.com/wp-content/uploads/2020/06/stages-condition-multi-min.png)

- 개발자가 feature branch에서 다른 branch로 PR을 하면, pipeline은 unit test그리고 sonar analysis만함(deploy는 skip)
- multi-branch pipeline은 애플리케이션의 CD(Continuous delievery)에 제한을 두지 않음
- 예시는 Docker image 또는 VM image patching, building 그리고 upgrade 프로세를 활용함 

### How Does a Multi-branch Pipeline work?
- 아래 조건으로 pipeline 작성
    - Development starts with a feature branch by developers committing code to the feature branch. 
    - Whenever a developer raises a PR from the feature branch to develop a branch, a Jenkins pipeline should trigger to run a unit test and static code analysis. 
    - After testing the code successfully in the feature branch, the developer merges the PR to the develop branch.
    - When the code is ready for release, developers raise a PR from the develop branch to the master. It should trigger a build pipeline that will run the unit test cases, code analysis, push artifact, and deploys it to dev/QA environments.
- 위의 조건을 보면 jenkins job의 수동 trigger는 없음
- branch pull request가 있을때마다, pipeline은 자동으로 trigger되고 branch의 필요한 step들을 실행

![build process](https://devopscube.com/wp-content/uploads/2020/06/multibranch_pipeline_workflow-2-min.png.webp)

- multi branch pipeline이 동작방식은 아래와 같음
    - When a developer creates a PR from a feature branch to develop a branch, Github sends a webhook with the  PR information to Jenkins.
    - Jenkins receives the PR and finds the relevant multibranch pipeline, and creates a feature branch pipeline automatically. It then runs the jobs with the steps mentioned in the Jenkinsfile from the feature branch. During checkout, the source and target branches in the PR gets merged. The PR merge will be blocked on Github until a build status from Jenkins is returned.
    - Once the build finishes, Jenkins will update the status to Github PR. Now you will be able to merge the code. If you want to check the Jenkins build logs, you can find the Jenkins build log link in the PR status.

### a Multi-branch Jenkinsfile
```
pipeline {

    agent {
        node {
            label 'master'
        }
    }

    options {
        buildDiscarder logRotator( 
                    daysToKeepStr: '16', 
                    numToKeepStr: '10'
            )
    }

    stages {
        
        stage('Cleanup Workspace') {
            steps {
                cleanWs()
                sh """
                echo "Cleaned Up Workspace For Project"
                """
            }
        }

        stage('Code Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    userRemoteConfigs: [[url: 'https://github.com/spring-projects/spring-petclinic.git']]
                ])
            }
        }

        stage(' Unit Testing') {
            steps {
                sh """
                echo "Running Unit Tests"
                """
            }
        }

        stage('Code Analysis') {
            steps {
                sh """
                echo "Running Code Analysis"
                """
            }
        }

        stage('Build Deploy Code') {
            when {
                branch 'develop'
            }
            steps {
                sh """
                echo "Building Artifact"
                """

                sh """
                echo "Deploying Code"
                """
            }
        }

    }   
}
```

### Create Multibranch Pipeline on Jenkins (Step by Step Guide)


--- 
- [velog-jenkins](https://velog.io/@bbkyoo/Jenkins)
- [jenkins-multibranch-pipeline-tutorial](https://devopscube.com/jenkins-multibranch-pipeline-tutorial/)
