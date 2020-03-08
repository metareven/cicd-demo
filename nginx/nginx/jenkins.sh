docker run  -d --name jenkins --network=demo -p 8080:8080 -p 50000:50000 -v /opt/jenkins_home:/var/jenkins_home jenkinsci/blueocean:1.22.0
