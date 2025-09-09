pipeline {
    agent any
    
    environment {
        IMAGE_NAME = "yourdockerhubusername/task12image"
    }

    stages {
        stage('Code Checkout') {
            steps {
                git url: 'https://github.com/Danielshd/daniel-sh.git', branch: 'main'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker push ${IMAGE_NAME}:latest
                    '''
                }
            }
        }
    }
}
