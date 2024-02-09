#!/bien/env/groovy

node ('Jenkins') {
    err = null
    try {
        stage('Checkout') {
            gitscmvar=checkout scmGit(
            branches: [[name: '*/main']], 
            extensions: [], 
            userRemoteConfigs: [
                    [credentialsId: 'git-token', url: 'https://github.com/srnatan/ci-cd-terraform']
                ]
            )

            sh 'ls -l'
            echo "${gitscmvar}"
        }

        branch = 'main'

        withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding',
                      credentialsId : 'aws-credentials',
                      accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) 
        {

            stage('Init') {
                sh 'terraform init'
            }

            stage('Validate') {
                sh '''terraform fmt
                terraform validate'''
            }

            stage('Plan') {
                sh 'terraform plan -out tfplan'
            }

            stage('Apply') {
                when(branch == 'main')
                {
                    sh 'terraform apply tfplan'
                }
            }
        }
        
    }
    catch(caughtError){  
        err = caughtError
    }
    finally{
        cleanWs()
        if(err){
            throw err
        }
    }
}
    
    
    
