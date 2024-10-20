pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'monish898/studentsurvey'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the repository code from GitHub
                git branch: 'main', url: 'https://github.com/monishd-viper/hw2-swe-645.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image locally
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Optionally run tests inside the Docker container
                    docker.image("${DOCKER_IMAGE}").inside {
                        sh 'echo Running tests'
                    }
                }
            }
        }

        stage('Deploy to Local Kubernetes') {
            steps {
                script {
                    // Apply the Kubernetes deployment using local kubeconfig
                    // Ensure kubeconfig is properly set on your local machine
                    sh '''
                    kubectl set image deployment/studentsurvey-deployment studentsurvey=${DOCKER_IMAGE}:latest
                    kubectl apply -f kubernetes/deployment.yaml
                    '''
                }
            }
        }
    }
}
