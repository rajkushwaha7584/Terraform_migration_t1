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

resource "aws_s3_object" "bucket_data" {
  key    = "my-data.txt"
  source = "${path.module}/rj.txt"
  bucket = aws_s3_bucket.demo_bucket.id
}
