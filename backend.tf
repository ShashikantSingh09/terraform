terraform {
  backend "s3" {
    bucket         = "terraform-test-security"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
  }
}
