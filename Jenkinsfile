pipeline {
    agent none
    stages {
        stage('Node Tests') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'echo \'Node Tests\''
                dir("DotnetTemplate.Web") {
                    sh 'pwd'
                    sh 'npm install'
                    sh 'npm run build'
                    sh 'npm run lint'
                    sh 'npm t'
                }
            }
        }
    }
}