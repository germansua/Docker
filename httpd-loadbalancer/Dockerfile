FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y apache2

RUN service apache2 stop
WORKDIR /etc/apache2
COPY 000-default.conf sites-available/

RUN ln mods-available/proxy.conf mods-enabled
RUN ln mods-available/proxy.load mods-enabled

# RUN ln mods-available/proxy_ajp.load mods-enabled

RUN ln mods-available/proxy_balancer.conf mods-enabled
RUN ln mods-available/proxy_balancer.load mods-enabled

# RUN ln mods-available/proxy_connect.load mods-enabled
# RUN ln mods-available/proxy_express.load mods-enabled
# RUN ln mods-available/proxy_fcgi.load mods-enabled
# RUN ln mods-available/proxy_fdpass.load mods-enabled

RUN ln mods-available/lbmethod_byrequests.load mods-enabled
RUN ln mods-available/slotmem_shm.load mods-enabled
RUN ln mods-available/proxy_html.conf mods-enabled
RUN ln mods-available/proxy_html.load mods-enabled
RUN ln mods-available/proxy_http.load mods-enabled

# RUN ln mods-available/proxy_scgi.load mods-enabled
# RUN ln mods-available/proxy_wstunnel.load mods-enabled

RUN chmod 777 mods-enabled/*
CMD apachectl -DFOREGROUND 
EXPOSE 80