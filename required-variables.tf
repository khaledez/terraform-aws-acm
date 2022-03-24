variable "domains" {
  description = "Domains to apply settings for"
  type        = list(string)
}

variable "domain_aliases" {
  description = "Aliases for domains to be added to the certificate as SAN. The keys must match domains variable"
  type        = map(set(string))
}

variable "route53_zone_id" {
  description = "AWS Route53 hosted zone id"
  type        = string
}
