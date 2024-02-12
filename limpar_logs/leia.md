# Limpar Loss do Sisco Mk-auth 

Script para limpoar logs
## Uso Rápido

1. Acesse o seu Mk-Auth via root e baixe o script:

    ```bash
    wget https://github.com/apoloravi/marrascript/raw/main/limpar_logs/clear_log.sh
    ```

2. Configure o Crontab para executar o script a cada minuto:

    ```bash
    crontab -e
    ```

    Adicione a seguinte linha ao final do arquivo Crontab:

    ```bash
    */1 * * * * sh clear_log.sh
    ```

    Salve e feche o editor do Crontab.

## FIM
