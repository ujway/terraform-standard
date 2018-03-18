#####################################
# S3 Bucket Settings
#####################################
resource "aws_s3_bucket" "s3_bucket_host" {
  bucket = "${var.app_base_name}-bucket"
  acl    = "public-read"
  policy = "${file("policies/bucket_policy.json")}"

  website {
    index_document = "index.html"
  }

  tags {
    Name        = "${var.app_base_name}"
    Environment = "${var.s3_bucket_tag}"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${var.app_base_name}-bucket"
  key    = "${var.key_name}"
  source = "s3_bucket_sources/index.html"
}