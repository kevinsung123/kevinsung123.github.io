#!/bin/bash
## step 1 . step into git blog folder
cd /c/Users/kevin/Desktop/working/MyGit/kevinsung123.github.io

# check pwd
pwd

## step2. read from stdin for commit messgae
read -p "Write commit message for push : " com_msg
echo "${com_msg}"

## step 3. git add all files
git add *

## step 4. git commit
git commit -m "${com_msg}"

## step 5. git push
git push

git log --pretty=format:"%h -%an,  %cd (%ar) : %s" --graph
