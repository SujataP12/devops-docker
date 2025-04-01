FROM nginx:1.25.2

# Maintainer (optional, but recommended in documentation instead)
LABEL maintainer="Sujata Pati"

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Set working directory to Nginx's default root
WORKDIR /usr/share/nginx/html

# Copy static files
COPY index.html .
COPY styles.css .
COPY scripts.js .

# Expose port 80
EXPOSE 80

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
