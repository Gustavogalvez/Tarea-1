pipeline {
    agent any
    stages {
        /* "Build" and "Test" stages omitted */

        stage("Build and start test image") {
            steps {
                sh 'git pull origin master'
                sh 'docker build -t ribbit-web .'
                waitUntilServicesReady
            }
        }
        stage('pull-docker') {
            steps {
                sh './tester-jenkins/pull-docker.sh'
                sh 'git push'
                sh 'docker login'
                sh 'heroku login'
                sh 'heroku container:login'
                sh 'heroku container:push web --app dockeribbit'
            }
        }
    post {
        always{
            deleteDir()
        }
        success {
            echo 'terminado'
        }
        failure {
            mail to: 'gustavogalveza@gmail.com',
            subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
            body: "Something is wrong with ${env.BUILD_URL}"
        }
    }
}