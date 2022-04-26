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
- 첫번쨰날의 주식가격을 buy 
- 항상 i번쨰 날에 주식을 sell하여 maxprofit 값을 계속 추적 
- buy 값을 항상 비교하여 min값으로 갱신


### Code
<script src="https://gist.github.com/kevinsung123/2bf42753aab32013509df408c32aed4e.js"></script>