terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "app_config" {
  filename = "${var.environment}_environment/app_config.json"

  content = jsonencode({
    application = var.app_name
    environment = var.environment
  })
}

resource "local_file" "env_info" {
  filename = "${var.environment}_environment/env_info.txt"
  content  = "Environment ${var.environment} created for ${var.app_name}"
}
