pipeline {
    agent any
    stages {
        /* "Build" and "Test" stages omitted */

        stage("Build and start test image") {
            steps {
                sh "git pull origin master"
                sh "docker-composer build"
                sh "docker-compose up -d"
                waitUntilServicesReady
            }
        }
        stage('pull-docker') {
            steps {
                sh './tester-jenkins/pull-docker.sh'
            }
        }
        stage('heroku-git') {
            steps {
                sh './tester-jenkins/heroku-git.sh'
            }
        }
    }
    post {

    }
}