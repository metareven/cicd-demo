pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        checout scm
        echo $env.BRANCH_NAME
        echo "building"
        sh 'docker build -t "lars/hello-world:$env.BRANCH_NAME" .'
      }
    }
    
    stage('Dev') {
      steps {
       sh ' docker run -d --name hello-world-$env.BRANCH_NAME lars/hello-world:$env.BRANCH_NAME'	
      }
    }

    stage('Dev Tests') {
      steps {
        echo "Testing"
        sh 'docker exec  hello-world-$env.BRANCH_NAME npm run test'
      }
    }

    
    stage('Stage') {
      steps {
        echo "deploying to stage"
      }	
    }

     stage('Stage tests') {
       steps {
         echo "Testing"
       }
    }

    stage ('Production') {
      steps {
        echo "deploying to production"
      }	
    }
  }
}
