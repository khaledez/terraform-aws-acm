locals {
  domains_product = merge({ for domain in var.domains : domain => [domain, 0] },
  { for tuple in chunklist(flatten([for key, val in var.domain_aliases : setproduct(val, setproduct([key], range(1, 1 + length(val)))) if length(val) > 0]), 3) : tuple[0] => slice(tuple, 1, 3) })

  domain_alias_map = { for key, val in var.domain_aliases : key => concat([key], tolist(val)) }
}