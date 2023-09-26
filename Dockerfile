FROM ubuntu:22.04
COPY index.html /var/www/html
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUP"]
