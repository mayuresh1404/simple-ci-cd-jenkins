pipeline {
    agent any

    stages {
        stage('Pull Docker Image') {
            steps {
                sh 'docker pull node:18'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-node-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run --rm my-node-app'
            }
        }
    }
}
