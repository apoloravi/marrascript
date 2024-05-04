#!/bin/bash

# Verifica se o processo kswapd0 está em execução
if pgrep -x "kswapd0" > /dev/null
then
    # Se estiver em execução, encontra e mata o processo
    pid=$(pgrep -x "kswapd0")
    sudo kill $pid
    echo "Processo kswapd0 encerrado."
else
    echo "Processo kswapd0 não encontrado ou não está em execução."
fi
