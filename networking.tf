#Importing AWS VPC and Subnet

#VPC
resource "aws_vpc" "main" {
  cidr_block = "172.31.0.0/16"
}

#VPC Import
import {
  to = aws_vpc.main
  id = "vpc-039c97f1fde684eec"
}

#Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
}

#Internet Gateway Import
import {
  to = aws_internet_gateway.internet_gateway
  id = "igw-0b9ef3a32020c7ac5"
}

#subnet
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}

#subnet Import
import {
  to = aws_subnet.subnet1
  id = "subnet-0fc4b042e8ac3604d"
}

#subnet
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.31.80.0/20"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
}

#subnet Import
import {
  to = aws_subnet.subnet2
  id = "subnet-018c96b6eb4d2dd1f"
}

#subnet
resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

#subnet Import
import {
  to = aws_subnet.subnet3
  id = "subnet-0f2e85c148a9d4b5a"
}

#subnet
resource "aws_subnet" "subnet4" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

#subnet Import
import {
  to = aws_subnet.subnet4
  id = "subnet-00bd3e0c93418828b"
}

#Route Table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
}

#Route Table Import
import {
  to = aws_route_table.route_table
  id = "rtb-0851260b2cac8f4fb"
}

#Routes
resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

#Routes Import
import {
  to = aws_route.route
  id = "rtb-0851260b2cac8f4fb_0.0.0.0/0"
}

#Route Table Associations
resource "aws_route_table_association" "subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet2_association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet3_association" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet4_association" {
  subnet_id      = aws_subnet.subnet4.id
  route_table_id = aws_route_table.route_table.id
}

#import Route Table Associations
import {
  to = aws_route_table_association.subnet1_association
  id = "subnet-0fc4b042e8ac3604d/rtb-0851260b2cac8f4fb"
}
import {
  to = aws_route_table_association.subnet2_association
  id = "subnet-018c96b6eb4d2dd1f/rtb-0851260b2cac8f4fb"
}
import {
  to = aws_route_table_association.subnet3_association
  id = "subnet-0f2e85c148a9d4b5a/rtb-0851260b2cac8f4fb"
}
import {
  to = aws_route_table_association.subnet4_association
  id = "subnet-00bd3e0c93418828b/rtb-0851260b2cac8f4fb"
}
