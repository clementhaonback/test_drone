# Image finale - utilise les artefacts pré-construits par Drone
FROM nginx:alpine

# Copie les fichiers buildés par Drone (pas de re-build !)
COPY test_drone/dist/ /usr/share/nginx/html/

# Configuration nginx optimale pour React SPA
RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 