# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set environment variables
ENV MINECRAFT_VERSION=1.20.1
ENV MINECRAFT_HOME=/minecraft
ENV EULA=true

# Create minecraft directory
RUN mkdir -p $MINECRAFT_HOME
WORKDIR $MINECRAFT_HOME

# Download the Minecraft server jar
RUN apt-get update && apt-get install -y curl && \
    curl -o server.jar https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Accept the EULA
RUN echo "eula=true" > eula.txt

# Expose the Minecraft server port
EXPOSE 25565

# Run the Minecraft server
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
