require 'aws-sdk-s3'

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['S3_KEY'], ENV['S3_SECRET'])
})
