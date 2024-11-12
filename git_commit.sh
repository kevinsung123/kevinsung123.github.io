#!/bin/bash
## step 1 . step into git blog folder
#cd /d/github/kevinsung123.github.io

# step1. git status
git status 


## step 2. git add all files
git add *
git status 

## step 3. read from stdin for commit messgae
echo "Enter Commit Message"
read   commit_message
echo "commit message : ${commit_message}"

## step 4. git commit 
git commit -m "${commit_message}"

## step 5. git push
git push

## step6. git log
git log --pretty=format:"%h -%an,  %cd (%ar) : %s" --graph
