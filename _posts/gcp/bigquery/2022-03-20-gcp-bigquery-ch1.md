---  
layout: post  
title: "[BigQuery]Chatper 1. What is Google BigQuery"  
subtitle: "[Chatper 1. What is Google BigQuery(The Definite Guide)"  
categories: gcp
tags: bigquery work 
comments: true  
---  


## Chatper 1. What is Google BigQuery

<!--more-->

### Data Processing Architectures
- serverless, highly scalable data wareshouse (query engine이 built-in)


### BigQuery : A Serverless, Distributed SQL Engine
- BigQuery is serverless
- Can run queries without the need to manage infrastructure
- Scalability is possible because the service distributes the query processing among thousands of workers almost instantaneously


### Working with BigQuery
- BigQuery is datawarehouse, implying a degree of `centralization and ubiquity`
- The benefits of BigQuery
    - when we do joins of datasets from completely differenct sources (조인할때)
    - when we query against data that is sotred outside BigQuery(Federation Query)
- The serverless nature of BQ provides the technological means to `break down department silos` and `streamline collaboration`
    - 부서간 사일로 : 부서 이기주의
    - 협업 최소화 

### ETL, EL and ELT
- 

### 참조
- Google BigQuery The Definite Guide p1-p22
- [coursera : bigquery-fast-sql-engine](https://www.coursera.org/learn/gcp-big-data-ml-fundamentals/lecture/H1irf/bigquery-fast-sql-engine)