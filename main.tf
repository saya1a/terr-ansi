provider "aws" {
    shared_credentials_files = ["/home/sateesh/.aws/credentials"]
    profile = "default"
    region = "us-east-1"
}


#ec2 provision
resource aws_instance "test-instance" {
    ami           = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0088786e83e38b36a"]
    key_name      = "ansi-key"

    tags = {
    Name = "Test-EC2"
  }
}
