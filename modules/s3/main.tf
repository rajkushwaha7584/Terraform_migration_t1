resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "s3-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "demo_bucket" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "demo_bucket" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "demo_bucket" {
  bucket = aws_s3_bucket.demo_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "demo_bucket" {
  bucket = aws_s3_bucket.demo_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "bucket_data" {
  key    = "my-data.txt"
  source = "${path.module}/rj.txt"
  bucket = aws_s3_bucket.demo_bucket.id
  etag   = filemd5("${path.module}/rj.txt")

  depends_on = [
    aws_s3_bucket_public_access_block.demo_bucket,
    aws_s3_bucket_ownership_controls.demo_bucket,
    aws_s3_bucket_server_side_encryption_configuration.demo_bucket,
    aws_s3_bucket_versioning.demo_bucket,
  ]
}
