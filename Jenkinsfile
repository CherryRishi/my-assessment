pipeline {
    agent any

    environment {
        PROJECT_ID = 'my-assessment-434612'
        DOCKER_IMAGE = "gcr.io/$PROJECT_ID/my-app"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/CherryRishi/my-assessment.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Test') {
            steps {
                sh 'npm install'
                sh 'npm test' // or other test command
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
        }

        stage('Deploy to Compute Engine') {
            steps {
                sh '''
                gcloud compute instances update-container web-server \
                  --zone=us-central1-a \
                  --container-image=$DOCKER_IMAGE
                '''
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
