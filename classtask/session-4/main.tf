resource "aws_instance" "web" {
  // provider = aws.ohio // data argument
  count         = length(var.env)
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data     = file("./extras/userdata.sh")

  lifecycle { // inline block
    create_before_destroy = true
  }

  tags = { // inline block
    Name = "my-${var.env[count.index]}-instance"
  }
  vpc_security_group_ids = [aws_security_group.web.id]
}




/*
first iteration: count = 1, index = 0, dev
second iteration: count = 2, index = 1, qa
third iteration: count =3, index = 2, prod

variable "env" {
  type        = list(string)
  default     = ["dev", "qa", "prod"]
  description = "This is My Dev Environment"
}

**Meta arguments** - change /control the behavior of infrastructure creation
1. depends_on (explicit dependency)
2. provider = provider_name.alias
3. lifecycle = create_before_destroy, prevent_destroy etc
4. count = creates identical resources

index = location/position of the element in the list

terraform graph - command, shows dependency in console

Limitations of COUNT:
1. tied to INDEX
2. can be used only on the resource level

*/

