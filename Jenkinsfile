pipeline {
  agent any
  environment {
    NEW_VERSION = '1.3.0' // Usually extract from code
//     DOCKER_CREDENTIALS = credentials('docker-hub-credentials') //credentials binding plugin, this is id of created credentials in jenkins
  }
  stages {
    

    stage("Build docker image") {
      when  {
        expression {
            BRANCH_NAME == 'main'
        }

      }

      steps {
        echo 'Building the application...'
//         echo "Building version ${NEW_VERSION}"
        sh 'docker build -t chessmaster21/python:1.0.0 .'
      }
    }


    stage("Push image to hub") {

      steps {
        echo 'pushing the application...'
        withCredentials([
            usernamePassword(credentials: 'docker-hub-credentials', usernameVariable: USR, passwordVariable: PWD)
            ]) {
                sh "docker login -u ${USR} -p ${PWD}"
            }

        sh 'docker push chessmaster21/python:1.0.0'
      }
    }

    stage("Deploy") {
      steps {
        echo 'Deploying the application...'
        echo "ssh into {server} using credentials: "
//         sh "${SERVER_CREDENTIALS}"
      }
    }
  }
//   post {
//     always {
//
//     }
//     success {
//
//     }
//     failure {
//
//     }
//   }
}
