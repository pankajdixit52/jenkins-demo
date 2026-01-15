pipeline {
    agent any

    environment {
        TOMCAT_WEBAPPS = '/var/lib/tomcat10/webapps'
        JAVA_HOME = '/usr/lib/jvm/java-21-openjdk-amd64'
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

        stage('Deploy to Tomcat') {
            steps {
                // Copy WAR to Tomcat webapps (ensure permission is set correctly)
                sh 'cp mywebapp.war $TOMCAT_WEBAPPS/'
            }
        }
    }

    post {
        success {
            echo '✅ Build and Deployment Successful!'
        }
        failure {
            echo '❌ Build or Deployment Failed!'
        }
    }
}
