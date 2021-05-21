__Java Gradle build (building java app manually)__
    
    sudo docker run --rm -it --name temp -v /home/app/:/home/gradle/ gradle gradle buildNeeded -x test

__PHPMyAdmin using docker run command__
    
    docker run --name myadmin --restart always -d -e PMA_HOST=localhost -p 80:80 phpmyadmin/phpmyadmin

__Running Bitgo Proxy for blockchain projects__
    openssl req -newkey rsa:2048 -nodes -keyout cert.key -x509 -days 3650 -out cert.crt
    docker run --name bitgo-proxy -d --volume /etc/letsencrypt:/private -p 4000:4000 bitgosdk/express:latest -p 4000 -k /private/live/jenkins.openxcell.info/privkey.pem -c /private/live/jenkins.openxcell.info/fullchain.pem -e test
    curl localhost:4000/api/v2/ping

    pm2 start /var/bitgo-express-project/node_modules/bitgo/bin/bitgo-express  --node-args="--debug --port 4080 --keypath /etc/letsencrypt/live/bitgoproxy.faldax.com/privkey.pem --crtpath /etc/letsencrypt/live/bitgoproxy.faldax.com/fullchain.pem --env prod --bind 0.0.0.0"  --name="bitgo proxy server production"