docker run -d --name mantisbt \
           -e DATABASE_URL=jdbc://mantis:mantis@192.168.1.30:9415/bugtracker \
           -p 9407:80 --link mysql:db \
           paperinik/rpi-mantisbt
