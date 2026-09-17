resource "aws_launch_template" "exercise_ha_project_lt" {
  name          = "exercise-ha-project-lt"
  description   = "Launch template for ha project"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name


  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.exercise_ha_project_sg.id]
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size           = 20
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
    }
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.exercise_ha_iam.id
  }


  monitoring {
    enabled = true
  }

  user_data = filebase64("userdata.sh")


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "exercise-ha-project"
      Env  = "dev"
    }
  }

  tags = {
    Name = "exercise-ha-project"
  }
}

resource "aws_autoscaling_group" "exercise_ha_asg" {
  name_prefix         = "exercise-ha-asg-"
  min_size            = 3
  max_size            = 6
  desired_capacity    = 3
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.exercise_ha_project_lt.id
    version = "$Latest"
  }
  health_check_type         = "EC2"
  health_check_grace_period = 300
}