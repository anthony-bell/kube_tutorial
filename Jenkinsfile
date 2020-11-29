pipeline {
  agent any
//   environment {
// //     BUILD_TAG = '1.0.0' // Usually extract from code
// //     DOCKER_CREDENTIALS = credentials('docker-hub-credentials') //credentials binding plugin, this is id of created credentials in jenkins
//   }
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
        withCredentials([
            usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USR', passwordVariable: 'PWD')
            ]) {

                script {
                    docker.withRegistry('https://hub.docker.com/', "docker login -u ${USR} -p ${PWD}") {
//                       git '…'
                      docker.build('python').push("${env.BUILD_TAG}")
                    }
                }
            }


      }
    }


    stage("Push image to hub") {

      steps {
        echo 'pushing the application...'
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
