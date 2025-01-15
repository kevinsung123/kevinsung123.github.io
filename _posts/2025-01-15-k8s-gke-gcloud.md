---
title: "(3) GKE interface with gcloud "
date : 2025-01-15 09:00:00 +0900
categories: [Kuberntest,GKE]
tags : [gcp,wif]
---

### Identify Node images using Google cloud 


#### **gcloud**

- **Command**
```
gcloud container node-pools list \
    --cluster=CLUSTER_NAME \
    --format="table(name,version,config.imageType)"
```

- **Output**
```
NAME          NODE_VERSION    IMAGE_TYPE
default-pool  1.19.6-gke.600  UBUNTU

#### **kubectl**

### 참고 

- <https://cloud.google.com/kubernetes-engine/docs/how-to/migrate-containerd>
