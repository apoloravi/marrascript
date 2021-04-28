
#Clear da Marra Cloud
echo > /var/log/syslog
echo > /var/log/auth.log
echo > /var/log/freeradius/radius.log

# Kill processos alem de 3m
killall -y 3m /usr/local/mkauth/backup/update
