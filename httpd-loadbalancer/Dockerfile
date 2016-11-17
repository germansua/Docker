FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y apache2

WORKDIR /etc/apache2
COPY loadbalancer-httpd.conf .

CMD a2enmod proxy proxy_http proxy_balancer proxy_html lbmethod_byrequests slotmem_shm
CMD service apache2 stop
CMD ["cat", "apache2.conf", "loadbalancer-httpd.conf", ">", "apache2.conf"]
CMD ["apache2ctl", "-DFOREGROUND"]

EXPOSE 80