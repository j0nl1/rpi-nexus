docker run -d --name nexus -p 8081:8081 -p 8082:8082 -p 8083:8083 --restart unless-stopped -v /home/pi/data:/usr/local/sonatype-work j0nl1/nexus:lastest