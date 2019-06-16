node{
    stage("Checkout SCM"){
        checkout scm
    }

    stage('Deploy Terraform Stage Container') {
        echo "Hello World!"
        dir("Terraform"){
            sh "pwd"
        }
    }
}