pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "gabeuyi1998/gabrielswebapp:latest"
        AWS_REGION   = "ap-southeast-2"
        ECS_CLUSTER  = "GabrielsWebAppCluster"
        ECS_SERVICE  = "GabrielsWebAppService"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:gabeuyi1998/GabrielsWebApp.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building app..."
                sh 'echo Build step placeholder' 
                // Replace with your actual build command, e.g., npm install or mvn package
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'echo Test step placeholder'
                // Replace with your actual test command
            }
        }

        stage('Docker Build & Push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKERHUB_TOKEN')]) {
                    sh '''
                        docker login -u gabeuyi1998 -p $DOCKERHUB_TOKEN
                        docker build -t $DOCKER_IMAGE .
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }

        stage('Deploy to AWS ECS') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
                    sh '''
                        aws ecs update-service \
                            --cluster $ECS_CLUSTER \
                            --service $ECS_SERVICE \
                            --force-new-deployment \
                            --region $AWS_REGION
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline succeeded!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}Jenkinsfile
