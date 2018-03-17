#####################################
# S3 Bucket Settings
#####################################
resource "aws_s3_bucket" "s3_bucket_host" {
  bucket = "${var.app_base_name}_bucket"
  acl    = "public-read"
  policy = "${file("policies/bucket_policy.json")}"

  website {
    index_document = "index.html"
  }

  tags {
    Name        = "${var.app_base_name}"
    Environment = "Dev_V0.1.0"
  }
}