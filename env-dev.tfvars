common_tags = {
  Owner = "jk-team"
  Env   = "dev"
}

rg_details = {
  "map-rg1" = {
    name     = "rg-map-dev-001"
    location = "East US"
  }
}


vnet_details = {
  "map-vnet1" = {
    vnet_name          = "vnet-dev-001"
    vnet_address_space = ["10.0.0.0/16"]
    resource_group_key = "map-rg1"
    subnets = {
      frontend-subnet = {
        address_prefixes = ["10.0.1.0/24"]
      }
      backend-subnet = {
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

vm_details = {
  "frontuivm" = {
    nic_name           = "nic-frontui-dev-001"
    admin_username     = "adminuser"
    admin_password     = "P@ssw0rd1234!"
    resource_group_key = "map-rg1"
    network_key        = "map-vnet1"
    subnet_key         = "frontend-subnet"
  }
  backendvm = {
    nic_name           = "nic-backend-dev-001"
    admin_username     = "adminuser"
    admin_password     = "P@ssw0rd1234!"
    resource_group_key = "map-rg1"
    network_key        = "map-vnet1"
    subnet_key         = "backend-subnet"
  }
}
