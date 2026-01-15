pipeline {
    agent any

    environment {
        TOMCAT_WEBAPPS = '/var/lib/tomcat10/webapps'
        JAVA_HOME = '/usr/lib/jvm/java-21-openjdk-amd64'
        PATH = "${JAVA_HOME}/bin:${env.PATH}"
    }

    stages {

        stage('Checkout') {
            steps {
                echo '📥 Checking out source code'
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                echo '🛠 Building WAR'
                sh '''
                    chmod +x build.sh
                    ./build.sh
                '''
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                echo '🚀 Deploying to Tomcat'
                sh '''
                    cp mywebapp.war ${TOMCAT_WEBAPPS}/
                '''
            }
        }
    }

    post {
        success {
            echo '✅ CI/CD Pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Check logs.'
        }
    }
}
