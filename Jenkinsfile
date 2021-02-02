pipeline {
    agent none
    stages {
        stage('Node Tests') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'echo \'Node Tests\''
                sh 'cd DotnetTemplate.Web'
                sh 'npm run build'
                sh 'npm run lint'
                sh 'npm t'
            }
        }
    }
}