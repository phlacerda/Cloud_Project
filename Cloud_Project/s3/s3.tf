resource "aws_s3_bucket" "bucket" {
  bucket = "s3-project-bucket"
  acl    = "private"
}