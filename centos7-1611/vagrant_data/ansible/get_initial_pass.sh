#!/bin/bash

LOG_FILE=/var/log/mysqld.log
PASS=$(sudo grep 'password is generated' $LOG_FILE | awk -F 'root@localhost: ' '{print $2}')

umask 0077
cat > /root/.my.cnf <<EOF
[client]
user=root
password=$PASS
connect-expired-password
EOF

#new_pass='admin'
#mysql --defaults-file=/root/.tmp.my.cnf -e "ALTER USER 'root'@'localhost' IDENTIFIED BY  'admin' "

#umask 0077
#cat > /root/.my.cnf <<EOF
#[client]
#user=root
#password=$new_pass
#connect-expired-password
#EOF