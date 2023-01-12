tags = {
  env     = "dev"
  project = "fargate"
  region  = "us-east-1"
}

vpc_cidr = "10.0.0.0/16"

public_subnet_settings = {
  subnet_cidr_a       = "10.0.0.0/24"
  availability_zone_a = "us-east-1a"
  subnet_cidr_b       = "10.0.1.0/24"
  availability_zone_b = "us-east-1b"
}

private_subnet_settings = {
  subnet_cidr_a       = "10.0.2.0/24"
  availability_zone_a = "us-east-1a"
  subnet_cidr_b       = "10.0.3.0/24"
  availability_zone_b = "us-east-1b"
}
