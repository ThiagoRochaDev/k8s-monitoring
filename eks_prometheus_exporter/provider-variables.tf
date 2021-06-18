provider "aws" {
  profile = "default"
  region  = "us-west-1"
  version = ">= 2.38.0"
}

provider "kubernetes" {
  version = "1.10.0"
}

data "aws_efs_file_system" "demo" {
  depends_on = [
    kubernetes_namespace.demo,
  ]
    creation_token = "efs-eks"
}

output "demo" {
    value = data.aws_efs_file_system.demo
}

resource "kubernetes_namespace" "demo" {
  metadata {
    name = "terraform-prom-graf-namespace"

  }
}