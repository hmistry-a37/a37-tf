data "aws_route53_zone" "this" {
  zone_id = var.route53_zone_id
}
