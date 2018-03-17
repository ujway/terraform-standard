#####################################
# Variable Settings
#####################################
#AWS Settings
variable "account_id" {}
variable "access_key" {}
variable "secret_key" {}
variable "region" {}

#App Name
variable "app_identity_name" {}
variable "app_base_name" {}

#Segment Settings
variable "root_segment" {}
variable "public_segment1" {}
variable "public_segment2" {}

#AZ Settings
variable "public_segment1_az" {}
variable "public_segment2_az" {}

#SG Settings
variable "ssh_allow_ip" {}

#DB Settings
variable "db_user" {}
variable "db_pass" {}
variable "db_instance_class" {}

#S3 Settings
variable "s3_bucket_tag" {}

#Instance Settings
variable "instance_image_id" {}
variable "api_instance_class" {}
variable "batch_instance_class" {}
variable "job_instance_class" {}

#App Settings
variable "secret_key_base" {}
variable "key_name" {}
variable "autoscaling_group_desired_capacity" {}
variable "autoscaling_group_max_size" {}
variable "autoscaling_group_min_size" {}
variable "launch_configuration_image_id" {}
variable "launch_configuration_instance_type" {}
