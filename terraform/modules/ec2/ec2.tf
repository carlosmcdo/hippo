resource "aws_security_group" "sg" {
  name        = "${var.instance_name}-sg"
  description = "Security Group for EC2 ${var.instance_name} instance"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["189.120.76.129/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.instance_name}-sg" })
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  ebs_optimized          = var.ebs_optimized
  monitoring             = var.monitoring
  user_data = base64encode(templatefile("${path.root}/user_data.tpl", {
    bucket_name = var.bucket_name
  }))
  key_name             = var.key_pair
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  lifecycle {
    create_before_destroy = true
  }

  metadata_options {
    http_endpoint = "enabled"
  }

  tags = merge(var.tags, {
    Name = "${var.instance_name}-ec2"
  })
}

resource "aws_eip" "this" {
  instance = aws_instance.instance.id
  tags     = merge(var.tags, { Name = "${var.instance_name}-elastic-ip" })
}

resource "null_resource" "trigger_redeploy" {
  triggers = {
    html_md5 = filemd5(var.html_file_path)
  }
}
