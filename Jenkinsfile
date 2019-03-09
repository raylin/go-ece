pipeline {

  agent any

  environment {
    GIT_COMMIT_SHORT = sh(
        script: "printf \$(git rev-parse --short=10 ${GIT_COMMIT})",
        returnStdout: true
        )
  }

  stages {

    stage('Build') {
      steps {
        script {
          docker.build("go-ece:latest", "--compress .")
        }
      }
    }

    stage('Cleanup') {
      steps {
        sh 'docker image prune -f'
      }
    }

  }
}
