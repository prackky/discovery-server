pipeline {
    agent any
    tools {
        maven '3.9.9'
        jdk 'jdk-21'
    }

    stages {

        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'mvn -DskipTests=true clean package'
                    } else {
                        bat 'mvn -DskipTests=true clean package'
                    }
                }
            }
        }

        stage ('Build Docker Image') {
        	steps {
        		script {
                   if (isUnix()) {
                      sh 'docker build . -t discovery-server:latest'
                   } else {
                      bat 'docker build . -t discovery-server:latest'
                   }
                }
        		echo 'Docker build successful.'
        		script {
                    if (isUnix()) {
                        sh 'docker tag discovery-server:latest localhost:5000/discovery-server'
                    else {
                        bat 'docker tag discovery-server:latest localhost:5000/discovery-server'
                    }
                }
                echo 'Docker image tagged as latest'
        	}
        }

        stage ('Push image to kube Registry') {
        	  steps {
        	    script {
                if (isUnix()) {
                   sh 'docker push localhost:5000/discovery-server:latest'
                } else {
                  bat 'docker push localhost:5000/discovery-server:latest'
                  }
               }
        		echo 'Docker image pushed to repository'
        	  }
        	  post {
        	     success {
        	        echo 'Image deployment successful.'
        	     }
        	  }
        }
    }
}