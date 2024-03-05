#Script para remover logs do sistema
echo > /var/log/syslog
echo > /var/log/freeradius/radius.log

#Limapr processos que aquece a maquina
for id in $(atq | awk '{print $1}'); do atrm $id; done
