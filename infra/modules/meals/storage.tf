resource "aws_s3_bucket" "meals" {
  bucket        = "${var.project_name}-${var.environment}-meals-bucket-${var.aws_account_id}"
  force_destroy = var.environment != "production"
}

resource "aws_s3_bucket_public_access_block" "meals" {
  bucket                  = aws_s3_bucket.meals.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "meals" {
  bucket = aws_s3_bucket.meals.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "meals" {
  bucket = aws_s3_bucket.meals.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
