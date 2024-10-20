pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'monish898/studentsurvey'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/monishd-viper/hw2-swe-645.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image locally
                    def app = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}").inside("-w /jenkins_workspace -v ${WORKSPACE}:/jenkins_workspace") {
                        bat 'echo Running tests'
                    }
                }
            }
        }

        stage('Deploy to Local Kubernetes') {
            steps {
                script {
                    bat '''
                    kubectl set image deployment/studentsurvey-deployment studentsurvey=${DOCKER_IMAGE}:latest
                    kubectl apply -f kubernetes/deployment.yaml
                    '''
                }
            }
        }
    }
}
