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
                    // Build the Docker image
                    def app = docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        def app = docker.build("${DOCKER_IMAGE}")
                        app.push('latest')
                    }
                }
            }
        }

        // stage('Deploy to Local Kubernetes') {
        //     steps {
        //         script {
        //             // Run Kubernetes commands to update the deployment
        //             bat '''
        //             kubectl set image deployment/studentsurvey-deployment studentsurvey=${DOCKER_IMAGE}:latest
        //             kubectl apply -f kubernetes/deployment.yaml
        //             '''
        //         }
        //     }
        // }
    }
}
