# Use the official Apache HTTP server as the base image
FROM httpd:2.4

# Copy all the files in your folder to the Apache document root directory
COPY . /usr/local/apache2/htdocs/

# Set correct permissions for the files (optional but recommended)
RUN chmod -R 755 /usr/local/apache2/htdocs/

# Expose port 80 to make the website available externally
EXPOSE 8080
