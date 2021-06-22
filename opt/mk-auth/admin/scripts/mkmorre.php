# Mudar arquivo mk-auth.php para mk-auth.php_old
mv /opt/mk-auth/admin/scripts/mk-auth.php mk-auth.php_old

# Matando processo mk-auth.php
killall -y 300h /opt/mk-auth/admin/script/mk-auth.php &&

# Restart apache2
service apache2 restart

