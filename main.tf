provider "heroku" {}

resource "heroku_app" "example" {
  name   = "thesis-test-iac-project"
  region = "us"
}

resource "heroku_addon" "postgres" {
  app  = heroku_app.example.id
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_build" "example" {
  app = heroku_app.example.id

  source {
    path = "./main"
  }
}

variable "app_quantity" {
  default     = 1
  description = "Number of dynos in your Heroku formation"
}

output "app_url" {
  value       = heroku_app.example.web_url
  description = "Application URL"
}

terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 4.6.0"
    }
  }

  required_version = ">= 0.14"
}


