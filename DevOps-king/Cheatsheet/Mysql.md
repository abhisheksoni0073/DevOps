__taking dump__

    mysqldump -u$DB_USER -p$DB_PASS -h$DB_HOST --skip-ssl --all-databases --triggers --routines --events  > /var/www/$filename.sql

__restroing dump__

    mysql -h host -u user -ppassword
    source dumpfile.sql;

__Creating user__

    CREATE USER 'username'@'%' IDENTIFIED BY 'password';
    GRANT PRIVILEGE ON *.* TO 'username'@'%';
    GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;

__Restrict user access (Best practices)__

    ALTER USER 'user1'@'localhost';
    UPDATE mysql.user SET host = '127.0.0.1' WHERE user='root' AND host='0.0.0.0';