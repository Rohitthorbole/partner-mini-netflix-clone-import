#s3
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-demo-s3-rt"
  versioning {
    enabled = true
  }
  website {
    index_document = "index.html"
  }
}

#s3 Import
import {
  to = aws_s3_bucket.my_bucket
  id = "my-demo-s3-rt"
}

#s3 bucket policy
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "PublicRead",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::my-demo-s3-rt/*"
      }
    ]
  })
}

#s3 bucket policy Import
import {
  to = aws_s3_bucket_policy.my_bucket_policy
  id = "my-demo-s3-rt"
}