locals {
  zone = "zerowastesgp.fr"

  dns_records = [
    {
      name = ""
      type = "NS"
      ttl  = 0,
      targets = [
        "dns100.ovh.net.",
        "ns100.ovh.net.",
      ]
    },
  ]
}

module "dns_records" {
  source = "./modules/ovh-dns"

  ovh_application_key    = var.ovh_application_key
  ovh_application_secret = var.ovh_application_secret
  ovh_consumer_key       = var.ovh_consumer_key
  ovh_endpoint           = var.ovh_endpoint

  zone    = local.zone
  records = local.dns_records
}
