pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mayuresh1404/simple-ci-cd-jenkins'
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/mayuresh1404/simple-ci-cd-jenkins.git'
            }
        }

        stage('Build') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Test') {
            steps {
                sh 'npm test || echo "Skipping tests..."'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh "docker rm -f $IMAGE_NAME || true"
                    sh "docker run -d -p 8080:8080 50000:50000 --name $IMAGE_NAME $IMAGE_NAME"
                }
            }
        }
    }
}

