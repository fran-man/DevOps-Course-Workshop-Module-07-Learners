pipeline {
    stages {
        stage('Node Build and Test') {
            agent {
                docker { image 'node:14-alpine' }
            }

            stages {
                stage('Node build') {
                    steps {
                        sh 'echo \'Node Tests\''
                        dir("DotnetTemplate.Web") {
                            sh 'pwd'
                            sh 'npm install'
                            sh 'npm run build'
                        }
                    }
                }

                stage('Node Test') {
                    steps {
                        sh 'echo \'Node Tests\''
                        dir("DotnetTemplate.Web") {
                            sh 'pwd'
                            sh 'npm run lint'
                            sh 'npm t'
                        }
                    }
                }
            }
        }
    }
}