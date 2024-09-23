#!/bin/bash

# Diretório onde os backups estão armazenados
BACKUP_DIR="/opt/mk-auth/bckp/"

# Remove backups mais antigos que 10 dias
find "$BACKUP_DIR" -type f -name "*.maz" -mtime +10 -exec rm {} \;

echo "Backups antigos removidos com sucesso."
