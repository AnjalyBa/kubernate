FROM ubuntu
MAINTAINER Anjaly
RUN apt-get update && apt-getinstall nginx -y

WORKDIR /var/www/html/

ADD . .

CMD [“echo”,”Image created”] 
