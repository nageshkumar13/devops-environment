resource "aws_instance" "devops-ready-ec2"{
    ami = var.ami
    instance_type = var.instance_type
    user_data = file("devops-env.sh")
    iam_instance_profile = aws_iam_instance_profile.devops-ec2-profile.name
    
    tags = {
      Name = "devops-ready-ubuntu-machine"
      Environment = "dev"
      Project = "operations"
      Create_date_time = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())
      Team = "double-disgits"      
    }
    lifecycle { ignore_changes = [tags["Create_date_time"] ]}

}