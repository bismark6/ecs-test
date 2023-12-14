resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/21"
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
      Name = "ecr-vpc"
    }
}

resource "aws_subnet" "private-a" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
      Name = "private-a"
    }
}

resource "aws_subnet" "private-b" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
      Name = "private-b"
    }
}

resource "aws_subnet" "private-c" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = true

    tags = {
      Name = "private-c"
    }
}

resource "aws_subnet" "private-d" {
    cidr_block = "10.0.3.0/24"
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1d"
    map_public_ip_on_launch = true
    tags = {
      Name = "private-d"
    }
}

resource "aws_subnet" "private-e" {
    cidr_block = "10.0.4.0/24"
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1e"
    map_public_ip_on_launch = true

    tags = {
      Name = "private-e"
    }
}

resource "aws_subnet" "private-f" {
    cidr_block = "10.0.5.0/24"
    vpc_id = aws_vpc.vpc.id
    availability_zone = "us-east-1f"
    map_public_ip_on_launch = true

    tags = {
      Name = "private-f"
    }
}

resource "aws_security_group" "sg" {
    name = "sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
        description = "https"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "rds" {
    name = "rds"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["47.206.54.62/32"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id 
    }
        tags = {
            Name = "public-test"
}
}
resource "aws_route_table_association" "route1" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.private-a.id
}

resource "aws_route_table_association" "route2" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.private-b.id
}

resource "aws_route_table_association" "route3" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.private-c.id
}

resource "aws_route_table_association" "route4" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.private-d.id
}

resource "aws_route_table_association" "route5" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.private-e.id
}

resource "aws_route_table_association" "route6" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.private-f.id
}
resource "aws_route_table" "rt-private" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id 
    }
        tags = {
            Name = "private-test"
}
}

resource "aws_flow_log" "example" {
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}