
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
  access_key = "AKIAZI2LE2Z6CLDSGQZ7"
  secret_key = "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"
  ami_name      = "ubuntu-22.04-s6peter"
  instance_type = "t2.micro"
  region        = "us-east-1"
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
    "Name"        = "ubuntu-22.04-s6peter"
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


