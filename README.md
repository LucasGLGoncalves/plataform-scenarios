# 🌐 Plataforma de Cenários com Terraform

Este repositório é um espaço para **experimentações com Terraform**, focado na criação de infraestrutura na [DigitalOcean](https://www.digitalocean.com/).

## 🔧 Objetivo

Explorar, testar e validar configurações de infraestrutura como código (IaC) usando o Terraform.

## 📦 Recursos Provisionados

Atualmente, o projeto inclui:

* **Droplet Ubuntu 24.04**

  * Local: `nyc2`
  * Tamanho: `s-1vcpu-512mb-10gb`
  * Backups habilitados com política semanal
* **Firewall DigitalOcean**

  * Portas liberadas: `22`, `80`, `443`
  * Regras de saída para `DNS`, `HTTP`, `HTTPS` e `SSH`

## 🚀 Como usar

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/plataform-scenarios.git
   cd plataform-scenarios
   ```

2. Configure seu arquivo `terraform.tfvars`:

   ```hcl
   DO_TOKEN     = "seu_token_da_digitalocean"
   SSH_KEY_NAME = "nome_da_chave_ssh_registrada"
   ```

3. Inicialize e aplique:

   ```bash
   terraform init
   terraform apply
   ```

## 📤 Saídas

* IP do droplet será exibido ao final do processo (`output "droplet_ip"`).

## 🧪 Notas

* Este projeto é **experimental** e os recursos podem mudar frequentemente.
* Usando o provedor `digitalocean` versão `~> 2.0`.
