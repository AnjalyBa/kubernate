pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
		registry = "anjalyb/kubernatesproject"
		dockerImage = ''
	}
    stages {
        stage('gitclone') {

			steps {
				git 'https://github.com/AnjalyBa/kubernate.git'
                
            }
        }
    stage('build and tag'){
        steps{
            script {
            sh ' docker build -t kubernate:latest .'
            sh 'docker tag kubernate:latest anjalyb/kubernatesproject:$BUILD_NUMBER'
            }
            
        }
        
    }
    stage('push it to repo'){
        steps{
            script {
         sh ''' echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                 docker push anjalyb/kubernatesproject:$BUILD_NUMBER '''
            }
        }
    }
    stage('deployment'){
        steps{
            sh ''' kubectl create deployment app.$BUILD_NUMBER --image=anjalyb/kubernatesproject:$BUILD_NUMBER  --replicas=3'''
        }
    }
}
}
