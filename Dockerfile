FROM ubuntu:22.04
LABEL maintainer="Rances Acosta"
LABEL proyect="AC-Challenge"

# Set the FRONTEND variable as noninteractive for the installion of apache2
ARG DEBIAN_FRONTEND=noninteractive

# Install prerequisites for Java, Git, and other tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl \
        default-jre \
        default-jdk \
        maven \
        git \
        curl \
        wget \
        apache2 \
        dotnet-sdk-7.0 \
        postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# Set the PASSWORD variable for code server login
ENV PASSWORD=changeme

# Download and install VS Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Copy required files to teh docker image
COPY index.html /var/www/html/index.html

# Expose port 80 & 8080
EXPOSE 80
EXPOSE 8080

# Start both code-server and Apache in the foreground
CMD ["sh", "-c", "code-server --bind-addr 0.0.0.0:8080 & apache2ctl -D FOREGROUND"]