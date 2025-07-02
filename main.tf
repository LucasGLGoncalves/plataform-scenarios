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

data "digitalocean_ssh_key" "aula-terraform" {
  name = ${{ secrets.SSH_KEY_NAME }}
}

resource "digitalocean_droplet" "maquina-virtual-01" {
  image   = "ubuntu-24-04-x64"
  name    = "maquina-virtual-01"
  region  = "nyc2"
  size    = "s-1vcpu-512mb-10gb"
  ssh_keys = [ data.digitalocean_ssh_key.aula-terraform.id ]
  backups = true
  backup_policy {
    plan    = "weekly"
    weekday = "TUE"
    hour    = 8
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.maquina-virtual-01.ipv4_address
}