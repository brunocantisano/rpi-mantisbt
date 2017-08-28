docker run -d --name mantisbt \
           -e DATABASE_URL=jdbc://mantis:mantis@172.17.0.7:9408/bugtracker \
           -p 9407:80 --link mysql:db \
           paperinik/rpi-mantisbt:latest
