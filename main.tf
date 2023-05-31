resource "azurerm_web_application_firewall_policy" "this" {
  count = var.create_waf_rule ? 1 : 0

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location


  dynamic "custom_rules" {
    for_each = var.custom_rules

    content {
      name      = try(custom_rules.value.name, null)
      priority  = try(custom_rules.value.priority)
      rule_type = try(custom_rules.value.rule_type, null)

      dynamic "match_conditions" {
        for_each = try(custom_rules.value.match_conditions, [])

        content {
          match_values       = try(match_conditions.value.match_values, [])
          operator           = try(match_conditions.value.operator)
          negation_condition = try(match_conditions.value.negation_condition, null)
          transforms         = try(match_conditions.value.transforms, [])
          dynamic "match_variables" {
            for_each = try(match_conditions.value.match_variables)

            content {
              variable_name = try(match_variables.value.variable_name)
              selector      = try(match_variables.value.selector, null)
            }
          }
        }
      }

      action = try(custom_rules.value.action, "Log")
    }
  }

  dynamic "policy_settings" {
    for_each = var.policy_settings

    content {
      enabled                     = try(policy_settings.value.enabled, true)
      mode                        = try(policy_settings.value.mode, "Detection")
      file_upload_limit_in_mb     = try(policy_settings.value.enabled, "100")
      request_body_check          = try(policy_settings.value.enabled, true)
      max_request_body_size_in_kb = try(policy_settings.value.enabled, "128")
    }
  }

  dynamic "managed_rules" {
    for_each = var.managed_rules

    content {

      dynamic "exclusion" {
        for_each = try(managed_rules.value.exclusion, [])

        content {
          match_variable          = try(exclusion.value.match_variable)
          selector                = try(exclusion.value.selector)
          selector_match_operator = try(exclusion.value.selector_match_operator)

          dynamic "excluded_rule_set" {
            for_each = try(exclusion.value.excluded_rule_set, [])

            content {
              type    = try(excluded_rule_set.value.type, "OWASP")
              version = try(excluded_rule_set.value.version, "3.2")

              dynamic "rule_group" {
                for_each = try(excluded_rule_set.value.rule_group, [])

                content {
                  rule_group_name = try(rule_group.value.rule_group_name)
                  excluded_rules  = try(rule_group.value.excluded_rules, [])
                }
              }
            }
          }
        }
      }

      dynamic "managed_rule_set" {
        for_each = try(managed_rules.value.managed_rule_set, [])

        content {
          type    = try(managed_rule_set.value.type, null)
          version = try(managed_rule_set.value.version, null)

          dynamic "rule_group_override" {
            for_each = try(managed_rule_set.value.rule_group_override, [])

            content {
              rule_group_name = try(rule_group_override.value.rule_group_name)
              dynamic "rule" {
                for_each = try(rule_group_override.value.rule, [])
                content {
                  id      = try(rule.value.id)
                  enabled = try(rule.value.enabled, null)
                  action  = try(rule.value.action, null)
                }
              }
            }

          }
        }
      }
    }
  }

  tags = var.tags
}
