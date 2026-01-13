# Use an official OpenJDK runtime as base image
FROM openjdk:19-jdk-slim

# Set working directory
WORKDIR /app

# Install curl for downloading Metabase
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy the metabase.jar if it exists, otherwise it will be downloaded
COPY metabase.jar* ./

# Download Metabase if not present
RUN if [ ! -f "metabase.jar" ]; then \
    echo "Downloading Metabase..." && \
    curl -L -o metabase.jar https://downloads.metabase.com/v0.50.0/metabase.jar; \
    fi

# Expose port
EXPOSE 3000

# Set environment variable for port
ENV MB_JETTY_PORT=3000

# Run Metabase
CMD ["java", "-jar", "metabase.jar"]
