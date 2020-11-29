pipeline {
  agent any
  environment {
    BUILD_TAG = '1.0.0' // Usually extract from code
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
        def pythonApp = docker.build "chessmaster21/python:${BUILD_TAG}"
        pythonApp.push()
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
