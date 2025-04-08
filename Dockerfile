FROM jenkins/jenkins:lts

USER root

# Install Docker
RUN apt-get update && \
    apt-get install -y docker.io && \
    usermod -aG docker jenkins

# Clean up
RUN apt-get clean

# Switch back to Jenkins user
USER jenkins


