pipeline {
    agent any
    environment {
        // Timestamp for versioning the Docker image
        TIMESTAMP = "${currentBuild.startTimeInMillis}"
        // Docker credentials and Docker Hub registry
        registryCredential = 'dockerhub-credentials-id'
        registry = 'monish898/studentsurvey'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    dockerImageBuild = docker.build("${registry}:${env.TIMESTAMP}")
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    docker.withRegistry('', registryCredential) {
                        dockerImageBuild.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Directly specify the image name in kubectl command
                    bat """
                    kubectl set image deployment/hw2-clusterdeployment container-0=${registry}:${env.TIMESTAMP}
                    """
                }
            }
        }
    }
}
