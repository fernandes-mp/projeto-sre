# resource "aws_route53_zone" "route53" {
#   name = "mp_leo"

#   vpc {
#     vpc_id = aws_vpc.vpc.id
#   }

# }

# resource "aws_route53_record" "route53_record" {
#   zone_id = aws_route53_zone.route53.id
#   name    = "elb"
#   type    = "CNAME"
#   ttl     = "900"
#   records = ["${aws_elb.loadbalance.dns}"]

# }