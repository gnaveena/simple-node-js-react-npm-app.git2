pipeline {
    agent any 
        
    environment { 
        CI = 'true'
    }

    
  stages {
      
        
    stage('Cloning Git') {
      steps {
        git 'https://github.com/gnaveena/simple-node-js-react-npm-app.git2.git'
      }
    }
    stage('Build') { 
     steps {
      sh 'npm install && npm run build' 
           }
    }
    
    
	stage('Test') {
            
            steps {
                
                sh './jenkins/scripts/test.sh'
            }
        }
    stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh './jenkins/scripts/kill.sh' 
                
            }
        }
	stage('Deploy') {
            
            steps {
                withAWS(region:'us-east-1',credentials:'awsId008') {
		        s3Delete(bucket: 'simple-node-js', path:'**/*')
		        s3Upload(bucket: 'simple-node-js', workingDir:'build', includePathPattern:'**/*');
		
            }
        }
	}
}
}
