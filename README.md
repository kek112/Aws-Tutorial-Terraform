# Aws-Tutorial-Terraform

This Project is an example for using terraform to create a simple ec2 instance in the AWS CLoud. 
It also creates a new VPC with a Network Structure taken from the EDX Course Developing on AWS. 
Therefore it creates 2 public subnets and 2 private subnets. One public and prove subnet are each in another aviablility zone. 
There is also an Security Group created which currently allows only SSH access and another tf file which copies your public ssh key 
on the instance. 
