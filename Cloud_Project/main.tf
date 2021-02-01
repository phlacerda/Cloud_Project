provider "aws" {
    region = "us-east-1"  
}

module "iam" {
  source = "./iam"
}

module "s3" {
  source = "./s3"
}

module "elasticsearch" {
  source = "./elasticsearch"
}

module "firehose_to_es" {
  source = "./firehose_to_es"
}

module "firehose_to_s3" {
  source = "./firehose_to_s3"
}
