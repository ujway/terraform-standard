#####################################
# Auto Scaling Settings
#####################################
//resource "aws_launch_configuration" "launch_configuration" {
//  associate_public_ip_address = true
//  depends_on                  = ["aws_internet_gateway.vpc_main_igw"]
//  iam_instance_profile        = "${aws_iam_instance_profile.iam_instance_profile.id}"
//  image_id                    = "${var.launch_configuration_image_id}"
//  key_name                    = "${var.key_name}"
//  instance_type               = "${var.launch_configuration_instance_type}"
//  security_groups             = ["${aws_security_group.app_sg.id}"]
//}
//
//resource "aws_autoscaling_group" "autoscaling_group" {
//  desired_capacity     = "${var.autoscaling_group_desired_capacity}"
//  health_check_type    = "EC2"
//  launch_configuration = "${aws_launch_configuration.launch_configuration.name}"
//  max_size             = "${var.autoscaling_group_max_size}"
//  min_size             = "${var.autoscaling_group_min_size}"
//  name                 = "${var.app_base_name}"
//
//  vpc_zone_identifier = [
//    "${aws_subnet.public_subnet1.id}",
//    "${aws_subnet.public_subnet2.id}"
//  ]
//}