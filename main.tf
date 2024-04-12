# Create resource group
resource "azurerm_resource_group" "dev_rg" {
    name     = var.resource_group_name
    location = var.resource_group_location
}

# Create virtual network
resource "azurerm_virtual_network" "dev_network" {
    name                = "dev_network"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.dev_rg.location
    resource_group_name = azurerm_resource_group.dev_rg.name
}

# Create subnet
resource "azurerm_subnet" "dev_subnet" {
    name                 = "dev_subnet"
    resource_group_name  = azurerm_resource_group.dev_rg.name
    virtual_network_name = azurerm_virtual_network.dev_network.name
    address_prefixes     = ["10.0.1.0/24"]
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "dev_nsg" {
    name                = "dev_nsg"
    location            = azurerm_resource_group.dev_rg.location
    resource_group_name = azurerm_resource_group.dev_rg.name

  security_rule {
    name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }

  security_rule {
    name                       = "RDP"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }
}

module "linux_vm" {
  source = "./linux_vm"

    vm_admin_username = var.admin_username
    vm_admin_password = var.admin_password

    vm_name = "lin-vm"
    vm_size = "Standard_B2ts_v2" # 2 vCPUs, 1 GiB memory, $8.20/month = $0.011/hour => for 100h = $1.1
    # vm_size = "Standard_B2als_v2" # 2 vCPUs, 4 GiB memory, $29.52/month = $0.041/hour => for 100h = $4.1
    # vm_size = "Standard_D4s_v5" # 4 vCPUs, 16 GiB memory, $157.16/month = $0.218/hour => for 100h = $21.8
    vm_location = azurerm_resource_group.dev_rg.location
    vm_resource_group_name = azurerm_resource_group.dev_rg.name
    vm_subnet_id = azurerm_subnet.dev_subnet.id
    vm_network_security_group_id = azurerm_network_security_group.dev_nsg.id
    vm_domain_name_label = "dev-lin-vm"

    vm_source_image_publisher = "Canonical"
    vm_source_image_offer     = "0001-com-ubuntu-server-jammy"
    vm_source_image_sku       = "22_04-lts-gen2"
    vm_source_image_version   = "latest"
}

# module "windows_vm" {
#   source = "./windows_vm"
#
#     vm_admin_username = var.admin_username
#     vm_admin_password = var.admin_password
#
#     vm_name = "win-vm"
#     vm_size = "Standard_D4s_v5"
#     vm_location = azurerm_resource_group.dev_rg.location
#     vm_resource_group_name = azurerm_resource_group.dev_rg.name
#     vm_subnet_id = azurerm_subnet.dev_subnet.id
#     vm_network_security_group_id = azurerm_network_security_group.dev_nsg.id
#     vm_domain_name_label = "dev-win-vm"
#
#     vm_source_image_publisher = "MicrosoftWindowsDesktop"
#     vm_source_image_offer     = "Windows-10"
#     vm_source_image_sku       = "win10-22h2-pro"
#     vm_source_image_version   = "latest"
#
#     vm_priority = "Regular"
#     # vm_eviction_policy = "Deallocate"
# }
