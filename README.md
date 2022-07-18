# Terraform_task

this task is aim to improve terraform tool by using it to create infrastructure in AWS  


# Networking
- create vpc
- create internet gateway
- create public route table
- create private route table
- create public route
- attach public route table to subnets 
- create security group which allow ssh from 0.0.0.0/0
- create security group that allow ssh and port 3000 from vpc cidr only
- create ec2(bastion) in public subnet with security group from 7
- create ec2(application) private subnet with security group from 8
- create two workspaces dev and prod
- create two variable definition files(.tfvars) for the two environments
- separate network resources into network module
- apply your code to create two environments one in us-east-1 and eu-central-1
- run local-exec provisioner to print the public_ip of bastion ec2
- upload infrastructure code on github project
- verify your email in ses service
- create lambda function to send email
- create trigger to detect changes in state file and send the email
- create rds
- create elastic cache
