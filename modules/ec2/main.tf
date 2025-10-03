data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Public EC2 Instances
resource "aws_instance" "public" {
  count                  = var.public_instance_count
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.public.id]

  tags = {
    Name        = "${var.environment}-public-instance-${count.index + 1}"
    Environment = var.environment
    Type        = "public"
  }
}

# Private EC2 Instances
resource "aws_instance" "private" {
  count                  = var.private_instance_count
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private.id]

  tags = {
    Name        = "${var.environment}-private-instance-${count.index + 1}"
    Environment = var.environment
    Type        = "private"
  }
}

# Security Group for Public Instances
resource "aws_security_group" "public" {
  name        = "${var.environment}-public-sg"
  description = "Security group for public instances"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-public-sg"
    Environment = var.environment
  }
}

# Security Group for Private Instances
resource "aws_security_group" "private" {
  name        = "${var.environment}-private-sg"
  description = "Security group for private instances"
  vpc_id      = var.vpc_id

  ingress {
    description     = "SSH from public instances"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public.id]
  }

  ingress {
    description = "All traffic from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-private-sg"
    Environment = var.environment
  }
}