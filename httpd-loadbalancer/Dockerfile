FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y apache2

RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_balancer
RUN a2enmod proxy_html
RUN a2enmod lbmethod_byrequests 
RUN a2enmod slotmem_shm

RUN service apache2 stop

CMD ["apache2", "-DFOREGROUND"] 

EXPOSE 80