resource "aws_s3_bucket" "terraform_state_cicd" {
  bucket = "my-terraform-state-bucket-jonatan"
}

resource "aws_s3_bucket" "terraform_static_buckets" {
  bucket = "cloudcamp-static-buckets-jonatan"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-jonatan"
    key            = "prod-cloudcamp/terraform.tfstate"
    region         = "us-east-1"
  }
}