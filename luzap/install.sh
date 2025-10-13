#!/bin/bash
# =====================================================
# 🧩 Script de Instalação Automática do Evolution API v1.8.2
# Compatível com MK-AUTH / Debian / Ubuntu
# Criado por: Apolo Raví
# =====================================================

# === CORES PARA O TERMINAL ===
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

# === ETAPA 1: ATUALIZAÇÃO DO SISTEMA ===
echo -e "${VERDE}[1/6] Atualizando pacotes...${RESET}"
apt update -y && apt upgrade -y

# === ETAPA 2: INSTALANDO DEPENDÊNCIAS ===
echo -e "${VERDE}[2/6] Instalando dependências necessárias...${RESET}"
apt install -y curl ca-certificates gnupg lsb-release apt-transport-https

# === ETAPA 3: CONFIGURANDO REPOSITÓRIO DO DOCKER ===
echo -e "${VERDE}[3/6] Adicionando repositório oficial do Docker...${RESET}"
mkdir -p /usr/share/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# === ETAPA 4: INSTALANDO DOCKER ===
echo -e "${VERDE}[4/6] Instalando Docker...${RESET}"
apt update -y
apt install -y docker-ce docker-ce-cli containerd.io

# === ETAPA 5: TESTANDO INSTALAÇÃO DO DOCKER ===
echo -e "${VERDE}[5/6] Testando o Docker...${RESET}"
docker -v || { echo -e "${VERMELHO}❌ Erro: Docker não instalado corretamente!${RESET}"; exit 1; }

# === ETAPA 6: INSTALANDO EVOLUTION API ===
echo -e "${VERDE}[6/6] Iniciando container Evolution API v1.8.2...${RESET}"

docker run -d \
--name evolution_api \
-p 7070:8080 \
-e AUTHENTICATION_API_KEY=1234 \
atendai/evolution-api:v1.8.2

sleep 3

# === VERIFICANDO SE O CONTAINER ESTÁ RODANDO ===
if docker ps | grep -q "evolution_api"; then
    echo -e "${VERDE}✅ Evolution API instalada e em execução com sucesso!${RESET}"
    echo ""
    echo -e "${AMARELO}Acesse sua API em:${RESET} ${VERDE}http://<IP_DO_SERVIDOR>:7070${RESET}"
    echo -e "${AMARELO}Chave de autenticação:${RESET} ${VERDE}1234${RESET}"
else
    echo -e "${VERMELHO}❌ O container Evolution API não iniciou corretamente.${RESET}"
    echo "Verifique com: docker logs -f evolution_api"
fi

echo ""
echo -e "${AMARELO}Para ver os logs em tempo real, use:${RESET} docker logs -f evolution_api"
echo -e "${AMARELO}Para parar o container:${RESET} docker stop evolution_api"
echo -e "${AMARELO}Para iniciar novamente:${RESET} docker start evolution_api"
echo -e "${AMARELO}Para remover completamente:${RESET} docker rm -f evolution_api"
echo ""
echo -e "${VERDE}Instalação concluída!${RESET}"
