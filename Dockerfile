FROM nginx:latest

# MAINTAINER  Sujata Pati

# RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/

COPY website.html /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
