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
        stage('Build Artifact') {
            steps {
                echo 'Building artifact...'
                sh 'mvn clean install'
                echo 'Success'
            }
        }
 
        stage('Deploy to Nexus') {
            steps {
                script {
                    env.artifactVersion = readFile('version.txt').trim()
                }
                nexusPublisher nexusInstanceId: 'nexusLocal', nexusRepositoryId: 'releases', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: "target/apigateway-${env.artifactVersion}.jar"]], mavenCoordinate: [artifactId: 'apigateway', groupId: 'apigateway', packaging: 'jar', version: "${env.artifactVersion}"]]]
            }
        }

        stage('Create artifact copy') {
            steps {
                sh 'cp target/apigateway-*.jar target/apigateway-RELEASE.jar'
            }
        }
        
        stage('Create Docker Image') {
            steps {
                sh 'docker build -t api_gateway_image .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker stop api_gateway'
                sh 'docker rm api_gateway'
                sh 'docker run -d -p 8080:8080 --link config_service:config_service --name api_gateway api_gateway_image'
            }
        }
    }
}
