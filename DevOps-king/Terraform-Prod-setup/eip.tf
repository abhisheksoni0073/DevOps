resource "aws_eip" "fasttrack" {

  instance = aws_instance.production-server.id
}