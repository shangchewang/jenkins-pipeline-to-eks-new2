terraform {
  backend "s3" {
    bucket = "jenkins-server-bucket"
    region = "ap-southeast-2"
    key = "eks/terraform.tfstate"
  }
}
