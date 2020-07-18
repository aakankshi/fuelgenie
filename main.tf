provider "aws" {
  region = "${var.region-name}"
}

module "iam" {
    source = "./iam"
}
 
module "lambda" {
    source = "./lambda"
	
	role_arn =  "${module.iam.role_arn}"
	vpc-id                      = "${module.vpc.id}"
    security-group-id           = "${module.vpc.security-group-id}"
    subnet-id-1                 = "${module.vpc.subnet1-id}"
    subnet-id-2                 = "${module.vpc.subnet2-id}"
	subnet-id-3                 = "${module.vpc.subnet3-id}"
}
 
module "api_gateway" {
    source = "./api_gateway"
	
	ForecourtFileRequestFunction = "${module.lambda.ForecourtFileRequestFunction}"
	ForecourtFileRequestFunction_arn = "${module.lambda.ForecourtFileRequestFunction_arn}"
}

module "vpc" {
    source = "./vpc"
}
 
module "aurora" {
    source = "./aurora"
	
	vpc-id                      = "${module.vpc.id}"
    security-group-id           = "${module.vpc.security-group-id}"
    subnet-id-1                 = "${module.vpc.subnet1-id}"
    subnet-id-2                 = "${module.vpc.subnet2-id}"
	subnet-id-3                 = "${module.vpc.subnet3-id}"
}
  