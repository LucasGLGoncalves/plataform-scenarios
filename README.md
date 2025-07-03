# Plataforma de Cenários Terraform na DigitalOcean

Este projeto utiliza Terraform para provisionar e configurar automaticamente recursos na DigitalOcean, como droplets e regras de firewall, com foco em simplicidade e reprodutibilidade.

## Requisitos

* [Terraform](https://www.terraform.io/) >= 1.0
* Conta na [DigitalOcean](https://www.digitalocean.com/)
* Token de API da DigitalOcean
* Chave SSH registrada na DigitalOcean

## Visão Geral

Os principais recursos provisionados incluem:

* **Droplet Ubuntu 24.04**

  * Localização: `nyc2`
  * Tamanho: `s-1vcpu-512mb-10gb`
  * Backups automáticos habilitados com política semanal

* **Firewall Personalizado**

  * Acesso liberado nas portas 22 (SSH), 80 (HTTP) e 443 (HTTPS)
  * Regras de saída para DNS, HTTP, HTTPS e SSH

## Estrutura de Arquivos

* `main.tf`: Configuração do provedor e criação do droplet
* `resources.tf`: Configuração do firewall
* `terraform.tfvars`: Definições de variáveis (token e nome da chave SSH)
* `.terraform.lock.hcl`: Controle de versões dos provedores

## Como Usar

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/plataform-scenarios.git
cd plataform-scenarios
```

### 2. Configure variáveis sensíveis

Crie um arquivo `terraform.tfvars` com:

```hcl
DO_TOKEN = "seu_token_aqui"
SSH_KEY_NAME = "nome_da_chave_ssh"
```

Ou configure como variáveis de ambiente:

```bash
export TF_VAR_DO_TOKEN="seu_token_aqui"
export TF_VAR_SSH_KEY_NAME="nome_da_chave_ssh"
```

### 3. Inicialize e aplique

```bash
terraform init
terraform apply
```

## Saídas

* IP público do droplet criado, exibido após o `apply`.

## Notas

* Este projeto usa o provedor `digitalocean` versão `~> 2.0`.
* As chaves SSH devem estar previamente registradas na DigitalOcean com o nome exato usado.
