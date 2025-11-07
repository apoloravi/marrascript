#!/bin/bash
# =====================================================
# 🚀 Instalação Automática do Evolution API v1.8.2 + Crontab
# Compatível com MK-AUTH / Debian / Ubuntu
# Autor: Apolo Raví
# =====================================================

# === CORES ===
VERDE="\e[32m"
VERMELHO="\e[31m"
AMARELO="\e[33m"
RESET="\e[0m"

echo -e "${AMARELO}"
echo "============================================"
echo " 🚀 Instalação do Docker + Evolution API v1.8.2"
echo "============================================"
echo -e "${RESET}"
sleep 2

# === CONFIGURAÇÃO INTERATIVA ===
read -p "🟢 Digite a porta que deseja usar (padrão: 7070): " PORTA
PORTA=${PORTA:-7070}

read -p "🔑 Digite sua GlobalKey (AUTHENTICATION_API_KEY): " GLOBAL_KEY
if [ -z "$GLOBAL_KEY" ]; then
    echo -e "${VERMELHO}❌ Você precisa informar uma GlobalKey.${RESET}"
    exit 1
fi

echo ""
echo -e "${VERDE}Usando porta:${RESET} ${AMARELO}${PORTA}${RESET}"
echo -e "${VERDE}Usando chave:${RESET} ${AMARELO}${GLOBAL_KEY}${RESET}"
sleep 2

# === ETAPA 1: ATUALIZAÇÃO ===
echo -e "${VERDE}[1/6] Atualizando pacotes...${RESET}"
apt update -y && apt upgrade -y

# === ETAPA 2: DEPENDÊNCIAS ===
echo -e "${VERDE}[2/6] Instalando dependências...${RESET}"
apt install -y curl ca-certificates gnupg lsb-release apt-transport-https cron

# === ETAPA 3: REPOSITÓRIO DOCKER ===
echo -e "${VERDE}[3/6] Adicionando repositório oficial do Docker...${RESET}"
mkdir -p /usr/share/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# === ETAPA 4: INSTALANDO DOCKER ===
echo -e "${VERDE}[4/6] Instalando Docker...${RESET}"
apt update -y
apt install -y docker-ce docker-ce-cli containerd.io

# === ETAPA 5: TESTANDO DOCKER ===
echo -e "${VERDE}[5/6] Testando Docker...${RESET}"
docker -v || { echo -e "${VERMELHO}❌ Docker não instalado corretamente!${RESET}"; exit 1; }

# === ETAPA 6: INSTALANDO EVOLUTION API ===
echo -e "${VERDE}[6/6] Iniciando container Evolution API...${RESET}"
docker rm -f evolution_api >/dev/null 2>&1
docker run -d \
  --name evolution_api \
  -p ${PORTA}:8080 \
  -e AUTHENTICATION_API_KEY=${GLOBAL_KEY} \
  atendai/evolution-api:v1.8.2

sleep 3

# === VERIFICAÇÃO DO CONTAINER ===
if docker ps | grep -q "evolution_api"; then
    echo -e "${VERDE}✅ Evolution API instalada e rodando!${RESET}"
else
    echo -e "${VERMELHO}❌ O container não iniciou. Verifique com:${RESET} docker logs -f evolution_api"
fi

# === CONFIGURAÇÃO DE CRONTAB ===
echo -e "${AMARELO}🔧 Configurando verificação automática no crontab...${RESET}"
CRON_JOB1="*/10 * * * * docker ps | grep -q evolution_api || docker start evolution_api"
CRON_JOB2="*/2 * * * * docker ps | grep -q evolution_api || docker start evolution_api"

# Obtém crontab atual (se existir)
( crontab -l 2>/dev/null | grep -v -F "$CRON_JOB1" | grep -v -F "$CRON_JOB2" ; echo "$CRON_JOB1" ; echo "$CRON_JOB2" ) | crontab -

echo -e "${VERDE}✅ Crontab configurado com sucesso.${RESET}"

# === EXIBIÇÃO FINAL ===
echo ""
echo -e "${AMARELO}Acesse a API em:${RESET} ${VERDE}http://$(hostname -I | awk '{print $1}'):${PORTA}${RESET}"
echo -e "${AMARELO}GlobalKey:${RESET} ${VERDE}${GLOBAL_KEY}${RESET}"
echo ""
echo -e "${AMARELO}Ver logs:${RESET} docker logs -f evolution_api"
echo -e "${AMARELO}Parar container:${RESET} docker stop evolution_api"
echo -e "${AMARELO}Iniciar container:${RESET} docker start evolution_api"
echo -e "${AMARELO}Remover container:${RESET} docker rm -f evolution_api"
echo ""
echo -e "${VERDE}🎉 Instalação concluída com sucesso!${RESET}"
