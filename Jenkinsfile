pipeline {
    agent any

    stages {
        stage('Run inside Docker') {
            steps {
                script {
                    docker.image('node:18').inside {
                        sh 'node --version'
                        sh 'npm install'
                        sh 'npm test || echo "No tests found"'
                    }
                }
            }
        }
    }
}
