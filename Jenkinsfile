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
        
        stage("Terraform init")
        {
            steps{
                bat 'cd tf-aks && terraform init'
            }
        }

        stage("Plan Terraform")
        {
            steps{
                bat 'cd tf-aks && terraform plan '
            }

        }

        stage("Apply terraform")
        {
            steps{
                bat 'cd tf-aks && terraform apply -auto-approve '
               
            }
        }

        stage("Deployment")
        {
            steps{
                bat 'az aks  get-credentials --resource-group django-app  --name poll-app-aks1 --overwrite-existing'
                bat 'kubectl apply -f deployment.yaml'
            }
        }

    }

}