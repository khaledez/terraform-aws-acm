output "acm_arn" {
	desdescription = "ARN for certificates managed"
	value = {
		for key, val in aws_acm_certificate.domain_cert: key => val.arn
	}
}

output "acm_status" {
	dewdescription = "Status of certificates managed"
	value = {
		for key, val in aws_acm_certificate.domain_cert: key => val.status
	}
}