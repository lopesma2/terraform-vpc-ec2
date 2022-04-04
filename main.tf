#provider "aws" {
#    region = "us-east-1"
#}

## Create ECR repository
resource "aws_ecr_repository" "repository" {
    for_each = toset(var.repository_list)
  name = each.key
}

## Build docker images and push to ECR
resource "docker_registry_image" "backend" {
    for_each = toset(var.repository_list)
    name = "${aws_ecr_repository.repository[each.key].repository_url}:latest"

    build {
        context = "../application"
        dockerfile = "${each.key}.Dockerfile"
    }  
}



module "networking" {
  source = "./modules/networking"
  namespace = var.namespace
}


module "ssh-key" {
  source    = "./modules/ssh-key"
  namespace = var.namespace
}

#module "ec2-instance" {
#  source = "./modules/ec2"
#   ami_id = "ami-0c2d06d50ce30b442"
#  namespace  = var.namespace
#  instance_type = "t2.micro"
#  vpc        = module.networking.vpc
#  sg_pub_id  = module.networking.sg_pub_id
#  key_name   = module.ssh-key.key_name
#} 