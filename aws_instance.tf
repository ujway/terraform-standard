#####################################
# Instance Settings
#####################################
resource "aws_instance" "api" {
  ami           = "${var.instance_image_id}"
  instance_type = "${var.app_instance_class}"
  monitoring    = true
  key_name      = "${var.key_name}"
  // TODO associate elastic ip

  tags {
    Name = "api"
  }
}

resource "aws_instance" "batch" {
  ami           = "${var.instance_image_id}"
  instance_type = "${var.batch_instance_class}"
  monitoring    = true
  key_name      = "${var.key_name}"
  // TODO associate elastic ip

  tags {
    Name = "batch"
  }
}

resource "aws_instance" "job" {
  ami           = "${var.instance_image_id}"
  instance_type = "${var.job_instance_class}"
  monitoring    = true
  key_name      = "${var.key_name}"
  // TODO associate elastic ip

  tags {
    Name = "job"
  }
}
