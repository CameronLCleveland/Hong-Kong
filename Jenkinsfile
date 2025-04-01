pipeline{
    agent any
    tools {
        jfrog 'jfrog-cli'
    }
    stages {
        stage ('Testing') {
            steps {
                jf '-v' 
                jf 'c show'
                jf 'rt ping'
                sh 'touch test-file'
                jf 'rt u test-file tf--terraform/'
                jf 'rt bp'
                jf 'rt dl tf--terraform/test-file'
            }
        } 
    }
}