# https://www.terraform.io/docs/configuration/terraform.html#terraform-block-syntax.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # https://registry.terraform.io/providers/ovh/ovh.
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.25"
    }
  }

  # https://www.terraform.io/cli/cloud/settings#the-cloud-block.
  cloud {
    organization = "zerowastesgp"

    workspaces {
      name = "tf-dns-zerowastesgp-fr"
    }
  }
}
