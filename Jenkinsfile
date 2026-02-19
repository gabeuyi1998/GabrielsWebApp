pipeline {
    agent any

    environment {
        DOCKERHUB_CREDS = 'dockerhub-token'     // DockerHub credentials in Jenkins
        AWS_CREDS = 'aws-creds'                 // AWS credentials in Jenkins
        IMAGE = 'gabeuyi1998/gabewebapp'       // DockerHub image name
        CLUSTER = 'GabrielsWebAppCluster'      // ECS cluster name
        SERVICE = 'GabrielsWebAppService'      // ECS service name
        AWS_DEFAULT_REGION = 'ap-southeast-2'  // Your AWS region
    }

    stages {

        stage('Checkout') {
            steps {
                // Pulls your code from GitHub using Jenkins credentials
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE}:latest")
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${DOCKERHUB_CREDS}",
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh "docker push ${IMAGE}:latest"
            }
        }

        stage('Deploy to ECS') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDS}"]]) {
                    sh """
                    aws ecs update-service \
                        --cluster ${CLUSTER} \
                        --service ${SERVICE} \
                        --force-new-deployment
                    """
                }
            }
        }
    }
}
