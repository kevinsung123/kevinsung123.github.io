---  
layout: post  
title: "[Devops] git push with existsing project"  
subtitle: "Git push existing project"  
categories: devops
tags: devops git init
comments: true  
---  

### Step 1 : Create a new GitHub Repo
- empty repo를 먼저 생성[create a new empty repo](https://github.com/new). README를 넣을지 말지 결정가능. 
![image](https://assets.digitalocean.com/articles/how-to-push-an-existing-project-to-github/new-github-repo.png)

### Step 2 : Initialize Git in the project folder
- terminal에서 추가하고 싶은 폴더로 이동하여 아래 command를 실행

##### Initialize the Git Repo
```
git init
```
- 프로젝트의 root directory로 이동 후 아래 command를 실행


- 이번 step에서 `.git`directory를 프로젝트 폴더에 생성. `git` software가 인식을 하고 모든 metadata 그리고 version history를 프로젝트에 생성

#### Add the files to Git index
```
git add -A
```

- `git add` command는 git에게 어떤 파일들이 commit에 포함될지 그리고 `-A` 의미는 "include all 

#### Commit Added Files
```
git commit -m "added my project"
```
- `git commit` command는 added된 new commit를 만들고 message와 함께 포함. commit을 이해하기 위해 future reference를 사용

#### Add new remote origin(in this case)
```
git remote add origin git@github.com:sammy/my-new-project.git
```
- git에서 `remote`는 remote version of the same repository, which is typically on a server software. `origin`은 remote server(you can have multiple remotes)의 default이름 
- `git remote add origin`는 이 repo의 기본 remote server의 URL을 추가하는 것 

#### Push to GitHub
```
git push -u -f origin master
```
- `-f` flag는 force. 이것은 자동으로 remote directory를 overwrite하는 과정. 
- `-u`flag는 remote origin 설정. 이것은 `git push` 그리고 `git pull`를 나중에 특정 origin을 설정하지 않고 항상 push하게 해줌

### All together
```
git init
git add -A
git commit -m "Addded my project"
git remote add origin git@github.com:sammy/my-new-project.git
git push -u -f origin masater
```

###
### 참고
- [digitalocean](https://www.digitalocean.com/community/tutorials/how-to-push-an-existing-project-to-github)
