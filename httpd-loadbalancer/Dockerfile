FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y apache2

CMD service apache2 stop
WORKDIR /etc/apache2
COPY 000-default.conf sites-available/

CMD cp mods-available/proxy.conf mods-enabled
CMD  cp mods-available/proxy.load mods-enabled

# CMD  cp mods-available/proxy_ajp.load mods-enabled

CMD  cp mods-available/proxy_balancer.conf mods-enabled
CMD  cp mods-available/proxy_balancer.load mods-enabled

# CMD  cp mods-available/proxy_connect.load mods-enabled
# CMD  cp mods-available/proxy_express.load mods-enabled
# CMD  cp mods-available/proxy_fcgi.load mods-enabled
# CMD  cp mods-available/proxy_fdpass.load mods-enabled

CMD  cp mods-available/lbmethod_byrequests.load mods-enabled
CMD  cp mods-available/slotmem_shm.load mods-enabled
CMD  cp mods-available/proxy_html.conf mods-enabled
CMD  cp mods-available/proxy_html.load mods-enabled
CMD  cp mods-available/proxy_http.load mods-enabled

# CMD  cp mods-available/proxy_scgi.load mods-enabled
# CMD  cp mods-available/proxy_wstunnel.load mods-enabled

RUN chmod 777 mods-enabled/*
CMD ["apachectl", "-DFOREGROUND"] 
EXPOSE 80