# Tutorial: Backup Cleanup Script

Este tutorial orienta você na configuração e utilização de um script Bash que remove backups antigos do diretório `/opt/mk-auth/bckp/`, mantendo apenas os últimos 10 dias de arquivos.

## Objetivo

O objetivo deste script é garantir que o diretório de backups não fique sobrecarregado com arquivos antigos, ocupando espaço desnecessário em disco.

## Funcionalidade

- Remove arquivos de backup com a extensão `.maz` que foram modificados há mais de 10 dias.
- Exclui os arquivos automaticamente, sem solicitar confirmação.

## Requisitos

- Acesso de escrita ao diretório `/opt/mk-auth/bckp/`.
- Permissões para executar scripts Bash.
- Git instalado (para clonar o repositório).

## Passo a Passo

### 1. Clonando o Repositório

Primeiro, você precisa clonar o repositório que contém o script. Abra um terminal e execute:

```bash
git clone <URL_DO_SEU_REPOSITORIO>
cd <NOME_DO_REPOSITORIO>

Permissão
chmod +x cleanup_backups.sh


