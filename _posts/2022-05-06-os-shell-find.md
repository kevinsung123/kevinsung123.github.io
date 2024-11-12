---
title: [Linux-Shell] find
category: [linux, tool]
---

### Find it and do what you want
It's safe to say that the `find` command in Linux is one of the must-know operations for backend developers, unless you are using a Windows-server

For technical interviews, it's also a popular topic. Let's see a real questions

#### Scenario
```
If there is a directory called "logs" on you Linux server, how to delete the log files under it whose last access times was over one year ago?
```

#### Answer
First of all, we need to use the `cd` command to enter the corresponding directory, and then, the command is as follows:
` find . -type f -atime +365 -exec rm -rf {} 
;`


#### 0. Find Files by Names or Regular Expressions
- Let's start from the simples usage. TO search files by a specific name, the command is like the following :

``` 
find . -name test.txt
```


### 참고
- [medium](https://medium.com/techtofreedom/7-uses-of-find-command-in-linux-c45f70d7351a)

