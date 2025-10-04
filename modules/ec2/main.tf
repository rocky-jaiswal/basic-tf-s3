resource "aws_key_pair" "main" {
  key_name   = "main-key"
  public_key = var.public_ssh_key
}

resource "aws_instance" "public" {
  count         = var.public_instance_count
  ami           = "ami-099dfee16f9ed13df"
  instance_type = "t3.micro"

  subnet_id              = var.public_subnet_ids[0]
  key_name               = aws_key_pair.main.key_name

  associate_public_ip_address = true

  tags = {
    Name = "public-instance-${count.index + 1}"
  }
}

resource "aws_instance" "private" {
  count         = var.private_instance_count
  ami           = "ami-099dfee16f9ed13df"
  instance_type = "t3.micro"

  subnet_id              = var.private_subnet_ids[1]
  key_name               = aws_key_pair.main.key_name

  associate_public_ip_address = false # stays private

  tags = {
    Name = "private-instance-${count.index + 1}"
  }
}