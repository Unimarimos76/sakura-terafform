resource "sakuracloud_disk"{
  name = "disk1"
  source_archive_id = "${date.sakuracloud_archive.centos.id}"
}

data sakuracloud_archive "centos" {
  os_type = "centos"
}

resource "sakuracloud_server" "server01" {
  name = "server01"
  disks = "server01"
  tags = ["@virtio-net-pci"]
  password = "password"
}
