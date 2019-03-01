terraform {
  backend "s3" {
    bucket = "aws-tf-states-karl"
    key = "aws-tutorial.tfstate"
    region = "eu-central-1"
    profile = "aws-tutorial"
  }
}

