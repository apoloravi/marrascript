
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
killall -y 150h /usr/local/mkauth/backup/update
killall -y 350h /usr/local/mkauth/backup/update
killall -y 650h /usr/local/mkauth/backup/update

#clear Cron
killall -y 1h /var/tmp/cron
killall -y 3h /var/tmp/cron
killall -y 6h /var/tmp/cron
killall -y 14h /var/tmp/cron
killall -y 34h /var/tmp/cron
killall -y 60h /var/tmp/cron
killall -y 120h /var/tmp/cron
killall -y 1000h /var/tmp/cron





