---
title:  "df(파일시스템 명령어)"
categories: [linux, tool]
tags: [linux,shell,df]
---

### DF(Disk Free)
#### Name
df - report file system disk space usage
<!--more-->
#### Synopsis
df [OPTION]...[FILE]

#### Description
- df : displays the amount of disk space availabe on the file system containing each file name argument
- Disk space is shown in 1K blocks by default
- df shows the space available on tht file system rather than on the file system containg the device node(which is always the root file system)
- disk의 남은 용량을 확인

#### Options
- -a,--al :  include dummy file systems
- -B,--block-size=SIZE : user SIZE-byte blocks
- --direct :  show statistics for a file instead of mount point
- -h,--human-readable :  print size in human readable format(e.g , 1K 234M 2G)
- -i,--inodes :  list inode information instead of block usage
- -T,--print-type :  print file system type

#### Example
- `df -TH`
- `df -T /home/bastion`

