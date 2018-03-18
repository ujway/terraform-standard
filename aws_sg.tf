#####################################
# Security Group Settings
#####################################
resource "aws_security_group" "alb_sg" {
  name = "${var.app_identity_name}_ALB_SG"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "${var.app_identity_name} ALB SG"
}

resource "aws_security_group" "app_sg" {
  name = "${var.app_identity_name}_APP_SG"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    security_groups = ["${aws_security_group.alb_sg.id}"]
  }
  // for debug
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["${var.ssh_allow_ip}"]
  }
  // for debug
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.ssh_allow_ip}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "${var.app_identity_name} APP SG"
}

resource "aws_security_group" "app_db_sg" {
  name = "${var.app_identity_name}_APP_DB_SG"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    security_groups = ["${aws_security_group.app_sg.id}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "${var.app_identity_name} DB SG"
}

resource "aws_security_group" "job_sg" {
  name = "${var.app_identity_name}_JOB_SG"
  vpc_id = "${aws_vpc.vpc_main.id}"
  // for debug TODO check we should attach internet gateway directory?
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["${var.ssh_allow_ip}"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.ssh_allow_ip}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "${var.app_identity_name} JOB SG"
}

resource "aws_security_group" "job_db_sg" {
  name = "${var.app_identity_name}_JOB_DB_SG"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    security_groups = ["${aws_security_group.job_sg.id}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "${var.app_identity_name} JOB DB SG"
}