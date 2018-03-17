#####################################
# Provision Settings
#####################################
// resource "null_resource" "batch_provisioning" {
//   triggers {
//     endpoint = "${aws_instance.api.endpoint}"
//   }
//
//   provisioner "remote-exec" {
//     connection {
//       type        = "ssh"
//       host        = "${aws_instance.api.public_dns}"
//       user        = "ec2_user"
//       // TODO どうやって知る？
//       private_key = "${file("credentials/batch.pem")}"
//     }
//
//     // TODO setup commands here
//     inline = [
//       "hoge"
//     ]
//   }
// }
