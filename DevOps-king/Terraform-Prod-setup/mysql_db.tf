resource "aws_db_instance" "rds_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "tf-testing"
  username             = "tf-user"
  password             = "tf-Testing@123"
  parameter_group_name = "default.mysql5.7"
  deletion_protection = "true"
  publicly_accessible = "false"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  
}