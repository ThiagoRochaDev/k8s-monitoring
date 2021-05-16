provider "aws" {
  region  = "us-west-1"
}

provider "kubernetes" {

}

data "aws_availability_zones" "available" {}

resource "kubernetes_namespace" "tf-ns" {
  metadata {
    name = "terraform-prom-grafana-namespace"
  }
  
}

resource "aws_efs_file_system" "tf-efs-fs" {
  creation_token = "my-efs-file-system-1"

}
