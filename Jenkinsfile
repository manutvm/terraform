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

    stage("Deploy Resource Group"){
        environment {
            ARM_ACCESS_KEY = sh "export ARM_ACCESS_KEY=\$(grep primary_access_key terraform.tfstate | cut -d\"\"\" -f4)"   
        }

        sh "echo $ARM_ACCESS_KEY"
    }
}