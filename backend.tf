terraform {
  backend "s3" {
    bucket         = "m3brazik"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform"
  }
}
