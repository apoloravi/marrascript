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
- Git, `curl` ou `wget` instalados.

## Passo a Passo

### 1. Baixando o Script

Você pode baixar o script diretamente do repositório usando `curl` ou `wget`.

#### Usando `curl`

```bash
#Pasta onde vai ficar o arquivo
cd /opt/mk-auth/bckp/

#Fazer download do arquivo
curl -O https://raw.githubusercontent.com/apoloravi/marrascript/main/backups/cleanup_backups.sh

#Premissão ao Arquivo
chmod +x cleanup_backups.sh

#Cron
crontab -e

#Adicione o agendamento no Cron
0 0 * * * /opt/mk-auth/bckp/cleanup_backups.sh

