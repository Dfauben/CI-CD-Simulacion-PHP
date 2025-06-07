# Use official PHP image with Apache
FROM php:8.1-apache

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . /var/www/html/

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy custom Apache config to set DocumentRoot and allow access
RUN echo '<Directory /var/www/html/vistas>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>\n\
\n\
DocumentRoot /var/www/html/vistas' > /etc/apache2/conf-available/custom-access.conf && \
    a2enconf custom-access

# Install PHP extensions
RUN docker-php-ext-install fileinfo

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
