---  
layout: post  
title: "[Leetcode] 121. Best Time to Buy and Sell Stock
"  
subtitle: "121. Best Time to Buy and Sell Stock"  
categories: leetcode  
tags: leetcode 121
comments: true  
---  


### Problem
![leetcode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

 

### Solution
- 주어진 문자열에서 반복하지않은 문자를 반환 없으면 -1을 리턴
- Sol1
    - 주어진문자열의 {문자:개수}를 가지는 dictionary를 구현
    - 주어진 문자열의 반복하여 개수가 1인 문자를 처음 발견 시 리턴

### Code
<script src="https://gist.github.com/kevinsung123/2bf42753aab32013509df408c32aed4e.js"></script>