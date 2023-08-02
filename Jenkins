pipeline {
    agent any
    stages {
        stage('CleanUp Stage') {
            steps {
            //define the single or multiple step
            bat 'echo CleanUp Stage'
            cleanWs notFailBuild: true
            }

        }
       stage('Git Checkout') {
            steps {
             bat 'echo Git Checkout'
             checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Diego-Ram/AUT_Karate_MyStoreApi.git']])
            }
       }
        stage('Restore Package Stage') {
            steps {
            bat 'echo Restore Package'}
        }
       stage('Build Stage') {
            steps {
             bat 'echo Build'
             bat 'mvn clean compile'

            }
       }
        stage('Deploy') {
            steps {
            bat 'echo Deploying the application..'}
        }
        stage('Run the Test') {
            steps {
            bat 'echo Test Execution Started'
            bat 'mvn test'
            bat 'echo Test Execution Completed'}
        }
    }
    post {
        always {
    junit 'target/surefire-reports/*.xml'
    cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Excecution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
  }
}
}