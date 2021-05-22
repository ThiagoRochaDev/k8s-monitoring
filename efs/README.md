# EKS and EFS

This code will provision EKS and EFS.

Steps to create:
- terraform init
- terraform apply

Steps to destroy:
- terraform destroy

This code has been picked from HashiCorp (https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/eks-getting-started) and edited further.

This is the full configuration from https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html

See that guide for additional information.

NOTE: This full configuration utilizes the [Terraform http provider](https://www.terraform.io/docs/providers/http/index.html) to call out to icanhazip.com to determine your local workstation external IP for easily configuring EC2 Security Group access to the Kubernetes servers. Feel free to replace this as necessary.