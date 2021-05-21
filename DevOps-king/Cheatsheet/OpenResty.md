__Installing OpenRusty (Whitelabeling solution)__

    wget https://openresty.org/download/openresty-1.17.8.1.tar.gz
    tar -xvf openresty-VERSION.tar.gz


`Lua Block`

    openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
    -subj '/CN=orderhive' \
    -keyout /etc/ssl/resty-auto-ssl-fallback.key \
    -out /etc/ssl/resty-auto-ssl-fallback.crt

    lua_shared_dict auto_ssl 1m;
    lua_shared_dict auto_ssl_settings 64k;

    init_by_lua_block {
        auto_ssl = (require "resty.auto-ssl").new()
        auto_ssl:set("allow_domain", function(domain)
        return true
        end)

        auto_ssl:init()
    }

    init_worker_by_lua_block {
        auto_ssl:init_worker()
    }

    server {
        listen 443 ssl;

        ssl_certificate_by_lua_block {
        auto_ssl:ssl_certificate()
        }

        ssl_certificate /etc/ssl/resty-auto-ssl-fallback.crt;
        ssl_certificate_key /etc/ssl/resty-auto-ssl-fallback.key;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Client-Verify SUCCESS;
        proxy_set_header X-Client-DN $ssl_client_s_dn;
        proxy_set_header X-SSL-Subject $ssl_client_s_dn;
        proxy_set_header X-SSL-Issuer $ssl_client_i_dn;
    }

    server {
        listen 80;

        location /.well-known/acme-challenge/ {
        content_by_lua_block {
            auto_ssl:challenge_server()
        }
        }
    }