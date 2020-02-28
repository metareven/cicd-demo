stage('Dev') {
    node {
        checkout scm
	echo "building"
    }
}

stage('Dev Tests') {
    echo "Testing"
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