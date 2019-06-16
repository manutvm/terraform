node{
    stage("Checkout SCM"){
        checkout scm
    }

    stage('Deploy Terraform Stage Container') {
        echo "Deploying Azure Terraform Storage Container..."
        dir("Terraform"){
            sh "echo \"terraform init && terraform plan && terraform apply -auto-approve\""            
        }
    }

    withEnv(['ARM_ACCESS_KEY=YBelPNzXSeFOoQE+fIRdD3NjMNVLkbsFIswLQuYX1F0htFlzhvlrLVWYHFkqwpFhEZVpdRc0In+Np0XvRuJm+A==']){
        stage("Deploy Resource Group"){
            dir("ResourceGroup"){
                sh "export ARM_ACCESS_KEY=\${ARM_ACCESS_KEY} && pwd"
            }
        }
    }
}