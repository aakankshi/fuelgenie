resource "aws_lambda_function" "Fuelgenie_ForecourtFileRequestFunction" {
  # A unique name to give the lambda function.
  function_name = "Fuelgenie_ForecourtFileRequestFunction"
  
  #source code in an S3 bucket.
	s3_bucket = "repo-internal-fuelgenie"
	s3_key    = "forecourt-repo/latestversion-1.0.0.jar"
  
  # The entrypoint to the lambda function in the source code.
  handler       = "function.LatestVersion::handleRequest"
  
  # Use java8 for this lambda function.
  runtime       = "java8"
  
  # IAM (Identity and Access Management) policy for the lambda function.
  role          =  "${var.role_arn}"
  
  timeout       = 90

  vpc_config {		
	#subnet_ids         = ["${module.vpc.aws_subnet.test-tf-vpc-subnet1.id}" ]
	#security_group_ids = ["${module.vpc.aws_security_group.sg_for_lambda.id}"]
	
	subnet_ids         = ["${var.subnet-id-1}", "${var.subnet-id-2}", "${var.subnet-id-3}"]
	security_group_ids = [ "${var.security-group-id}" ]
	}
	  
   environment {
    variables = {
      db_name = "fuelgenietestdb",
      db_user : "admin",
      db_ro_instance = "aurora-cluster.cluster-cf32ky2br4gc.ap-south-1.rds.amazonaws.com",
      db_password : "admin123",
      forecourt_table_name : "forecourtfile",
      distribution_domain :  "d1an56niw1fq46.cloudfront.net",
      s3_folder : "forecourtdata",
      key_pair_id : "APKAJHSY6AX5WL56XN2A",          
      expiryofURLinmins = "2",
      secret_pem_key = "-----BEGIN RSA PRIVATE KEY-----,MIIEowIBAAKCAQEAnUQMqs8DJIaX0Z9kXCk/Nzhe0vsheG/D93tufud5GGz5/fhb,i/Lt3NkZWUvnWUWgZwyLj9wsxbWAipAoEGGxVgooKOTxmYLK/8c4LUJOpv+VS/EP,S91+jcSDMTo22DmyWLS09/Jsdd+oXCPGZQFEICqclKMyU21cmKkrY/7RXKhfGu5q,RMGnIoHOVXp1lx9CMB8h+CusEaCLOwN102XpobUs+BDmqwWUhruEvCL5GdJubJ6Y,6M5UjB7MJhKPJEhARTO/pWsG8heyqmVcB/2VoLGbOqoa6xgGPSxoZAS8oKICIHts,xY67z5tfJjCJChVBVi7o3bythKnVBd27HHlOowIDAQABAoIBADoel//YGXU6OIlD,urdElxQ1RPX70VbNF0My3pcPvHUGcS0mx85krPtdUDzsDEe1r53lyP4VhIZcmXCb,7fJ/6CXAAy95zL/K0nLMkTpIswCMnARAxkJnTQnfggyDUxl92SdnQSoQ8Xxud631,mrBhU2f/13YnCcZDOGFCw8JkvcLb8eQjY8w1aKIOIWKynFYPXvTwrWhY1dcNpia/,vMqNpqn/Ty/Z+/H6IT0G8qaq7Cxk1VLWyYd/HRf12G18I59+qnVxoDpANEcJS+Ao,WGUhkVsQ22KA4x/8CqXd4bdWfgga0LNA0IkcSwPkkNl44D6eh8lQU6EeiDCbA9ly,em5xC4ECgYEA2TDYr+GZJX1tI9X3yIDGlpo9Si+OwIw5K/uX6fyL34vFctLBN3Ms,9k4cYPv8TQLlV4ztJdfHhU7D7CeipNhNVhXUIEiqXgZd7cxC2vuHVo+isZAEOxHz,tMuzRHk0JBs6F6F7WxQ88ZS304oJ1eQJ2oa0z1UE8y/2D18ZCJLDlZECgYEAuV4A,KpmvfqYQ84wxuMqgqSwajoDMoUe5VqkutiLtpN+LbbbIA0/L5nwugvIxYY8HyqXl,fb0uKkbAjVhmr8lQQXKuVBtXnKAoAIzqDj7LqoiO0szkImLlYQYpyW1UBu08BZM8,Z1RsbKoWW2Pm1xdYJ7B8NCeUaTTVCnoY1YkJ9vMCgYA3VYuPW+HBvG/m9meXrL9r,tUYyNWWgRtl2DDaLBa25OYoHlAxoDS8CXao7R1fjYv59TMlKn+wUWZnu+7YjW3xw,l0UhKIJHTEX4BNdvpS+47QVdSbzaM9usT02P/3U6Ubl+NcUQ0loojmQ7P+r7lIqy,IynDvPxy3OBK0Ea3eXTdEQKBgD3dyq5tJq5dXJD8fGfRcPelWaOwBxvY5VmwE4AE,fk4lsdJHS9AXJNVjIt7fWG3YH+CZp9NkfXDstj02gOcwiFGfpeE6Uu5aYZ91aHSi,rrTW6NwgOA/l8+qC9RVeIMpDCWJO9r0B50IJLncIC7ZD+08bzwhVIWpPkL7zazBx,kVrTAoGBAMgky8hjlR3RJdtZJIVzTHolgsbRpmACjn7NFuIWUQRbCqyVUmCSUioM,kXxfl7qRKFMjYGduDzAjmrqkLnQcu9zUWEHHaxb1YVqhECBI0zD/7uBEIPiIXPA/,lSk8itQQ0YK5nE9nrE7SOuKVMQntw429cqNXSdIPDAfUF51azmvv,-----END RSA PRIVATE KEY-----"
    }
  }
  
}

output "ForecourtFileRequestFunction" {
  value = "${aws_lambda_function.Fuelgenie_ForecourtFileRequestFunction.function_name}"
}

output "ForecourtFileRequestFunction_arn" {
  value = "${aws_lambda_function.Fuelgenie_ForecourtFileRequestFunction.invoke_arn}"
}
