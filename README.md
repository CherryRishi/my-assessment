Task 1

Deploying Resoures in GCP

open cloud.google.com

create a project called my-assessment using portal.

select cloudshell from the window (I am selecting cloud shell because in it terraform sdk is already installed and it will authenticate with the cloud account automatically)

you need to enable compute instant api before setting up, you can do that going to protal, compute engine--enable api

open cloud editor create the following files

main.tf  --> it will have the resource configuration 

variables.tf  --> in this we will mention type of variables

terraform.tfvars --> the variables mentioned in this file will be called while running terraform commands

open cloud shell and run the following commands

terraform init --> initialise the terraform configuration

terraform validate --> validate the terraform configuration wethear its properly configured or not, otherwise throw an error

terraform plan ---> will tell you what are the resources are planned for creation, their names, outputs etc

terraform apply --auto-approve --> it will create the resources in gcp cloud.

onec created.

open cloud console check for resources created..

go to compute engine, select instances --. select instance you have created--> copy puplic ip of that instance and paste in new browser--> it will show nginx page if properly configured.

go to vpc network --select vpc network --> select the vpc you just created, check if 2 subnets are created or not by selecting subnets tab

got to firewalls --> select firewalls,--> you can check both http & https firewalls are allowing traffic on port 80 and 443.

Task 2





