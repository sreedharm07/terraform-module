resource "aws_instance" "instances" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_id]

  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "dns" {
  zone_id = "Z07380001ED1GOXY0KMLD"
  name    = "${var.name}-dev.cloudev7.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances.private_ip]
}
