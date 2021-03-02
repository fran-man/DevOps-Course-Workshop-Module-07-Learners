pipeline {
    agent none
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

        stage('.NET Build and Test') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:3.1' }
            }

            environment {
                DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
            }

            stages {
                stage('.NET Build') {
                    steps {
                        sh 'echo \'.NET Build\''
                        sh 'dotnet build'
                    }
                }

                stage('.NET Test') {
                    steps {
                        sh 'echo \'.NET Test\''
                        sh 'dotnet test'
                    }
                }
            }
        }
    }

    post {
       // only triggered when blue or green sign
       success {
           slackSend color: "good", message: "Build Success"
       }
       // triggered when red sign
       failure {
           slackSend color: "bad", message: "Build Failure!"
       }
    }
}