# Truth Engine — single-page app for EigenCloud / EigenCompute
FROM --platform=linux/amd64 nginx:alpine
USER root

RUN rm -f /etc/nginx/conf.d/default.conf

# Only the one file
COPY index.html /usr/share/nginx/html/

RUN echo 'server { \
    listen 8080; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { try_files $uri $uri/ /index.html; } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
