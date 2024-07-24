FROM centos:latest


# MAINTAINER sagar 


# Use dnf for package management
RUN dnf install -y httpd zip unzip


# Download the zip file using curl
ADD https://ww.free.css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/photogenic.zip


# Unzip and copy files in one step
RUN unzip /var/www/html/photogenic.zip && cp -rf photogenic/* /var/www/html/


# Remove intermediate files
RUN rm -rf photogenic photogenic.zip


# Set the entrypoint command
ENTRYPOINT ["/usr/sbin/httpd", "0", "FOREGROUND"]


EXPOSE 80  


WORKDIR /var/www/html/
