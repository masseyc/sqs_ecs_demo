provider "aws" {
  region = var.region
}

# Normally below would be managed be the CI/CD pipeline or terraform framework
terraform {
  backend "s3" {
    bucket = "<tf state bucket>" # Obfuscated value, correct/update to run
    key    = "rest-api.tfstate"
    region = "eu-west-1"
  }
}
