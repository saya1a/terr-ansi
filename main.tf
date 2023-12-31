provider "aws" {
    shared_credentials_files = ["/home/jenkins-agent/.aws/credentials"]
    profile = "default"
    region = "us-east-1"
}


#ec2 provision
resource aws_instance "test-instance" {
    ami           = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0088786e83e38b36a"]
    key_name      = "ansi-key"
    
    user_data = <<-EOF
    #!/bin/bash
    mkdir -p /home/ubuntu/.ssh
    echo "$(cat /home/jenkins-agent/.ssh/id_rsa.pub)" >> /home/ubuntu/.ssh/authorized_keys
    chmod 600 /home/ubuntu/.ssh/authorized_keys
    chmod 700 /home/ubuntu/.ssh
    chown -R ubuntu:ubuntu /home/ubuntu/.ssh
  EOF

    tags = {
    Name = "Test-EC2"
  }
}
