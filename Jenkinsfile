pipeline {
    agent none
    stages {
        stage('Node Tests') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'echo \'Node Tests\''
                sh 'pwd'
                sh 'cd DotnetTemplate.Web'
                sh 'pwd'
                sh 'npm install'
                sh 'npm run build'
                sh 'npm run lint'
                sh 'npm t'
            }
        }
    }
}