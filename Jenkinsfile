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

    withenv(['ARM_ACCESS_KEY="Hello World"']){
        stage("Deploy Resource Group"){
            sh "echo $ARM_ACCESS_KEY"
        }
    }
}