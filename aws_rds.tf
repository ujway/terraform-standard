#####################################
# DB Instance Settings
#####################################
resource "aws_db_instance" "app_db" {
  allocated_storage          = 20
  auto_minor_version_upgrade = true
  backup_retention_period    = 7
  backup_window              = "20:00-21:00"
  db_subnet_group_name       = "${aws_db_subnet_group.app_db_subnet_group.name}"
  engine                     = "postgres"
  engine_version             = "9.6.6"
  identifier                 = "${var.app_base_name}"
  instance_class             = "${var.app_db_instance_class}"
  multi_az                   = false
  name                       = "fastladder"
  parameter_group_name       = "${aws_db_parameter_group.app_db_parameter_group.name}"
  password                   = "${var.app_db_pass}"
  skip_final_snapshot        = true
  username                   = "${var.app_db_user}"

  vpc_security_group_ids = [
    "${aws_security_group.app_db_sg.id}",
  ]
}

resource "aws_db_parameter_group" "app_db_parameter_group" {
  name   = "${var.app_base_name}-app-parameter"
  family = "postgres9.6"
}

resource "aws_db_subnet_group" "app_db_subnet_group" {
  name       = "${var.app_base_name}-app-subnet"
  subnet_ids = [
    "${aws_subnet.public_subnet1.id}",
    "${aws_subnet.public_subnet2.id}",
  ]
}

resource "aws_db_instance" "job_db" {
  allocated_storage          = 20
  auto_minor_version_upgrade = true
  backup_retention_period    = 7
  backup_window              = "20:00-21:00"
  db_subnet_group_name       = "${aws_db_subnet_group.job_db_subnet_group.name}"
  engine                     = "mysql"
  engine_version             = "5.7.21"
  identifier                 = "${var.app_base_name}"
  instance_class             = "${var.job_db_instance_class}"
  multi_az                   = false
  name                       = "dbInstance"
  parameter_group_name       = "${aws_db_parameter_group.job_db_parameter_group.name}"
  password                   = "${var.job_db_pass}"
  skip_final_snapshot        = true
  username                   = "${var.job_db_user}"
  vpc_security_group_ids = [
    "${aws_security_group.job_db_sg.id}"
  ]
}

resource "aws_db_parameter_group" "job_db_parameter_group" {
  name   = "${var.app_base_name}-job-parameter"
  family = "mysql5.7"
}

resource "aws_db_subnet_group" "job_db_subnet_group" {
  name       = "${var.app_base_name}-job-subnet"
  subnet_ids = [
    "${aws_subnet.public_subnet1.id}",
    "${aws_subnet.public_subnet2.id}",
  ]
}
