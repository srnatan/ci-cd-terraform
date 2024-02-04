#!/bien/env/grooy

node ('terraform') {
    try {
        checkout scmGit(
        branches: [[name: '*/main']], 
        extensions: [], 
        userRemoteConfigs: [
                [credentialsId: 'git-token', url: 'https://github.com/srnatan/ci-cd-terraform']
            ]
        )
        
        sh 'ls -l'
    }
    catch(caughtError){
        err = caughtError
    }
    finally{
        // cleanWs()
    }
}
    
    
    
