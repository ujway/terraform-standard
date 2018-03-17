resource "aws_iam_role" "ec2" {
  assume_role_policy = "${file("policies/iam_ec2_policy.json")}"
  name = "${var.app_base_name}RoleEC2"
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "${var.app_base_name}"
  role = "${aws_iam_role.ec2.name}"
}