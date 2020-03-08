stage('Build') {
    node {
        checkout scm
	echo $env.BRANCH_NAME
	echo building
	docker build -t "lars/hello-world:$env.BRANCH_NAME" . 
    }
}

stage('Dev') {
    node {
        docker run -d --name hello-world-$env.BRANCH_NAME lars/hello-world:$env.BRANCH_NAME	
    }
}

stage('Dev Tests') {
    echo "Testing"
    docker exec  hello-world-$env.BRANCH_NAME npm run test
}

milestone 1
stage('Stage') {
   echo "deploying to stage"
}

stage('Stage tests') {
    echo "Testing"
}

milestone 2
stage ('Production') {
    echo "deploying to production"
}