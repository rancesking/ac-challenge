
module "vpc" {
  source = "./modules/vpc"
  env    = var.env
}

module "ecs" {
  source           = "./modules/ecs"
  env              = var.env
  ecs_cluster_name = "Arroyo-Consulting"
  sg               = module.vpc.sg
  subnet           = module.vpc.subnet
  tg               = module.vpc.tg
  vs_tg            = module.vpc.vs_tg
  listener         = module.vpc.listener
}

module "rds" {
  source   = "./modules/db"
  env      = var.env
  subnet   = module.vpc.subnet-rds
  sg       = module.vpc.sg-rds
  rds_name = "acdb-instance"
  db_name  = "acdb"
  db_user  = "testing"
}

module "bastion" {
  source = "./modules/bastion"
  env    = var.env
  subnet = module.vpc.subnet
  sg     = module.vpc.sg-bastion

}
