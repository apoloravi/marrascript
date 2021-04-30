
#Clear da Marra Cloud
echo > /var/log/syslog
echo > /var/log/auth.log
echo > /var/log/freeradius/radius.log

# Kill processos alem de 3m
killall -y 3h /usr/local/mkauth/backup/update
killall -y 5h /usr/local/mkauth/backup/update
killall -y 10h /usr/local/mkauth/backup/update
killall -y 20h /usr/local/mkauth/backup/update
killall -y 30h /usr/local/mkauth/backup/update
killall -y 40h /usr/local/mkauth/backup/update
killall -y 90h /usr/local/mkauth/backup/update

