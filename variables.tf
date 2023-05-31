variable "create_waf_rule" {
  type        = bool
  description = "Do you want to create WAF rule?"
  default     = true
}

variable "name" {
  type        = string
  description = "(Required) The name of the policy. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Resource location. Changing this forces a new resource to be created."
}

variable "custom_rules" {
  type        = any
  description = "(Optional) One or more custom_rules blocks"
  default     = []
}

variable "policy_settings" {
  type        = any
  description = "(Optional) A policy_settings block"
  default     = []
}

variable "managed_rules" {
  type        = any
  description = "(Required) A managed_rules blocks"
  default = [
    {
      managed_rule_set = [
        {
          type    = "OWASP"
          version = "3.2"
        }
      ]
    }
  ]
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the Web Application Firewall Policy."
  default     = {}
}
