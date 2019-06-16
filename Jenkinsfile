node{
    stage("Checkout SCM"){
        checkout scm
    }

    stage('Deploy Terraform Stage Container') {
        echo "Hello World!"
        dir("Terraform"){
            sh "terraform init && terraform plan && terraform apply -auto-approve"         
        }
    }

    withEnv(['ARM_ACCESS_KEY = sh "grep primary_access_key Terraform/terraform.tfstate | cut -d\"\"\" -f4"']){
        stage("Deploy Resource Group"){
            sh "echo ${ARM_ACCESS_KEY}"
        }
    }
}