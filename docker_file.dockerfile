# Utilisation de l'image officielle Node.js LTS basée sur Alpine Linux :
    FROM node:lts-alpine AS builder

    # Définition du répertoire de travail dans le conteneur :
    WORKDIR /app
    
    # Copie du fichier package.json dans le répertoire de travail :
    COPY ./package.json ./
    
    # Installation des dépendances Node.js spécifiées dans package.json :
    RUN npm install
    
    # Copie de tous les fichiers du projet dans le répertoire de travail :
    COPY ./ ./
    
    # Exécution du script de build défini dans package.json pour générer les fichiers statiques :
    RUN npm run build
    
    # Utilisation de l'image officielle Nginx basée sur Alpine Linux :
    FROM nginx:alpine AS server
    
    # Copie des fichiers statiques générés lors de l'étape de build dans le répertoire par défaut de Nginx :
    COPY --from=builder /app/dist /usr/share/nginx/html    