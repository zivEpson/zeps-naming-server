pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                //docker linux agent
                sh './mvnw clean package'
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
