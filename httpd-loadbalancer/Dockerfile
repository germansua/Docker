FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y apache2

CMD service apache2 stop
WORKDIR /etc/apache2
COPY 000-default.conf sites-available/

CMD ln mods-available/proxy.conf mods-enabled
CMD ln mods-available/proxy.load mods-enabled
CMD ln mods-available/proxy_balancer.conf mods-enabled
CMD ln mods-available/proxy_balancer.load mods-enabled
CMD ln mods-available/lbmethod_byrequests.load mods-enabled
CMD ln mods-available/slotmem_shm.load mods-enabled
CMD ln mods-available/proxy_html.conf mods-enabled
CMD ln mods-available/proxy_http.load mods-enabled
CMD ln mods-available/proxy_html.load mods-enabled

RUN chmod 777 mods-enabled/*

CMD ["apachectl", "-DFOREGROUND"] 

EXPOSE 80