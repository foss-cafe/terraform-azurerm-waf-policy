module "waf_rule" {
  source              = "../.."
  name                = "example-waf"
  resource_group_name = "terraform-test"
  location            = "East US"
}