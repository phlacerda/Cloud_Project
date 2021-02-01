resource "aws_kinesis_firehose_delivery_stream" "kinesis-project-cloud" {
  depends_on = [aws_iam_role_policy.firehose-elasticsearch]

  name        = "terraform-kinesis-firehose-es"
  destination = "elasticsearch"
  s3_configuration {
    role_arn   = aws_iam_role.firehose.arn
    bucket_arn = aws_s3_bucket.bucket.arn
  }
  elasticsearch_configuration {
    domain_arn = aws_elasticsearch_domain.es_project_cloud.arn
    role_arn   = aws_iam_role.firehose.arn
    index_name = "kinesis-project-cloud"
    type_name  = "kinesis-project-cloud"

    vpc_config {
      subnet_ids         = [aws_subnet.first.id, aws_subnet.second.id]
      security_group_ids = [aws_security_group.first.id]
      role_arn           = aws_iam_role.firehose.arn
    }
  }
}