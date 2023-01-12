# README #

This repo is an accelerator creating an EKS cluser using terraform and leveraging Fargate for serverless node scaling in the Kubernetes cluster.

# Folder Structure #

At the top level we have the based terraform scripts. This is where you run your init, plan, applies and the main.tf will call modules and terraform variables from sub directories.

The /modules folder holds all the modules the main.tf calls.

The /environments folders holds the sample terraform.tfvars for pretend environments.

# Diagrams #

# How to use #

Authenticate to AWS using the CLI. Provide access key, secret key, us-east-1, and output format if wanted.

```
aws configure
```

Run terraform. At the top level of the repo run the below commands in order replacing {env} with a valid env file (dev, stg, prd)

```
terraform init
terraform plan --var-file="environments/{env}.tfvars"
terraform apply --var-file="environments/{env}.tfvars" -auto-approve
```

Connect to your new EKS cluster

```
aws eks --region <region> update-kubeconfig --name <eks-cluster-name>
```

Then you can run the deployment.yaml file to get a deployment up to test against

```
kubectl apply -f deployment.yaml
```

This deployment starts with 0 replicas so to trigger the Karpenter event of creating EC2 instances scale out the replicas of the deployment.

```
kubectl scale deployment inflate --replicas 5
kubectl get nodes
```

Run this command to see pods scheduled on a Faragate node

```
kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=<node>
```

# Cleanup #

Run these to commands to cleanup your account and avoid additional charges

```
kubectl delete deployment inflate -n ms
terraform destroy --var-file="environments/{env}.tfvars" -auto-approve
```