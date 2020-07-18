resource "aws_rds_cluster" "aurora-db" {
  cluster_identifier      = "aurora-cluster"
  availability_zones      = ["${var.region-name}a", "${var.region-name}b", "${var.region-name}c"]
  database_name           = "fuelgenietestdb"
  master_username         = "${var.rds_master_username}"
  master_password         = "${var.rds_master_password }"
  engine 	              = "aurora"
  engine_version          = "5.6.10a"
  engine_mode             = "serverless"
  db_subnet_group_name    = "${aws_db_subnet_group.aurora_subnet_group.name}"
  vpc_security_group_ids  = [ "${var.security-group-id}" ]
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  #allocated_storage       = 1
  
}


resource "aws_db_subnet_group" "aurora_subnet_group" {

    name          = "${var.environment_name}_aurora_db_subnet_group"
    description   = "Allowed subnets for Aurora DB cluster instances"
    subnet_ids    = ["${var.subnet-id-1}", "${var.subnet-id-2}", "${var.subnet-id-3}"]

    tags = {
        Name         = "${var.environment_name}-Aurora-DB-Subnet-Group"
        VPC          = "${var.vpc_name}"
        ManagedBy    = "terraform"
        Environment  = "${var.environment_name}"
    }

}