pipeline {
    agent any
    stages 
    {
        stage('Docker Image build') 
        { 
            steps {
              bat 'docker build -t ayushishu/django-poll-app:latest .'
            }

        }
        stage("Uploading to DockerHub") 
        {
            steps {
                bat 'docker push ayushishu/django-poll-app:latest '
                

            }

        }

        stage("Running docker image")
        {
            steps{
                bat 'docker run  ayushishu/django-poll-app:latest -p 8000:8000'
            }

        }
    }

}
