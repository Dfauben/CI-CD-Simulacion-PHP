# Use official PHP image with Apache
FROM php:8.1-apache

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . /var/www/html/

# Copy custom Apache config to enable access
COPY ./custom-acces.conf /etc/apache2/conf-available/custom-access.conf

# Enable Apache mod_rewrite and the custom config
RUN a2enmod rewrite && \
    a2enconf custom-access

# Install PHP extensions
RUN docker-php-ext-install fileinfo

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]