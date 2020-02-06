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
    {
      name = ""
      type = "MX"
      ttl  = 0,
      targets = [
        "1 redirect.ovh.net.",
      ]
    },
    {
      name = ""
      type = "A"
      ttl  = 0,
      targets = [
        "213.186.33.5",
      ]
    },
    {
      name = ""
      type = "TXT"
      ttl  = 0,
      targets = [
        "\"1|www.zerowastesgp.fr\"",
      ]
    },
    {
      name = ""
      type = "SPF"
      ttl  = 600,
      targets = [
        "\"v=spf1 include:mx.ovh.com ~all\"",
      ]
    },
    {
      name = "autoconfig"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "mailconfig.ovh.net.",
      ]
    },
    {
      name = "autodiscover"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "mailconfig.ovh.net.",
      ]
    },
    {
      name = "_autodiscover._tcp"
      type = "SRV"
      ttl  = 0,
      targets = [
        "0 0 443 mailconfig.ovh.net.",
      ]
    },
    {
      name = "imap"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "_imaps._tcp"
      type = "SRV"
      ttl  = 0,
      targets = [
        "0 0 993 ssl0.ovh.net.",
      ]
    },
    {
      name = "mail"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "pop3"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "smtp"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "_submission._tcp"
      type = "SRV"
      ttl  = 0,
      targets = [
        "0 0 465 ssl0.ovh.net.",
      ]
    },
    {
      name = "www"
      type = "TXT"
      ttl  = 0,
      targets = [
        "\"3|welcome\"",
      ]
    },
    {
      name = "www"
      type = "TXT"
      ttl  = 0,
      targets = [
        "\"l|fr\"",
      ]
    },
    {
      name = "www"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "zerowastesgp.fr.",
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
