---  
layout: post  
title: "[Leetcode] 387. First Unique Character in a String    
"  
subtitle: "387. First Unique Character in a String"  
categories: leetcode  
tags: leetcode 387
comments: true  
---  


### Problem
![leetcode](https://leetcode.com/problems/first-unique-character-in-a-string/)
Given a string s, return the first non-repeating character in it and return its index. If it does not exist, return -1.

### Solution
- 주어진 문자열에서 반복하지않은 문자를 반환 없으면 -1을 리턴
- Sol1
    - 주어진문자열의 {문자:개수}를 가지는 dictionary를 구현
    - 주어진 문자열의 반복하여 개수가 1인 문자를 처음 발견 시 리턴

### Code
<script src="https://gist.github.com/kevinsung123/18db2dd4017080bdf8121bc57eccdf36.js"></script>