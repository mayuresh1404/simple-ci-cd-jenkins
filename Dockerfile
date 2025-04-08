FROM jenkins/jenkins:lts

USER root

# Install Docker CLI (if not already present)
RUN apt-get update && apt-get install -y docker.io

# Add Jenkins user to the docker group (assuming GID matches the host's docker group)
RUN groupadd -g 999 docker && usermod -aG docker jenkins

USER jenkins



