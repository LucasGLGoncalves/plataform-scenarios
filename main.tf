terraform {
    required_version = "~>1.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = ${{ secrets.DO_TOKEN }}
}

resource "digitalocean_droplet" "MaquinaVirtual" {
  image   = "ubuntu-24-04-x64"
  name    = "MaquinaVirtual-01"
  region  = "nyc1"
  size    = "s-1vcpu-512mb-10gb"
  backups = true
  backup_policy {
    plan    = "weekly"
    weekday = "TUE"
    hour    = 8
  }
}

resource "digitalocean_firewall" "MV_Firewall" {
  
}