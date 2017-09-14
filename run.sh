docker run -d --name mantisbt \
           -e DATABASE_URL=jdbc://mantis:mantis@0.0.0.0:9415/bugtracker \
           -p 9407:80 --link mysql:db \
           paperinik/rpi-mantisbt
