pipeline{

	agent {label 'linux'}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('anjalyb')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/AnjalyBa/kubernate.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t anjalyb/kubernatesproject:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push anjalyb/kubernatesproject:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
