pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        checkout scm
        echo "building"
        sh 'docker build -t "lars/hello-world:$GIT_BRANCH" .'
      }
    }
    
    stage('Dev') {
      when {
        branch 'master'
      }
      steps {
       sh ' docker kill hello-world-$GIT_BRANCH || echo ""'
       sh ' docker rm hello-world-$GIT_BRANCH || echo ""'
       sh ' docker run -d --network=demo --name hello-world-$GIT_BRANCH lars/hello-world:$GIT_BRANCH'	
      }
    }

    stage('Dev Tests') {
      when {
        branch 'master'
      }
      steps {
        echo "Testing"
        sh 'docker exec  hello-world-$GIT_BRANCH npm run test'
      }
    }

    
    stage('Stage') {
      when {
        branch 'master'
      }
      steps {
        echo "deploying to stage"
      }	
    }

     stage('Stage tests') {
       when {
        branch 'master'
       }
       steps {
         echo "Testing"
       }
    }

    stage ('Production') {
      when {
        branch 'master'
      }
      steps {
        echo "deploying to production"
      }	
    }
  }
}
