terraform {
  backend "s3" {
    bucket       = "foodiary-terraform-state-184198557041-us-east-1-an"
    key          = "foodiary-api/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
