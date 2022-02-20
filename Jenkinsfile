pipeline{
  agent {label 'slave'}
  stages{
    stage('Cleaning WS'){
      steps{
        cleanWs()
      }
    }
    stage('repo pulling'){
      steps{
        git branch: 'main', url: ''
        sh "ls"
      }
    }
    stage('Terraform code exucution'){
      steps{
        sh "terraform init"
        sh "terraform plan"
        sh "terraform apply -auto-approve"
      }
    }
    stage('Cleaning WS1'){
      steps{
        cleanWs()
      }
    }
  }
}
