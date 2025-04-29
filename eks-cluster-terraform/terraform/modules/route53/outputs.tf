output "zone_id" {
  description = "Route53 Hosted Zone ID"
  value       = data.aws_route53_zone.this.zone_id
}

output "zone_name" {
  description = "Route53 Hosted Zone Name"
  value       = data.aws_route53_zone.this.name
}
