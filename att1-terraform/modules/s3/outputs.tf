output "bucket_name" {
  description = "Nome do bucket S3"
  value       = aws_s3_bucket.my_bucket.bucket
}
