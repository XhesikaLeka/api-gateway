pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                sh 'pwd'
                script {
                    def exists = fileExists 'api-gateway'   
                    if (!exists) {
                        echo 'Dir does not exists! Creating dir ...'
                        new File('api-gateway').mkdir();
                        echo 'Dir api-gateway created!'
                    }
                }
                // dir ('api-gateway') {
                //     git 'https://github.com/xhulioxole/api-gateway.git'
                //     echo 'Success'
                // }
            }
        }
    }
}