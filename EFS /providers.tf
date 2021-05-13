provider "aws" {
  profile = "thiago_01"
  region  = "us-east-1"
}

provider "kubernetes" {}

data "aws_availability_zones" "available" {}

resource "kubernetes_namespace" "tf-ns" {
  metadata {
    name = "terraform-prom-graf-namespace"
  }
  
}

resource "aws_efs_file_system" "tf-efs-fs" {
  creation_token = "my-efs-file-system-1"

  tags = {
    Name = "files-thg-filesystem"
  }
}
