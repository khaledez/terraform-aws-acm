module "acm" {
  source  = "khaledez/acm"
  domains = ["example.org"]
  domain_aliases = {
    "example.org" = ["www.example.org"]
  }
  dns_zone_domain = "example.org."
}
