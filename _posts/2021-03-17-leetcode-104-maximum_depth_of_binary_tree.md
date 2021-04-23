---  
layout: post  
title: "[Leetcode] 104.Maximm depth of binary tree"  
subtitle: "104.Maximm depth of binary tree"  
categories: leetcode  
tags: leetcode binary-tree
comments: true  
---  



### Problem
[leetcode](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.



### Solving
- BT의 depth를 구하기 위해서 DFS/BFS방법으로 구현
- BT의 조회 : node를 방문하는 기준으로 방법이 달라짐
    - 전위 순회(preorder)
        - node -> 왼쪽 -> 오른쪽
    - 중위 순회(inorder)
        - 왼쪽 서브트리 -> node -> 오르쪽 서브 트리
    - 후위 순회(postorder)
        - 왼쪽 서브트리 - > 오른쪽 서브 트리 - > node

### Code
<script src="https://gist.github.com/kevinsung123/8c890ac90ab3d16630a9304b1b488263.js"></script>


### 참고
