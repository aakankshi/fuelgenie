# Created an IAM role for the lambda function
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_role_policy" "iam_for_lambda_policy" {
  name = "iam_for_lambda_policy"
  role = aws_iam_role.iam_for_lambda.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
		  "logs:CreateLogGroup",
	      "logs:CreateLogStream",
	      "logs:PutLogEvents",
	      "ec2:CreateNetworkInterface",
	      "ec2:DescribeNetworkInterfaces",
	      "ec2:DeleteNetworkInterface"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}



output "role_arn" {
  value = "${aws_iam_role.iam_for_lambda.arn}"
}
