pipeline {
    agent any
    environment {
        AWS_REGION = 'ap-east-1'  // Updated region to ap-east-1 (Hong Kong)
    }
    stages {
        stage('Set AWS Credentials') {
            steps {
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: 'AWS_ACCESS_KEY' 
                ]]) {
                    sh '''
                    echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"
                    aws sts get-caller-identity  # Directly use aws CLI instead of docker
                    '''
                }
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/CameronLCleveland/Hong-Kong.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: 'AWS_ACCESS_KEY' 
                ]]) {
                    sh '''
                    aws sts get-caller-identity  # Directly use aws CLI instead of docker
                    terraform init  # Initialize terraform directly
                    '''
                }
            }
        }

        stage('Plan Terraform') {
            steps {
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: 'AWS_ACCESS_KEY' 
                ]]) {
                    sh '''
                    aws sts get-caller-identity  # Directly use aws CLI instead of docker
                    terraform plan -out=tfplan  # Plan terraform directly
                    '''
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                input message: "Approve Terraform Apply?", ok: "Deploy"
                withCredentials([[ 
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: 'AWS_ACCESS_KEY' 
                ]]) {
                    sh '''
                    aws sts get-caller-identity  # Directly use aws CLI instead of docker
                    terraform apply -auto-approve tfplan  # Apply terraform changes directly
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Terraform deployment completed successfully!'
        }
        failure {
            echo 'Terraform deployment failed!'
        }
    }
}
