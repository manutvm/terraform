node {
  properties(
    [
        parameters(
            [choice(
                choices: ['--- Select Choice ---','create','destroy'],
                descrition: 'Select Choice(Create/Destroy) Resouce',
                name: 'choice'
            )]
            )

    ]
    )    
    stage("test"){
        if(params.choice == "create"){
            echo "Hu... Creating Cluster..."
        }
    }
}