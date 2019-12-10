# AWS credentials based on OS Environment variables defined with 'aws configure'

#variable "aws_access_key" {}
#variable "aws_secret_key" {}

variable "region" {
  description = "AWS Region in which Turbonomic will be deployed to"
  type        = "string"
  default     = "us-east-1"                                          #if  changing region, esnure to change Turbonomic AMI ID below
}

variable "key_pair" {
  default = "mysshkeypair" #change to desired SSH keypair name in the selected region
}

variable "turbo_ami_id" {
  description = "Turbonomic AMI ID for AWS Region in which Turbonomic will be deployed to"
  default     = "ami-0e12cbc0f13977f68"                                                    # if changing region, ensure to change AMI ID of Turbonomic for the region
}

/// Turbonomic 6.3.1 Regions and AMI ID listing sample:
# Canada (Central) = ca-central-1 = ami-0689b281442fd1272
# US East (Ohio) = us-east-2 = ami-0aa58dffe94eb4b0b
# US West (N. California) = us-west-1 = ami-09dd5ca60bc5e934a
# Asia Pacific (Mumbai)	= ap-south-1 = ami-0256111d95ba7a2fd
# Asia Pacific (Tokyo) = ap-northeast-1 = ami-069b03aa412c2f39e
# EU (Frankfurt) = eu-central-1 = ami-085b97daf9bf17332
# EU (London) = eu-west-2 = ami-07f6f0b24cef77bc3
# South America (São Paulo) = sa-east-1 = ami-0ad5f28a181e4d465
# Asia Pacific (Sydney) = ap-southeast-2 = ami-0632485f5c1468f11

