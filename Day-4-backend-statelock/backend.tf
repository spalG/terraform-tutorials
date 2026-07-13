terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket9811"
    key            = "network/ec2/terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "terraform-state-lock"
    use_lockfile   = true
    encrypt        = true
  }
}