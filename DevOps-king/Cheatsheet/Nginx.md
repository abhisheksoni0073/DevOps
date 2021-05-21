__413 Entity too large__

- /etc/nginx/sites-enabled/default
`client_max_body_size 100M;`

__Lets Encrypt__

    sudo docker run -it --rm -v /home/ubuntu/certs/:/etc/letsencrypt -v /usr/share/nginx/html:/data/letsencrypt -v "/docker-volumes/var/log/letsencrypt:/var/log/letsencrypt" certbot/certbot certonly --webroot --email devops@openxcell.info --agree-tos --webroot-path=/data/letsencrypt -d www.example.com,pehul.example.com

    {
    sudo apt-get update
    sudo apt-get install software-properties-common
    sudo add-apt-repository universe
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt-get update
    }

    sudo apt-get install certbot python3-certbot-nginx

    sudo certbot --nginx

__Nginx Redirect Block__

    server {
        listen 80;
        server_name example.com;
        return 301 https://example.com$request_uri;
    }

__Load Testing Nginx sever__

    http_load -p 10 -s 5 http://localhost:8080/


__enable gzip__

    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_buffers 16 8k;
    gzip_http_version 1.1;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application xml+rss text/javascript;

