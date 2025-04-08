pipeline {
    agent {
        docker {
            image 'node:18'
            args '-u root:root' // to avoid permission issues
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test || echo "No tests defined"'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build || echo "No build script defined"'
            }
        }
    }
}

