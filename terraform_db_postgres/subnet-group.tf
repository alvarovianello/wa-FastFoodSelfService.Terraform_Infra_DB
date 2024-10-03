resource "aws_db_subnet_group" "postgres-subnet-group" {
  name       = "${var.projectName}-db-subnet-group"
  subnet_ids = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.regionDefault}e"]

  tags = {
    Name = "postgres-subnet-group"
  }
}