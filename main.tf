resource "aws_route53_record" "cert_validation" {
  for_each = local.domains_product
  name     = element(tolist(aws_acm_certificate.domain_cert[each.value[0]].domain_validation_options), each.value[1]).resource_record_name
  type     = element(tolist(aws_acm_certificate.domain_cert[each.value[0]].domain_validation_options), each.value[1]).resource_record_type
  zone_id  = data.aws_route53_zone.primary.id
  records  = [element(tolist(aws_acm_certificate.domain_cert[each.value[0]].domain_validation_options), each.value[1]).resource_record_value]
  ttl      = 60
}

resource "aws_acm_certificate_validation" "validate_cert" {
  for_each                = toset(var.domains)
  certificate_arn         = aws_acm_certificate.domain_cert[each.value].arn
  validation_record_fqdns = [for domain in local.domain_alias_map[each.value] : aws_route53_record.cert_validation[domain].fqdn]
}

resource "aws_acm_certificate" "domain_cert" {
  for_each    = toset(var.domains)
  domain_name = each.value

  subject_alternative_names = var.domain_aliases[each.value]

  validation_method = "DNS"
  tags              = var.tags

  lifecycle {
    create_before_destroy = true
  }
}
