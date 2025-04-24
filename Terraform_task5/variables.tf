variable "app_keys" {
  description = "Strapi APP_KEYS (comma-separated)"
  type        = string
}

variable "admin_jwt_secret" {
  description = "Strapi ADMIN_JWT_SECRET"
  type        = string
}

variable "allowed_hosts" {
  description = "Allowed host for Strapi (e.g. ALB DNS name)"
  type        = string
}
