######
#
#   Create RDS instance for postgres
#
####



provider "aws" {
  # Configuration options
  region  = "us-east-1"
  profile = "terraform"
}

resource "random_string" "rds_password" {
  length = 12
  special = true
  override_special = "!#&$"
}

resource "aws_ssm_parameter" "rds_password" {
    name = "/prod/db_password"
    description = "Main DB password"
    type = "SecureString"
    value = random_string.rds_password.result
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "rds" {
  vpc_id      = data.aws_vpc.default.id
  name        = "psql"
  description = "Allow all inbound for Postgres"
ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds" {
  identifier             = "db"
  db_name                   = "dbprod"
  instance_class         = "db.m5.large"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.5"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds.id]
  username               = "administrator"
  password               = aws_ssm_parameter.rds_password.value
  apply_immediately      = true
  publicly_accessible    = true
}

output "rds_password" {
  value = random_string.rds_password.result
}