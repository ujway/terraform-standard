resource "aws_iam_role" "ec2" {
  assume_role_policy = <<-JSON
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        }
      }
    ]
  }
  JSON

  name = "${var.app_base_name}_ec2"
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "${var.app_base_name}"
  role = "${aws_iam_role.ec2.name}"
}