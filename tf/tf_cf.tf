resource "aws_cloudformation_stack" "network" {
  name = "networking-stack"

  parameters = {
    VPCCidr = "172.31.0.0/16"
  }

  template_body = <<STACK
{
  "Parameters" : {
    "VPCCidr" : {
      "Type" : "String",
      "Default" : "172.31.0.0/16",
      "Description" : "Enter the CIDR block for the VPC. Default is 172.31.0.0/16."
    }
  },
  "Resources" : {
    "myVpc": {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : { "Ref" : "VPCCidr" },
        "Tags" : [
          {"Key": "Name", "Value": "Primary_CF_VPC"}
        ]
      }
    }
  }
}
STACK
}


resource "aws_cloudformation_stack" "example" {
  name = "example"
  parameters = {
    VpcId = var.vpc_id
  }
  template_body = file("${path.module}/example.yml")
}












