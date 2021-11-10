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
    # See https://docs.netlify.com/domains-https/custom-domains/configure-external-dns/#configure-an-apex-domain.
    {
      name = ""
      type = "A"
      ttl  = 0,
      targets = [
        "104.198.14.52",
      ]
    },
    # See https://docs.netlify.com/domains-https/custom-domains/configure-external-dns/#configure-a-subdomain.
    {
      name = "www"
      type = "CNAME"
      ttl  = 0,
      targets = [
        "zerowaste-sgp-www.netlify.app.",
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

  zone    = local.zone
  records = local.dns_records
}
