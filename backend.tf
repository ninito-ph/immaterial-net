terraform {
  backend "s3" {
    bucket = "ninitos-immaterial-net-terraform-state-bucket"
    key    = ".terraform"
    region = "eu-west-2"
  }
}