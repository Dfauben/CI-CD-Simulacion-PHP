# Use the official PHP image with Apache
FROM php:8.1-apache

# Set working directory
WORKDIR /var/www/html

# Copy application source code to the container
COPY . /var/www/html/

# Enable Apache mod_rewrite for URL rewriting if needed
RUN a2enmod rewrite

# Set permissions for uploads directory
RUN chown -R www-data:www-data /var/www/html/uploads

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
