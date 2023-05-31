# Terraform module for Azure WAF Policy

## How to use it as a module

```hcl

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_web_application_firewall_policy.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/web_application_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_waf_rule"></a> [create\_waf\_rule](#input\_create\_waf\_rule) | Do you want to create WAF rule? | `bool` | `true` | no |
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | (Optional) One or more custom\_rules blocks | `any` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Resource location. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_managed_rules"></a> [managed\_rules](#input\_managed\_rules) | (Required) A managed\_rules blocks | `any` | <pre>[<br>  {<br>    "managed_rule_set": [<br>      {<br>        "type": "OWASP",<br>        "version": "3.2"<br>      }<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the policy. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_policy_settings"></a> [policy\_settings](#input\_policy\_settings) | (Optional) A policy\_settings block | `any` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the Web Application Firewall Policy. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Web Application Firewall Policy. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
