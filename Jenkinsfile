pipeline {
    agent any

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
                    def app = docker.build("monish898/studentsurvey")
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        def app = docker.build("monish898/studentsurvey")
                        app.push('latest')
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Directly specify the image name in kubectl command
                    bat """
                    kubectl set image deployment/hw2-cluster-deployment container-0=monish898/studentsurvey:latest
                    """
                }
            }
        }
    }
}
