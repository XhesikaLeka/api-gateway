pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checkout-ing project'
                git 'https://github.com/xhulioxole/api-gateway.git'
                echo 'Checkout Success!'
            }
        }
        stage('Build') {
            steps {
                echo 'Building artifact...'
                sh 'mvn install'
                echo 'Success'
            }
        }
        stage('Docker') {
            steps {
                sh 'sudo docker ps -a'
            }
        }
    }
}