pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'monish898/studentsurvey'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git branch: 'main', url: 'https://github.com/monishd-viper/hw2-swe-645.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def app = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        def app = docker.build("${DOCKER_IMAGE}")
                        app.push('latest')
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Update the Kubernetes deployment with the new Docker image and container name
                    bat '''
                    kubectl set image deployment/hw2-cluster-deployment container-0=${DOCKER_IMAGE}:latest
                    kubectl apply -f kubernetes/deployment.yaml
                    '''
                }
            }
        }
    }
}
