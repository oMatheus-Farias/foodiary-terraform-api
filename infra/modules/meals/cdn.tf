resource "aws_cloudfront_origin_access_control" "meals" {
  name                              = "${var.project_name}-${var.environment}-meals-cdn-oac"
  description                       = "Allows CloudFront to access the private meals S3 bucket."
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "meals" {
  enabled      = true
  http_version = "http2and3"
  price_class  = "PriceClass_All"
  comment      = "${var.project_name}-${var.environment} meals CDN"

  origin {
    domain_name              = aws_s3_bucket.meals.bucket_regional_domain_name
    origin_id                = "${var.project_name}-${var.environment}-meals-s3-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.meals.id

    s3_origin_config {
      origin_access_identity = ""
    }
  }

  default_cache_behavior {
    target_origin_id       = "${var.project_name}-${var.environment}-meals-s3-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  depends_on = [
    aws_s3_bucket_public_access_block.meals,
    aws_s3_bucket_ownership_controls.meals,
  ]
}

data "aws_iam_policy_document" "meals_cloudfront" {
  statement {
    sid       = "AllowCloudFrontReadMealsObjects"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.meals.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.meals.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "meals_cloudfront" {
  bucket = aws_s3_bucket.meals.id
  policy = data.aws_iam_policy_document.meals_cloudfront.json

  depends_on = [
    aws_s3_bucket_public_access_block.meals,
    aws_s3_bucket_ownership_controls.meals,
  ]
}
