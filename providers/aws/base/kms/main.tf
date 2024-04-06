resource "aws_kms_key" "kms" {
  description             = "KMS for storing sensitive data"
  deletion_window_in_days = var.deletion_window_in_days
  multi_region = var.multi_region
  enable_key_rotation = var.enable_key_rotation

  tags = var.tags
}

resource "aws_kms_key_policy" "kms_policy" {
  key_id = aws_kms_key.kms.id
  policy = jsonencode({
    #Id = "KMS"
    Version = "2012-10-17"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Resource = "*"
        Sid      = "Enable IAM User Permissions"
      },
    ]
  })
}