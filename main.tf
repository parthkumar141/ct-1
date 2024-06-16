//vpc has been created through ui
data "aws_vpc" "existing_vpc" {
  id = "vpc-0df5066ec2d11c46a" 
}


data "aws_subnet" "subnet1" {
  id = "subnet-08079ca45b9540514" 
}

data "aws_subnet" "subnet2" {
  id = "subnet-04f443d54a1a2eb7d"  
}

resource "aws_security_group" "instance_sg" {
  vpc_id = data.aws_vpc.existing_vpc.id

  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "parth" {
  ami           = "ami-08a0d1e16fc3f61ea" 
  instance_type = "t2.micro"
  subnet_id     =  "subnet-08079ca45b9540514" 
  key_name      = "parthbox"  
  security_groups = [aws_security_group.instance_sg.id]

 
  
}


output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
