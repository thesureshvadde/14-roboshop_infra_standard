module "vpn_sg" {
  source = "../../13-terrafrom_aws_sg"
  sg_description = "allowing all prots from my laptop"
  sg_name = "roboshop-vpn"
  vpc_id = data.aws_vpc.default.id
  #ingress = var.ingress # create ingress rules separately.
  common_tags = var.common_tags
  project_name = var.project_name
}

resource "aws_security_group_rule" "vpn" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = module.vpn_sg.sg_id
}

# module "vpn_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   ami = data.aws_ami.ami_id.id
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [module.vpn_sg.sg_id]
#   tags = merge(
#     {
#         Name = "Roboshop-VPN"
#     },
#     var.common_tags
#   )
# }