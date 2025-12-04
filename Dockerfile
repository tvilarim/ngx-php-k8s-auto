# Start with the official PHP image (Alpine variant for small size)
FROM php:8.2-fpm-alpine

# Install Nginx and Supervisor
RUN apk add --no-cache nginx supervisor

# Setup Nginx Config
# (Alpine Nginx loads configs from /etc/nginx/http.d/)
COPY nginx.conf /etc/nginx/http.d/default.conf

# Setup Supervisor Config
# We create a simple config inline to run both processes
RUN echo '[supervisord]' > /etc/supervisord.conf && \
    echo 'nodaemon=true' >> /etc/supervisord.conf && \
    echo '[program:php-fpm]' >> /etc/supervisord.conf && \
    echo 'command=docker-php-entrypoint php-fpm' >> /etc/supervisord.conf && \
    echo '[program:nginx]' >> /etc/supervisord.conf && \
    echo 'command=nginx -g "daemon off;"' >> /etc/supervisord.conf

# Copy Application Code
COPY . /var/www/html/

# Expose Web Port
EXPOSE 80

# Start Supervisor (which starts Nginx and PHP)
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
