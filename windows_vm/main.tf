# Create public IPs
resource "azurerm_public_ip" "win_public_ip" {
  name                = "win_public_ip"
  location            = var.vm_location
  resource_group_name = var.vm_resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = var.vm_domain_name_label
}

# Create network interface
resource "azurerm_network_interface" "win_nic" {
  name                = "win_nic"
  location            = var.vm_location
  resource_group_name = var.vm_resource_group_name

  ip_configuration {
    name                          = "win_nic_configuration"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "win_nic_nsg" {
  network_interface_id      = azurerm_network_interface.win_nic.id
  network_security_group_id = var.vm_network_security_group_id
}

# Create windows virtual machine
resource "azurerm_windows_virtual_machine" "win_vm" {
  name                        = var.vm_name
  admin_username              = var.vm_admin_username
  admin_password              = var.vm_admin_password
  location                    = var.vm_location
  resource_group_name         = var.vm_resource_group_name
  network_interface_ids       = [azurerm_network_interface.win_nic.id]
  size                        = var.vm_size

  os_disk {
    name                 = "win_vm_os_disk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
      publisher = var.vm_source_image_publisher
      offer     = var.vm_source_image_offer
      sku       = var.vm_source_image_sku
      version   = var.vm_source_image_version
  }

  priority = var.vm_priority
  # eviction_policy = var.vm_eviction_policy
}
