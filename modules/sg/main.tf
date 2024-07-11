resource "aws_security_group" "test_security_group" {
  name        = "${var.env}-test-security-group"
  description = "${var.env} test security group"
  vpc_id      = "vpc-0c21f52489116cbd6"

  tags = {
    Name = "${var.env}-test-security-group"
  }
}