# Matando processo mk-auth.php
killall -y 60h /opt/mk-auth/admin/script/mk-auth.php

# Mudar arquivo mk-auth.php para mk-auth.php_old
mv /opt/mk-auth/admin/scripts/mk-auth.php mk-auth.php_old

