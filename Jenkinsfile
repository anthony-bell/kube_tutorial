pipeline {
  agent any
  environment {
    BUILD_TAG = '1.0.0' // Usually extract from code
    DOCKER_REG = 'chessmaster21'
    PROD_SERVER = '52.53.223.118'
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
        echo "Building version ${BUILD_TAG}"
        withCredentials([
        usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USR', passwordVariable: 'PWD')
        ]) {

                script {
                    def dockerHome = tool 'myDocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                    def	image = docker.build("${USR}/python:${BUILD_TAG}")
                    sh "docker login -u ${USR} -p ${PWD}"
                    image.push()


                }
        }
      }
    }


    stage("Push image to hub") {

      steps {
        echo 'pushing the application...'
      }
    }

    stage("Deploy container on Dev server") {
      steps {
        echo 'Deploying the application to ${PROD_SERVER}...'
        echo "ssh into ${PROD_SERVER} using credentials: "
        sshagent(['dev-pem-key']){
            script {
                def dockerRun = "docker run -it -d --name python-emoji ${DOCKER_REG}/python:${BUILD_TAG}"
                sh "ssh -o StrictHostKeyChecking=no ec2-user@${PROD_SERVER} ${dockerRun}"

            }
        }
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
