variable "ForecourtFileRequestFunction" {}
variable "ForecourtFileRequestFunction_arn" {}

variable "apiGatewayStageName" {
    description = "apiGatewayStageName."
    default = "test"
}

variable "QuotaLimit" {
    description = "QuotaLimit"
    default = "5000"
}

variable "ThrottleBurstLimit" {
    description = "ThrottleBurstLimit"
    default = "200"
}

variable "ThrottleRateLimit" {
    description = "The cidr for vpc."
    default = "100"
}


