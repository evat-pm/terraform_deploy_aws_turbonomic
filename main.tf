provider "aws" {
  #access_key = "${var.aws_access_key}"
  #secret_key = "${var.aws_secret_key}"
  region = "${var.region}" # Channge in variables.tf file
}

# Create a Security Group with rules to allow inboud HTTPS and SSH and all allowed outbound
resource "aws_security_group" "https-ssh-sg" {
  name        = "allow_https_ssh"
  description = "Turbonomic Security Group to allow HTTPS and SSH"

  # Please restrict your ingress to only necessary IPs and ports.
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Please restrict your ingress to only necessary IPs and ports.
  # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Deploy the Turbonomic Image
resource "aws_instance" "turbonomic_aws" {
  ami             = "${var.turbo_ami_id}"
  instance_type   = "m5.xlarge"
  security_groups = ["${aws_security_group.https-ssh-sg.name}"]
  key_name        = "${var.key_pair}"                           #Define key pair name in variables.tf file

  tags {
    Name  = "Turbonomic_tf ${count.index}"
    Owner = "JBD"
  }
}

# output instance ID (default password)

output "Turbonomic_URL" {
  value       = "https://${aws_instance.turbonomic_aws.public_ip}"
  description = "The Public IP address of the Turbonomic server instance"
}

output "Turbonomic_administrator_password" {
  value       = "${aws_instance.turbonomic_aws.id}"
  description = "The Turbonomic instance ID - use as password for administrator user"
}
