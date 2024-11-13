---
title: "Python - The Battle for Programming Language is Not Over Ye"  
date: 2022-01-31 12:00:00 +0900
categories: [Python,module]
tags: [python,module]
comments: true
pin: true
math: true
mermaid: true
---  


<!--more-->

---

## The Battle for Programming Language is Not Over Yet

기술이 빠르게 발전하고 많은 프레임워크가 등장함에따라  올바른 작업에 적절한 Programming Language를 선택하는 것은 어려울 수 있다

### Python's Regioon of Dominance
오늘날 데이터 엔지니어의 작업은 SQL database를 상호 작용하고 쿼리를 실행하는 것뿐만 아니라  아래와 같은 작업도 실행 시킬 수 있어야 한다
- Managing infrastructure(through infrastructure as a code with frameworks with Terraform/Pulumi)
- Developing data pipelines
- Developing microservices/API/data frameworks
- Interacting with cloud services SDKs

Python has massive adoption today, and here's why:
- The learning curve for new programmer folks is pretty easy (notebook helps a lot)
- The data science ecosystem : machine leraning, visualization, deep learning
- Cloud adoption : all major cloud providers have a well-supported Python SDK

### The Brighter Future and Rust's Potential
- Golang seemed to be a good competitor. Terraform and Kubernetes have massive adoption, and both are written in Golang. It's also be desgined and supported by a major cloud Provider : google
- That being said, there aren't that many data frameworks built aroud Golang. The learning curve is also a siginificant barrierr to catch-up for Python's data average users.

Who would be next candidate then? Rust Here are four non-exhausitive reasons.
1. General popularity
- according to stack overflow study, Rust has benn most loved Programming language for four years in a Row
- Google trends also show a steady growth of Rust and `general fatigur for Python`
- Another big news is that `Rust will be second language of the official Linux Kernel`

2. Performance and low-memory footprint
- Rust's performance is at another level because it's compiled directly into machine code. No virtual machine, no interpreter sitting between your code and the computer
- In our cloud computing era, the footpring of your program on you compute system is driectly impacting your costs, but also the electrictiy usage and there the impact on the environment
- An interesting study by the New Stack revealed which programming language consumes the least electrictiy. Rust is at the top of that lists, while Python at the bottom

3. Interoperability with Python
- What if you could rewrite some part of your existing Python code base and still use it through your main Python program? That's combining the best of the two worlds.
- A concrete use case would be to perform specific actions against s3 files, which can be pretty slow in Python. With AWS annoucning recently their AWS SDK ins Rust in developer preview, this is something you could perform in Ruut. Using a Rust binding for a Python library like `PyO3` enables you to quickly do a simple interface to call your Rust program within Python

4. A lot of data projects are being rebuilt in Rust
- `Apache Arrow` is key common interface to build data processing frameworks. It has a great Rust implementation, and it's pubshing other data projects to rise:
    - Spark's Rust equivalent called `data fusion`
    - `Apache Delta Lake` has a native Rust interface with binding in Python and Ruby
    - Confluent kafka offer now a Rust binding

### Is is Worth it? Through?
Initially both Rust and python were built with differnet goals. The learning curve is steeper for Rust, and it will be difficult for some data citizens(Data scientists, data analysts) to jump on the boat. you are making a trade-off between performance and simplicity


The data enginner role evolves more strongly as devpos/backend engineer rather than just the SQL Person. t makes sense to try out Rust for some use cases in that context. Rust's mindset is also valuable for any future programming language you would learn next.

In the very end, programming languages are just part of your toolbelt, and it doesn't hurt to have more than one, especially when you see that the data engineer scope is expanding exponentially lately

### 참고
[medium](https://betterprogramming.pub/the-battle-for-data-engineers-favorite-programming-language-is-not-over-yet-bb3cd07b14a0)

