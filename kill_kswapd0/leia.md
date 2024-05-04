# Script kill_kswapd0.sh

Este script foi desenvolvido para encerrar o processo `kswapd0` em sistemas Linux.

## Uso

1. Baixe o script [kill_kswapd0.sh](https://github.com/apoloravi/marrascript/blob/main/kill_kswapd0/kill_kswapd0.sh) para o seu sistema Linux.
2. Torne o script executável usando o comando `chmod +x kill_kswapd0.sh`.
3. Execute o script usando o comando `./kill_kswapd0.sh`.
4. O script verificará se o processo `kswapd0` está em execução e o encerrará, se estiver.

**Nota:** O encerramento do processo `kswapd0` pode ter efeitos imprevisíveis no desempenho do sistema, pois ele é uma parte fundamental do gerenciamento de memória do Linux. Use com cuidado e teste em um ambiente de desenvolvimento antes de aplicar em produção.

## Contribuindo

- Se você encontrar problemas ou tiver sugestões de melhoria, sinta-se à vontade para abrir uma "Issue" ou enviar uma solicitação de "Pull Request".

## Licença

Este projeto é licenciado sob a Licença MIT. Consulte o arquivo [LICENSE](LICENSE) para obter detalhes.
