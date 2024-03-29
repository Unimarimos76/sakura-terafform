# resource "sakuracloud_server" "server01" {
#     name = "server01"
#     disks =  ["${sakuracloud_disk.disk01.id}"]
#     tags = ["@virtio-net-pci"]
#     description = "by Terraform"
#     disable_pw_auth   = true

# }

# resource "sakuracloud_disk" "disk01" {
#     name = "disk31"
#     source_archive_id = "${data.sakuracloud_archive.centos.id}"
#     ssh_key_ids = ["${sakuracloud_ssh_key.terraform.id}"]
#     disable_pw_auth = true
#     description = "by Terraform"
# }

# data "sakuracloud_archive" "centos" {
#     os_type = "centos"

# }
# resource "sakuracloud_ssh_key" "terraform" {
#     name = "terraform-sshkey"
#     public_key = "${file("~/.ssh/id_rsa.pub")}"
#     description = "by Terraform"
# }

resource "sakuracloud_disk" "disk01"{
  name = "disk1"
  source_archive_id = "${data.sakuracloud_archive.centos.id}"
}

data sakuracloud_archive "centos" {
  os_type = "centos"
}

resource "sakuracloud_server" "server01" {
  name = "server01"
  disks = ["${sakuracloud_disk.disk01.id}"]
  tags = ["@virtio-net-pci"]
  password = "password"
}