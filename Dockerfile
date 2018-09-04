FROM ubuntu:18.04


RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get clean all

RUN apt-get -my install wget gnupg


#nginx install
RUN wget http://nginx.org/keys/nginx_signing.key &&\
    apt-key add nginx_signing.key &&\
    echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list &&\
    echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list &&\
    apt-get -y update &&\
    apt-get -y install nginx 

#python3.6&&2.7 install
RUN apt-get -y install python3.6 &&\
    apt-get -y install python2.7


#django install
RUN wget https://bootstrap.pypa.io/get-pip.py &&\
    python2.7 get-pip.py &&\
    rm get-pip.py &&\
    pip install -U pip  &&\
    pip install django

