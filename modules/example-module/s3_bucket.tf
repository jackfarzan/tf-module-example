resource aws_s3_bucket bucket {
  bucket        = "jack-test-terraform-bucket"
  force_destroy = false
  region        = var.region

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
