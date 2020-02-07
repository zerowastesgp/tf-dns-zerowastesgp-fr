locals {
  zone = "zerowastesgp.fr"

  dns_records = [
    # -------------------------------------------------- #
    # DNS zone configuration
    # -------------------------------------------------- #
    {
      name = ""
      type = "NS"
      ttl  = 0,
      targets = [
        "dns100.ovh.net.",
        "ns100.ovh.net.",
      ]
    },
    # See https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain.
    {
      name = ""
      type = "A"
      ttl  = 0,
      targets = [
        "185.199.108.153",
        "185.199.109.153",
        "185.199.110.153",
        "185.199.111.153",
      ]
    },
    # https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site#configuring-a-subdomain.
    {
      name = "www"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "zerowastesgp.github.io.",
      ]
    },
    # -------------------------------------------------- #
    # Email configuration
    # -------------------------------------------------- #
    {
      name = ""
      type = "MX"
      ttl  = 0,
      targets = [
        "1 redirect.ovh.net.",
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
      name = "imap"
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
      name = "_autodiscover._tcp"
      type = "SRV"
      ttl  = 0,
      targets = [
        "0 0 443 mailconfig.ovh.net.",
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
      name = "_submission._tcp"
      type = "SRV"
      ttl  = 0,
      targets = [
        "0 0 465 ssl0.ovh.net.",
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
    # -------------------------------------------------- #
    # Domain verification
    # -------------------------------------------------- #
    {
      name = "_github-challenge-zerowastesgp"
      type = "TXT"
      ttl  = 0,
      targets = [
        "\"c50ef36f27\"",
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
