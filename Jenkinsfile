pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from the repository
                git 'https://github.com/CherryRishi/my-assessment.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install the required dependencies
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Run the build script
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                // Run the tests
                sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application (this is a placeholder, adapt to your deployment strategy)
                sh '''
                echo "Deploying to production server"
                scp -r * user@your-server:/var/www/html/your-app
                '''
            }
        }
    }

    post {
        always {
            // Clean up the workspace
            cleanWs()
        }
        success {
            // Notify on success (optional)
            echo 'Build and deployment successful!'
        }
        failure {
            // Notify on failure (optional)
            echo 'Build or deployment failed!'
        }
    }
}
