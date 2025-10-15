# Get subscription info
data "azurerm_subscription" "primary" {}

# Resource group (scope)
resource "azurerm_resource_group" "rg" {
  name     = "${var.env}-${var.rg_name}"
  location =  var.location
}


# Create custom role
resource "azurerm_role_definition" "custom_role" {
  name        = "CustomVMReader"
  scope       = data.azurerm_subscription.primary.id
  description = "Custom role: read-only access to VMs"
  assignable_scopes = [
    data.azurerm_subscription.primary.id
  ]

  permissions {
    actions = [
      "Microsoft.Compute/virtualMachines/read",
      "Microsoft.Network/networkInterfaces/read",
      "Microsoft.Network/publicIPAddresses/read"
    ]
    not_actions = []
  }
}

# Assign custom role to service principal
resource "azurerm_role_assignment" "sp_role" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = azurerm_role_definition.custom_role.name
  principal_id         = var.sp_object_id
}
