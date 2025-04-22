variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "image_uri" {
  description = "URI of the Docker image to deploy"
  type        = string
}