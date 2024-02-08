
packer {
  required_version = ">= 1.10.0"
  required_plugins {
    amazon = {
      version = "1.2.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}




source "amazon-ebs" "ubuntu" {
 
  ami_name      = "tia-homework-s6peter"
  instance_type = "t2.micro"
  region        = "us-east-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/*ubuntu-*22.04-amd64-server*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  ssh_username = "ubuntu"
  tags = {
    "Name"        = "tia-homework-s6peter"
    "Created-by"  = "s6peter"
  }
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "file" {
    source      = "./shell-scripts/script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "shell" {
    inline = [
      "sudo chmod +x /tmp/script.sh",
      "sudo bash /tmp/script.sh"
    ]
  }
}


