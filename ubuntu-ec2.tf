resource "aws_instance" "devops-ready-ec2"{
    ami = var.ami
    instance_type = var.instance_type
    user_data = file("devops-env.sh")
    iam_instance_profile = aws_iam_instance_profile.devops-ec2-profile.name
    tags = {
    Name = "devops-ready-ubuntu-machine"
  }    
}