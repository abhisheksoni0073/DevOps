__Supervisor__

    cd /usr/share/nginx/html/api
    chmod -R 777 storage 
    chmod -R 777 bootstrap/cache 
    composer update
    php artisan config:cache
    php artisan config:clear
    php artisan queue:table
    php artisan queue:failed-table
    php artisan migrate

    service supervisor stop
    supervisord -c /etc/supervisor/supervisord.conf

    supervisorctl reread
    supervisorctl update
    supervisorctl start laravel-worker:*
