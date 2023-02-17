resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

output "string" {
  value = random_string.random.id
}