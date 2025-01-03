---
title: "(2)Apache Spark Interview"
date : 2024-12-13 09:00:00 +0900
categories: [Spark,Inteview]
tags : [spark,interview]
---


#### **1.What is DAG in Spakr, and what is its purpose?**

- `DAG(Directed Acyclie Graph)`은 각 stage가 병렬로 실행될 수 있는 `task`의 집합으로 이루어진 일련의 `computation stage`
- `DAG Scheduler`는 `job`을 `shuffle`경계를 기반으로 `job`을 `stages of task`로 나누고 이러한 `stage`들을 올바른 순서로 실행하여 최종겨로가를 계산하는 역할을 함
- `DAG의 목적`은 `performance`와 `fault-tolernace`을 위해 `execution plan`을 최적화하는것

#### **2. if data can be spilled to disk, why do we encounter OOM erros?**

- **executor memory limit** : intermediate RDD 메모리에 맞지 않은정도로 큰 경우
- **memory leaks** : inefficient code난 bug때문
- **improperly tuned memory settings** : executor나 driver에 메모리가 부족한 경우
- **skewed data** : 특정 partition이 다른 partition보다 상당히 커서 메모리 사용이 고르지 않은경우
- **complex transformation** : 대량의 중간데이터를 메모리에 동시엥 보관
  
#### **3. How does Spark work internally?**

1. Job Submission: The user submits a Spark job via a SparkContext.

2. DAG Creation: The SparkContext creates a logical plan in the form of a DAG.

3. Job Scheduling: The DAG scheduler splits the job into stages based on shuffle boundaries.

4. Task Assignment: The stages are further divided into tasks and assigned to executor nodes.

5. Task Execution: Executors run the tasks, processing data and storing intermediate results in memory or disk.

6. Shuffle Operations: Data is shuffled between executors as required by operations like joins.

7. Result Collection: The final results are collected back to the driver node or written to storage.

#### **4.What are the different phases of the SQL Engine?**

The different phases of the SQL engine in Spark include:

1. Parsing: Converts the SQL query into an unresolved logical plan.

2. Analysis: Resolves the logical plan by determining the correct attributes and data types using the catalog.

3. Optimization: Optimizes the logical plan using Catalyst optimizers.

4. Physical Planning: Converts the optimized logical plan into a physical plan with specific execution strategies.

5. Execution: Executes the physical plan and returns the result.

#### **5.Explain in detail the different types of transformations in Spark.**

Transformations in Spark are of two types:

1. Narrow Transformations: These transformations do not require shuffling of data across partitions and can be executed without data movement. Examples include:

– map(): Applies a function to each element.

– filter(): Selects elements that satisfy a condition.

– flatMap(): Similar to map but can return multiple elements for each input element.

2. Wide Transformations: These transformations require shuffling of data across partitions and involve data movement. Examples include:

– reduceByKey(): Aggregates data across keys and requires shuffling.

– groupByKey(): Groups data by key, resulting in shuffling of data.

– join(): Joins two RDDs based on a key, involving shuffling.

#### **6. Spark Jobs : Stage,Shuffle,Tasks,Slots**

![spark job hierarchy](https://miro.medium.com/v2/resize:fit:720/format:webp/0*JaX2_qvxgwWFE64I.png)

1. Spark creates one job for each action.
2. This job may contain a series of multiple transformations.
3. The Spark engine will optimize those transformations and creates a logical plan for the job.
4. Then spark will break the logical plan at the end of every wide dependency and create two or more stages.
5. If you do not have a wide dependency, your plan will be a single-stage plan.
6. But if you have N wide-dependencies, your plan should have N+1 stages.
7. Data from one stage to another stage is shared using the shuffle/sort operation.
8. Now each stage may be executed as one or more parallel tasks.
9. The number of tasks in the stage is equal to the number of input partitions.

`task`는 Spark job을 위해 가장 중요한 concept이며 `smallests unit of work` in Spark job. `Spark driver`는 이 task들을 executor에 할당 그들에게 일하도록 요청

### **참고**

- <https://medium.com/@deepa.account/spark-concepts-and-questions-aaea515d25ef>
- <https://sharmashorya1996.medium.com/advance-spark-concepts-for-job-interview-part-1-b7c2cadffc42>
- <https://sharmashorya1996.medium.com/advance-spark-concepts-for-job-interview-part-2-933a3565f87e>
