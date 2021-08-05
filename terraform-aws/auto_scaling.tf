# resource "aws_launch_configuration" "lc_clientes" {
#   name_prefix     = "api_clientes"
#   image_id        = "ami-0ff1a2e7a1c4ba6a2"
#   key_name        = var.key_name
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.apis.id]
#   user_data       = data.template_file.dns_names.rendered

# }

# resource "aws_launch_configuration" "lc_catalogo" {
#   name_prefix     = "api_catalogo"
#   image_id        = "ami-0fc1f544c08188c01"
#   key_name        = var.key_name
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.apis.id]
#   user_data       = data.template_file.dns_names.rendered
# }

# resource "aws_launch_configuration" "lc_inventario" {
#   name_prefix     = "api_inventario"
#   image_id        = "ami-076e76b20f46cc31f"
#   key_name        = var.key_name
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.apis.id]
#   user_data       = data.template_file.dns_names.rendered
# }

# data "template_file" "dns_names" {
#   template = file("/home/marcos/Projeto SRE/terraform-aws/deployment.tpl")
#   vars = {
#     db_endpoint    = "${aws_db_instance.database.address}"
#     lb_dns_address = "${aws_lb.Loadbalancer.dns_name}"
#     username       = "${var.user}"
#     password       = "${var.password}"
#   }
# }

# # 3 Auto Scaling
# resource "aws_autoscaling_group" "asg_clientes-mpleo" {
#   name                = "api_clientes-mpleo"
#   desired_capacity    = 2 # Instâncias desejadas
#   max_size            = 4 # Máximo instâncias
#   min_size            = 2 # Mínimo instâncias
#   vpc_zone_identifier = [aws_subnet.private_app_a.id, aws_subnet.private_app_c.id]

#   launch_configuration = aws_launch_configuration.lc_clientes.name

#   health_check_grace_period = 300
#   health_check_type         = "ELB" # Cria os alarmes de instrução
#   target_group_arns         = [aws_lb_target_group.my_alb_target_group1.arn]

#   tag {
#     key                 = "Name"
#     value               = "mp_leo-api_clientes"
#     propagate_at_launch = true
#   }

# }

# resource "aws_autoscaling_group" "asg_catalogo-mpleo" {
#   name                = "api_catalogo-mpleo"
#   desired_capacity    = 2 # Instâncias desejadas
#   max_size            = 4 # Máximo instâncias
#   min_size            = 2 # Mínimo instâncias
#   vpc_zone_identifier = [aws_subnet.private_app_a.id, aws_subnet.private_app_c.id]

#   launch_configuration = aws_launch_configuration.lc_catalogo.name

#   health_check_grace_period = 300
#   health_check_type         = "ELB" # Cria os alarmes de instrução
#   target_group_arns         = [aws_lb_target_group.my_alb_target_group2.arn]

#   tag {
#     key                 = "Name"
#     value               = "mp_leo-api_catalogo"
#     propagate_at_launch = true
#   }

# }

# resource "aws_autoscaling_group" "asg_inventario-mpleo" {
#   name                = "api_inventario-mpleo"
#   desired_capacity    = 2 # Instâncias desejadas
#   max_size            = 4 # Máximo instâncias
#   min_size            = 2 # Mínimo instâncias
#   vpc_zone_identifier = [aws_subnet.private_app_a.id, aws_subnet.private_app_c.id]

#   launch_configuration = aws_launch_configuration.lc_inventario.name

#   health_check_grace_period = 300
#   health_check_type         = "ELB" # Cria os alarmes de instrução
#   target_group_arns         = [aws_lb_target_group.my_alb_target_group3.arn]

#   tag {
#     key                 = "Name"
#     value               = "mp_leo-api_inventario"
#     propagate_at_launch = true
#   }

# }