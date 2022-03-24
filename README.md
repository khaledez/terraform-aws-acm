# Terraform AWS ACM Module

Create AWS Certificate Manager resources with easy defaults like aliases


## Usage

```terraform
module "acm" {
  source          = "khaledez/acm/aws"
  domains         = ["example.org"]
  domain_aliases  = {
		"example.org" = ["www.example.org"]
	}
  route53_zone_id = aws_route53_zone.primary.id
}
```