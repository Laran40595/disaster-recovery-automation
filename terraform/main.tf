resource "aws_instance" "dr_server" {

  ami           = "ami-0c02fb55956c7d316"

  instance_type = var.instance_type

  tags = {
    Name = "Disaster-Recovery-Server"
  }
}
