node{
    properties(
    [
        parameters(
            [choice(
                choices: ['--- Select Choice ---','create','destroy'],
                description: 'Select Choice(Create/Destroy) Resouce',
                name: 'choice'
            )]
            )

    ]
    )    

    stage("Checkout SCM"){
        checkout scm
    }

    stage('Deploy Terraform Stage Container') {
        if(params.choice=="create"){
            echo "Deploying Azure Terraform Storage Container..."
            dir("Terraform"){
                sh "terraform init && terraform plan && terraform apply -auto-approve"            
            }
        }
    }
}