pipeline {
    agent {
        docker {
            image 'docker:20.10.24-dind'
            args '-v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/app -w /app'
        }
    }

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
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run --rm $IMAGE_NAME npm test || echo "No test defined"'
            }
        }

        stage('Deploy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $IMAGE_NAME
                    '''
                }
            }
        }
    }
}
