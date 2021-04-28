# marrascript
Integração com Mk-auth ao Mikroitk

# Crons

#Acessar pasta root
cd ~
# Baixando GIT
apt install git -y
# Baixando arquivo MarraScript
git clone https://github.com/apoloravi/marrascript.git
# Removendo log atual
rm log.sh
# Movendo log baixado
mv marrascript/crons/log.sh log.sh
# Removendo pasta marrascript
rm -rf marrascript
