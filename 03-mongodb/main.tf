module "mongodb_sg" {
  source = "../../13-terrafrom_aws_sg"
  sg_description = "Allowing traffic"
  sg_name = "mongodb"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = var.common_tags
  project_name = var.project_name
}

resource "aws_security_group_rule" "mongodb_vpn" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
  source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value
  security_group_id = module.mongodb_sg.sg_id
}

# module "mongodb_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.ami_id.id
#   instance_type = "t3.medium"
#   vpc_security_group_ids = [module.mongodb_sg.sg_id]
#   subnet_id = element(split(",", data.aws_ssm_parameter.database_subnet_ids.value), 0)
#   user_data = file("mongodb.sh")
#   tags = merge(
#     {
#         Name = "Roboshop-VPN"
#     },
#     var.common_tags
#   )
# }