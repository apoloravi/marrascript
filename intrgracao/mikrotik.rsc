/ppp profile
add change-tcp-mss=yes name="MARRA PERFIL" use-encryption=yes
/interface pppoe-client

/interface pptp-client
add connect-to=167.114.4.20 disabled=no name="MARRA-RAMAL=IP-FINAL-2" password=123456 profile=\
    "MARRA PERFIL" user=mkauth1
#add connect-to=167.114.4.20 disabled=yes name="MARRA-RAMAL=IP-FINAL-3" password=123456 profile=\
#    "MARRA PERFIL" user=mkauth2
#add connect-to=167.114.4.20 disabled=yes name="MARRA-RAMAL=IP-FINAL-4" password=123456 profile=\
#    "MARRA PERFIL" user=mkauth3
#add connect-to=167.114.4.20 disabled=yes name="MARRA-RAMAL=IP-FINAL-5" password=123456 profile=\
#    "MARRA PERFIL" user=mkauth4

#Configurando o ip Pool

/ip pool
 add name=remote ranges=172.16.0.2-172.16.3.254

#Configurando perfil para PPPoE

 /ppp profile 
add name=PPPoE-Mk-Auth local-address=172.16.0.1 remote-address=remote 

#Configurando Bloquio DNS para Corte
/ip firewall filter
add action=drop chain=forward comment="DNS MK-AUTH CORTE" dst-address=!167.114.4.20 \
    dst-port=53 protocol=udp src-address-list=pgcorte
#Configurando PGCORTE
/ip firewall nat
add action=dst-nat chain=dstnat comment="MK-AUTH PGCORTE / BLOQUEIO" dst-address=\
    !167.114.4.20 dst-port=80,443 protocol=tcp src-address-list=pgcorte to-addresses=\
    167.114.4.20 to-ports=85
    
#Alterando a Porta SSH para Evitar Ataque DDoS
/ip service
set ssh address=172.20.1.0/24 port=2215

#Habilitando o Uso do Radius para PPPoE
/ppp aaa
set interim-update=3m use-radius=yes

#Fazendo a Comunicação do Mikrotik com Mk-Auth via Radius
/radius
add address=172.20.1.1 secret=123456 service=ppp,hotspot

/radius incoming
set accept=yes

#Adicionando User para o Mk-Auth ter Acesso ao Mikrotik
/user
add address=172.20.1.0/24 name=mkauth group=full password=mkauth1010 comment=MK-AUTH-USER

#terminando a Instalação Agurade...
/tool
fetch mode=http url=http://172.20.1.1/chave.pub
#fetch mode=http url=http://marracloud.com.br/down/Ramal-02.pub
#fetch mode=http url=http://marracloud.com.br/down/Ramal-03.pub
#fetch mode=http url=http://marracloud.com.br/down/Ramal-04.pub

/user ssh-keys
import public-key-file=chave.pub user=mkauth
#import public-key-file=Ramal-02.pub user=mkauth
#import public-key-file=Ramal-03.pub user=mkauth
#import public-key-file=Ramal-04.pub user=mkauth

#FIM DA INSTALAÇÃO, OBRIGADO POR ESCOLHER A MARRA CLOUD 
#Acesse https://marracloud.com.br para mais informações







