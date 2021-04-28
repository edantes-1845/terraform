provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "example" {
  ami = "ami-0121ef35996ede438"
  instance_type = "t2.micro"

  tags = {
    "Name" = "test-1"
  }

}

