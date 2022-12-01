require 'aws-sdk-s3'

Aws.config.update(
  access_key_id: ENV['S3_KEY'],
  secret_access_key: ENV['S3_SECRET'],
)