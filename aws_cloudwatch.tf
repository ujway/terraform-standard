#####################################
# Cloud Watch Settings
#####################################
resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "${var.app_base_name}"
}
