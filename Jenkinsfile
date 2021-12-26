pipeline {
    agent any

    stages {
        stage('Checkout') {
             steps {
                git branch: 'main', url: 'https://github.com/zivEpson/zeps-naming-server.git'
             }
        }
        stage('Build') {
            steps {
                //docker linux agent
                sh './mvnw clean package'
            }

            post {
                always {
                         junit '**/target/surefire-reports/TEST-*.xml'
                         archiveArtifacts 'target/*.jar'
                     }
                 }
        }
    }
}
