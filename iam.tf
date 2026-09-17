resource "aws_iam_role" "exercise_ha_project_iam" {
  name               = "exercise-ha-project-iam"
  description        = "getting iam role policy"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
EOF 
}

resource "aws_iam_role_policy" "ha_iam_role_policy" {
  name   = "ha-iam-role-policy"
  role   = aws_iam_role.exercise_ha_project_iam.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF

}

resource "aws_iam_instance_profile" "exercise_ha_iam" {
  name = "exercise-ha-iam"
  role = aws_iam_role.exercise_ha_project_iam.id
}