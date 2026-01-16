pipeline {
    agent any

    environment {
        IMAGE_NAME = "jenkins-tomcat-app"
        CONTAINER_NAME = "tomcat-app"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/pankajdixit52/jenkins-demo.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Deploy') {
            steps {
                sh '''
                docker rm -f $CONTAINER_NAME || true
                docker run -d \
                  -p 9095:8080 \
                  --name $CONTAINER_NAME \
                  $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Dockerized Deployment Successful!"
        }
        failure {
            echo "❌ Pipeline Failed"
        }
    }
}
