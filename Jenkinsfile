pipeline {
environment {
        registry = "ze888899/zeps"
        registryCredential = 'dockerhub_id'
        dockerImage = 'naming-service'
    }
    agent any

    stages {
        stage('Build') {
            steps {
                //docker linux agent
                sh './mvnw clean package'
            }
        }
        stage('Building our image') {
            steps {
                script {
                       dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }
        }

     post {
            always {
                 junit '**/target/surefire-reports/TEST-*.xml'
                 archiveArtifacts 'target/*.jar'
             }
     }
}
