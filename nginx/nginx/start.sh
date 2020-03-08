docker-compose up -d

NGINX_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx_nginx_1)

LINE_TO_CHANGE=$(cat /etc/hosts | grep nginx)

#echo "ip: $NGINX_IP"
#echo "line: $LINE_TO_CHANGE"

SED_COMMAND=$(echo "s/$LINE_TO_CHANGE/$NGINX_IP nginx/")

#echo "command: $SED_COMMAND"

sudo sed -i "$SED_COMMAND" /etc/hosts

