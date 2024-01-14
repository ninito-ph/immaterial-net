module "security_groups" {
  source = "./modules/security_groups"
  allowed_ssh_cidr_blocks = ["${local.current_cidr}"]
}

module "amazon_linux_node" {
  source = "./modules/instances/amazon_linux"
  ami = "ami-02b2b65fd19073983"
  instance_type = "t4g.micro"
  security_group_ids = ["${module.security_groups.allow_ssh_sg.id}"]
  instance_name = "core_node"
}