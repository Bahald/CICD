# Utilisation de l'image officielle OpenJDK basée sur Alpine Linux
FROM openjdk:17-jdk-alpine

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie du fichier JAR dans le répertoire de travail
COPY target/demo-0.0.1-SNAPSHOT.jar /app.jar

# Commande pour exécuter l'application Java
ENTRYPOINT ["java", "-jar", "/app.jar"]
