# Use a minimal JRE 21 base image
FROM eclipse-temurin:21-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the built jar file into the container
COPY target/discovery-server-0.0.1.jar /app/discovery-server.jar

# Expose the port that the Eureka server will run on
EXPOSE 8761

# Command to run the Eureka server
ENTRYPOINT ["java", "-jar", "/app/discovery-server.jar"]