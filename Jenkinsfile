node {
  properties(
    [
        parameters(
            [string(defaultValue: '/data', name: 'Directory'),
            , string(defaultValue: 'Dev', name: 'DEPLOY_ENV')]
            )

    ]
    )    
    stage("test"){
        echo params.Directory
        echo params.DEPLOY_ENV
    }
}