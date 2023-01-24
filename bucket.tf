provider "aws" {

    access_key = "AKIASBNXNVVXXXEWMPXP"

    secret_key = "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"

    region = "us-east-1"

}

# creation of bucket
resource "aws_s3_bucket" "b1" {

    bucket = "terraformb"  # bucket name
    acl = "public-read" 
      

}

# Upload an object
resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.b1.id

  key    = "login" #file name

  acl    = "public-read"  # or can be "private"

  source = "login/login.html" #path of file from local machine
  etag=filemd5("login/login.html")
 }