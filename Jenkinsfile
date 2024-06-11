pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yassineben22/jenkins-deployment']])
                bat 'mvn clean install'
            }
        }
        stage('Build Docker image'){
            steps {
                script {
                    bat 'docker build -t yassineben22/deploy-automation .'
                    
                }
            }
        }
        stage('Push image to Docker hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerpwd')]) {
                        bat 'docker login -u yassineben22 -p ' + dockerpwd
                    }
                    bat 'docker push yassineben22/deploy-automation'
                }
            }
        }
        stage('Docker compose'){
            steps {
                script {
                    bat 'docker-compose up -d'
                }
            }
        }
    }
}