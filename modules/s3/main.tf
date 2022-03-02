# create a zip of your deployment with terraform
data "archive_file" "api_dist_zip" {
  type        = "zip"
  source_dir = "flask-backend"
  output_path = "flask-backend.zip"
}

resource "aws_s3_bucket" "dist_bucket" {
  bucket = "${var.namespace}-elb-dist"
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.dist_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "dist_item" {
  bucket = aws_s3_bucket.dist_bucket.id
  key    = "${var.bucket_key}"
  source = "flask-backend.zip"
  etag   = filemd5("flask-backend.zip")
}