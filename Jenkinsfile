pipeline {
    agent {
        docker {
            image 'node:18'
            args '-u root:root'  // Use root to install packages if needed
        }
    }

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-creds')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/mayuresh1404/simple-ci-cd-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'chmod +x test.sh && ./test.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_HUB_CREDENTIALS_USR/simple-ci-cd-jenkins .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: 'dockerhub-creds', url: '' ]) {
                    sh 'docker push $DOCKER_HUB_CREDENTIALS_USR/simple-ci-cd-jenkins'
                }
            }
        }
    }
}
