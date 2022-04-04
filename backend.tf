terraform {
    required_providers {
        docker = {
            source = "alpine/docker"
            version = "3.14"
        }
    }


backend "remote" {
    hostname     = "app.terraform.io"
    organization = "fuerzastudio"

    workspaces {
        prefix  = "event-driven-system-infrastructure-"

    }
  }
}