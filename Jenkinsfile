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

    withEnv(['ARM_ACCESS_KEY=Hello']){
        stage("Deploy Resource Group"){
            sh "echo \${ARM_ACCESS_KEY}"
        }
    }
}