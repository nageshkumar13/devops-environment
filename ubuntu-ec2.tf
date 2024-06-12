resource "aws_instance" "myImage-ec2"{
    ami = var.ami
    instance_type = var.instance_type
    user_data = file("serverfile.sh")
    iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
    tags = {
    Name = "ec2-from-myImage"
  }    
}