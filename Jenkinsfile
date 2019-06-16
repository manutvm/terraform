node{
    stage("Checkout SCM"){
        checkout scm
    }

    stage('Deploy Terraform Stage Container') {
        echo "Deploying Azure Terraform Storage Container..."
        dir("Terraform"){
            sh "terraform init && terraform plan && terraform apply -auto-approve"            
        }
    }

    withEnv(['ARM_ACCESS_KEY=YBelPNzXSeFOoQE+fIRdD3NjMNVLkbsFIswLQuYX1F0htFlzhvlrLVWYHFkqwpFhEZVpdRc0In+Np0XvRuJm+A==']){
        stage("Deploy Resource Group"){
            echo "Deploying Azure Terraform Resource Group..."
            dir("ResourceGroup"){
                sh """
                export ARM_ACCESS_KEY=\${ARM_ACCESS_KEY} && terraform init && terraform state rm `terraform state list | tr \"\n\" \" \"` && terraform plan && terraform apply -auto-approve
                """
            }
        }
    }

    withEnv(['ARM_ACCESS_KEY=YBelPNzXSeFOoQE+fIRdD3NjMNVLkbsFIswLQuYX1F0htFlzhvlrLVWYHFkqwpFhEZVpdRc0In+Np0XvRuJm+A==']){
        stage("Deploy Virtual Network"){
            echo "Deploying Azure Terraform Virtual Network..."
            dir("VirtualNetwork"){
                sh """
                export ARM_ACCESS_KEY=\${ARM_ACCESS_KEY} && terraform init && terraform state rm `terraform state list | tr \"\n\" \" \"` && terraform plan && terraform apply -auto-approve
                """
            }
        }
    }

    withEnv(['ARM_ACCESS_KEY=YBelPNzXSeFOoQE+fIRdD3NjMNVLkbsFIswLQuYX1F0htFlzhvlrLVWYHFkqwpFhEZVpdRc0In+Np0XvRuJm+A==']){
        stage("Deploy Network Security Group"){
            echo "Deploying Azure Terraform Network Security Group..."
            dir("NetworkSecurityGroup"){
                sh """
                export ARM_ACCESS_KEY=\${ARM_ACCESS_KEY} && terraform init && terraform state rm `terraform state list | tr \"\n\" \" \"` && terraform plan && terraform apply -auto-approve
                """
            }
        }
    }

    withEnv(['ARM_ACCESS_KEY=YBelPNzXSeFOoQE+fIRdD3NjMNVLkbsFIswLQuYX1F0htFlzhvlrLVWYHFkqwpFhEZVpdRc0In+Np0XvRuJm+A==']){
        stage("Deploy Virtual Machine"){
            echo "Deploying Azure Terraform Virtual Machine..."
            dir("VirtualMachine"){
                sh """
                export ARM_ACCESS_KEY=\${ARM_ACCESS_KEY} && terraform init && terraform state rm `terraform state list | tr \"\n\" \" \"` && terraform plan && terraform apply -auto-approve
                """
            }
        }
    }
}