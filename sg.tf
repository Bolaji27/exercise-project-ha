resource "aws_security_group" "exercise_ha_project_sg" {
  name        = "exercise-ha-project-sg"
  description = "security group for ha project"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ssh_access" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.exercise_ha_project_sg.id
}

resource "aws_security_group_rule" "http_access" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.exercise_ha_project_sg.id
}

resource "aws_security_group_rule" "exerciseproject_outbound_access" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.exercise_ha_project_sg.id
}

