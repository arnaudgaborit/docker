# Les directives les plus "tables", sont à faire au début 

ARG version=latest
FROM ubuntu:$version

#MAINTAINER est obsolète
#MAINTAINER JCD "jcd717@outlook.com"

# 1 LABEL pour économiser les couches
LABEL maintainer="JCD <jcd717@outlook.com>" \
    description="test" \
    auteur="bruno dubois"

COPY heartbeat.sh /entrypoint.sh

# 1 RUN pour économiser les couches
# Le ';' permet de séparer les commandes shell
RUN chmod +x /entrypoint.sh ;\
    echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs

# information de port réseau utile
#EXPOSE 1234/udp 4321/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["battement"]
