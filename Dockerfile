# Use Eclipse Temurin (official OpenJDK) runtime as base image
FROM eclipse-temurin:17-jre-jammy

# Set working directory
WORKDIR /app

# Install curl for downloading Metabase
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Download Metabase
RUN echo "Downloading Metabase..." && \
    curl -L -o metabase.jar https://downloads.metabase.com/v0.50.0/metabase.jar

# Expose port
EXPOSE 3000

# Set environment variable for port
ENV MB_JETTY_PORT=3000

# Run Metabase
CMD ["java", "-jar", "metabase.jar"]
