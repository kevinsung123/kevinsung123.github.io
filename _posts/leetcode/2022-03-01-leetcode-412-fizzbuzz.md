---  
layout: post  
title: "[Leetcode] 412. FizzBuzz
"  
subtitle: "412. FizzBuzz"  
categories: leetcode  
tags: leetcode 412
comments: true  
---  


### Problem
![leetcode](https://leetcode.com/problems/fizz-buzz/)


### Solution
- 주어진 문자열에서 반복하지않은 문자를 반환 없으면 -1을 리턴

#### Approach 1 : Naive

##### Intuition
- 주어진문자열의 {문자:개수}를 가지는 dictionary를 구현
- 주어진 문자열의 반복하여 개수가 1인 문자를 처음 발견 시 리턴
##### Algorithm
Initialize an empty answer list.
Iterate on the numbers from 1 ... N1...N.
For every number, if it is divisible by both 3 and 5, add FizzBuzz to the answer list.
Else, Check if the number is divisible by 3, add Fizz.
Else, Check if the number is divisible by 5, add Buzz.
Else, add the number.

---


#### Approach 2 : Hash it!
##### Intuition

This approach is an optimization over approach 2. When the number of mappings are limited, approach 2 looks good. But what if you face a tricky interviewer and he decides to add too many mappings?

Having a condition for every mapping is not feasible or may be we can say the code might get ugly and tough to maintain.

What if tomorrow we have to change a mapping or may be delete a mapping? Are we going to change the code every time we have a modification in the mappings?

We don't have to. We can put all these mappings in a Hash Table.

##### Algorithm

Put all the mappings in a hash table. The hash table fizzBuzzHash would look something like { 3: 'Fizz', 5: 'Buzz' }
Iterate on the numbers from 1 ... N1...N.
For every number, iterate over the fizzBuzzHash keys and check for divisibility.
If the number is divisible by the key, concatenate the corresponding hash value to the answer string for current number. We do this for every entry in the hash table.
Add the answer string to the answer list.

![solutions](https://leetcode.com/problems/fizz-buzz/solution/)

![discussion](https://leetcode.com/problems/fizz-buzz/discuss/)

### Code
<script src="https://gist.github.com/kevinsung123/ce7869eb3f4be8ac2847e2badb4f534c.js"></script>