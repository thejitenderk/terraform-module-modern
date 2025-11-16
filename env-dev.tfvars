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

