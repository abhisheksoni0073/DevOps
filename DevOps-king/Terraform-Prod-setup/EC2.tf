resource "aws_instance" "production-server" {
    
    ami = data.aws_ami.ubuntu18.id
    instance_type = "t3.micro"
    instance_initiated_shutdown_behavior = "stop"
    key_name = aws_key_pair.production.key_name
    vpc_security_group_ids = [aws_security_group.ec2.id]

    root_block_device {
        volume_size = 20
        volume_type = "gp2"
        delete_on_termination = true
    }

    tags = {
    Type = "Production"
    }
}