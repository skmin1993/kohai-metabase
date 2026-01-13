#!/bin/bash

# Metabase startup script for Render
echo "Starting Metabase..."

# Set default port if not provided
PORT=${PORT:-3000}

# Download Metabase if not present
if [ ! -f "metabase.jar" ]; then
    echo "Downloading Metabase..."
    curl -L -o metabase.jar https://downloads.metabase.com/v0.50.0/metabase.jar
fi

# Start Metabase with environment variables
java -jar metabase.jar
