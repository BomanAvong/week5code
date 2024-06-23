terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_lightsail_instance" "mycustominstance" {
  name              = "mynewcustom"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
   key_pair_name     = "amazonlinuxkp"
   tags = {
    team = "Developers"
    env = "dev"
    create_by = "terraform"
  }

}

output "my-public-ip" {
   value = aws_lightsail_instance.mycustominstance.public_ip_address
}

output "my-username" {
   value = aws_lightsail_instance.mycustominstance.username
}

output "my-keyname" {
   value = aws_lightsail_instance.mycustominstance.key_pair_name
}


