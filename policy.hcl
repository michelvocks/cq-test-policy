policy "cq-test-policy" {
  description = "Test Policy"
  configuration {
    provider "aws" {
      version = ">= 1.0"
    }
  }

  query "check-owner-tag" {
    description = "Checks if owner tag is missing"
    query = "SELECT * FROM aws_ec2_instances WHERE tags->>'Owner' IS NULL"
  }

  policy "check-security-tag" {
    description = "Checks if security tag is missing"
    query "check-security-tag" {
      query = "SELECT * from aws_ec2_instances WHERE tags->>'Security' IS NULL"
    }
  }
}

