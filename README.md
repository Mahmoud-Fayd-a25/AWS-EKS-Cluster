# Create AWS EKS Cluster and Node Groups using Terraform
![kubernetes cluster with eks](https://github.com/Mahmoud-Fayd-a25/AWS-EKS-Cluster/blob/master/img/eks.png)
---
This repository contains Terraform files to deploy a Kubernetes cluster in AWS. It sets up a two-availability-zone architecture with four subnets—two public and two private. Additionally, The configuration includes two worker nodes, with one situated in the private subnet and the other in the public subnet, it deploys a bastion host in the public subnet to facilitate connections to worker nodes. 
## Steps:
- Create VPC
- Create Bastion Host
- EKS Cluster
    1. Create EKS Cluster
    2. Create EKS Cluster IAM Role
- EKS Node Group
    1. Create EKS Worker Nodes EC2 Instances
    2. Create EKS Node Group IAM Role