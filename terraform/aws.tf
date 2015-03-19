provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_key_pair" "barc" {
  key_name = "barc"
  public_key = "${file(\"ssh/barc.pub\")}"
}

resource "aws_security_group" "barc-test" {
    name = "barc-test"
    description = "Allow All inbound traffic on Ubuntu Ports"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port =  80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "tomcat_barc" {
  instance_type = "t1.micro"
  ami = "${var.aws_ami}"
  count = 1
  key_name = "${aws_key_pair.barc.key_name}"
  security_groups = ["${aws_security_group.barc-test.name}"]
}

output "addressess" {
  value = "Public DNS Addresses: ${aws_instance.tomcat_barc.public_dns}"
}


