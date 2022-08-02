# Track terraform state in an S3 bucket
# This is necessary in order for multiple machines
# to access the same deployment
terraform {
  backend "s3" {
    key    = "rearc/quest.json"
    region = "us-east-1"
  }
}