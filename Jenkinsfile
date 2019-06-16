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
        echo param.Directory
        echo param.DEPLOY_ENV
    }
}