---  
layout: post  
title: "[Quiz] GCP Bigdata and ML Quiz"  
subtitle: "GCP Bigdata and ML quiz "  
categories: gcp  
tags: bigdata ml 
comments: true  
---  

## Moduel Review2 : Google Cloud Platform Big Data and Machine Learning Fundamental Quiz Answers

### Question 1 : Complete the following 
#####  You shoule feed your machine learning model your ___ and not your ___. it will learn those for itself! 
- data, rules 

### Question 2 : True of Flase : Cloud SQL is a big data analytics warehouse
- False

### Question 3 : True or False : If you are migrating your Hadoop workload to the cloud, you must first rewrite all your Spark jobs to be compliant with the cloud.
- False

### Question 4: You are thinking about migrating your Hadoop workloads to the cloud and you have a few workloads that are fault-tolerant (they can handle interruptions of individual VMs gracefully). What are some architecture considerations you should explore in the cloud? choose all that apply
- Use PVMS or Preemptible Virtual Machines 
- Migrate your storage from on-cluster HDFS to off-cluster Google Cloud Storage(GCS)
- Consider having multiple Cloud Dataproc instances for each priority workload and then turning them down when not in use

### Question 5: Google Cloud Storage is a good options for stroing data that : 
- May be required to be read at some later time (i.e. load a csv file into BigQuery)
- Mau be imported from a bucket into a Hadoop cluster for analysis

### Question 6 : Relational databases are a good choice when you need :
- Transactional updates on relatively small datasets

### Question 7 : Cloud SQL and Cloud Dataproc offer familiar tools(MySQL and Hadoop/Pig/Hive/Spark). What is the value-add provided by Google Cloud Platform?
- Running it on Google infrastructure offers reliability and cost savings
- Fully-managed versions of the software offer no-ops

---



		



### 참조
[coursera-quiz answer](https://priyadogra.com/google-cloud-platform-big-data-and-machine-learning-fundamentals-quiz-answers/)