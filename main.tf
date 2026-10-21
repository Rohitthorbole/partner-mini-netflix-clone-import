terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "myprofile"
}

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
