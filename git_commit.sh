#!/bin/bash
## step 1 . step into git blog folder
#cd /d/github/kevinsung123.github.io

# step1. git status
git status 

## step2. read from stdin for commit messgae
read  -p "Write commit message for push : " com_msg
echo "commit message : ${com_msg}"

## step 3. git add all files
git add ./*

## step 4. git commit 
git commit -m "${com_msg}"

## step 5. git push
git push

## step6. git log
git log --pretty=format:"%h -%an,  %cd (%ar) : %s" --graph
