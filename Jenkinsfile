#!/bien/env/grooy

node ('Jenkins') {
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
    
    
    
