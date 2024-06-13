# This resource creates an IAM role with the necessary permissions for SSM access of ec2.

resource "aws_iam_role" "iam-for-ec2-ssm-access-devops" {
  name               = "iam-for-ec2-ssm-access-devops"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [       
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"   
        },
        "Effect": "Allow",
        "Sid": ""       
      }         
    ]           
  }   
EOF        
}

# Role - Policy Attachment
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role        = aws_iam_role.iam-for-ec2-ssm-access-devops.name
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

# Role - Policy Attachment
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role1" {
  role        = aws_iam_role.iam-for-ec2-ssm-access-devops.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Create the aws_iam_instance_profile role from the aws_iam_role

resource "aws_iam_instance_profile" "devops-ec2-profile" {
    name = "ssm-devops-ec2-profile"
    role = aws_iam_role.iam-for-ec2-ssm-access-devops.name
}

