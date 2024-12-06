terraform {
  backend "s3" {
    bucket         = "terraform-trainocate"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
  }
}