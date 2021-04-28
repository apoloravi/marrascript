# marrascript
Integração com Mk-auth ao Mikroitk

# Crons

#Acessar pasta root
cd ~
apt install git -y &&
git clone https://github.com/apoloravi/marrascript.git
rm log.sh
mv marrascript/crons/log.sh log.sh
rm -rf marrascript
