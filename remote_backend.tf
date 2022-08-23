terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "hashicat-azure-kyndryl"
    workspaces {
      name = "hashicat-azure"
    }
  }
}
