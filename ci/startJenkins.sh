docker run  -d --name jenkins --network=demo -p 8080:8080 -p 50000:50000 -v $PWD/jenkins:/var/jenkins_home jenkins/jenkins:2.348

JENKINS_IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' jenkins)

LINE_TO_CHANGE=$(cat /etc/hosts | grep jenkins)

echo "ip: $JENKINS_IP"
echo "line: $LINE_TO_CHANGE"

SED_COMMAND=$(echo "s/$LINE_TO_CHANGE/$JENKINS_IP jenkins/")

echo "command: $SED_COMMAND"

sudo sed -i "$SED_COMMAND" /etc/hosts
