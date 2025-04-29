terraform {
  backend "s3" {
    bucket         = "applied-37-terraform-state-dev-us-west-1"
    key            = "eks/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "dev-terraform-lock-table-us-west-1"
    encrypt        = true
  }
}
