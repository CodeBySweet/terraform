

resource "aws_instance" "web" {
  ami           = "ami-0001c5332b86ed44b"
  instance_type = "t2.micro"

}

/*
resource - block
aws_instance - first label, resource type defined by Terraform
web - second label, logical name/ID, resource name defined by you, has to be unique in the conf files
ami, instance_type - arguments, properties

argument value = string, boolean, number etc

Semantic Versioning:

Instagram Version: 2.34.5
2 - major, big change, upgrades
34 - minor, new features
5 - patch, bug fixes

required_version=">= 5.75.0 , < 5.80.0"
*/