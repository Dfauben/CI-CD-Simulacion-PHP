# Use official PHP image with Apache
FROM php:8.1-apache

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . /var/www/html/

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install fileinfo

# Create uploads directory and set permissions
RUN mkdir -p /var/www/html/uploads && chown -R www-data:www-data /var/www/html/uploads

# Add Apache config to allow access
RUN echo '<Directory /var/www/html>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/conf-available/custom-access.conf && \
    a2enconf custom-access

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
