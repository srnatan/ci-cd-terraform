terraform {
  backend "s3" {
    bucket         = "cloudcamp-terraform-state-cicd-jonatanv3"
    key            = "prod-cloudcamp/terraform.tfstate"
    region         = "us-east-1"
  }
}

resource "aws_s3_bucket" "terraform_state_cicd" {
  bucket = "cloudcamp-terraform-state-cicd-jonatanv3"
}

resource "aws_s3_bucket" "terraform_static_buckets"{
  bucket = "cloudcamp-static-buckets-jonatan"
}

