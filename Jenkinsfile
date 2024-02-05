#!/bien/env/groovy

node ('Jenkins') {
    try {
        stage('Checkout') {
            checkout scmGit(
            branches: [[name: '*/main']], 
            extensions: [], 
            userRemoteConfigs: [
                    [credentialsId: 'git-token', url: 'https://github.com/srnatan/ci-cd-terraform']
                ]
            )

            sh 'ls -l'
        }

        stage('Init') {
            sh 'terraform init'
        }

        stage('Validate') {
            sh '''terraform fmt
            terraform validate'''
        }

        stage('Plan') {
            sh 'terraform plan'
        }

        stage('Apply') {
            sh 'terraform apply'
        }
        
    }
    catch(caughtError){
        err = caughtError
    }
    finally{
        // cleanWs()
    }
}
    
    
    
