#!/usr/bin/env bash
vhost="<VirtualHost *>
        ServerName  localhost
        DocumentRoot ${ROOT_WEB:-/var/www/html}
</VirtualHost>
"

echo "$vhost" > "/etc/apache2/sites-available/${HOST:-localhost}.conf"
ln -fs "/etc/apache2/sites-available/${HOST:-localhost}.conf" "/etc/apache2/sites-enabled/${HOST:-localhost}.conf"

apache2-foreground