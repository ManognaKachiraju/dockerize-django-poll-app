pipeline {
    agent any
    stages 
    {
        stage('Docker Image build') 
        { 
            steps {
              bat 'docker build -t manokac55/django-poll-app:latest .'
            }

        }
        stage("Uploading to DockerHub") 
        {
            steps {
                bat 'docker push manokac55/django-poll-app:latest '
                

            }

        }

        stage("Running docker image")
        {
            steps{
                bat 'docker run -d -p 8000:8000 --name Manogna manokac55/django-poll-app:latest '
            }

        }

        stage("Plan Terraform")
        {
            steps{
                bat 'cd k8s'
                bat 'terraform plan'
            }

        }

        stage("Apply terraform")
        {
            steps{
                bat 'cd k8s'
                bat 'terraform apply'
            }
        }
    }

}
