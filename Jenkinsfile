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
        echo ${Directory}
        echo ${DEPLOY_ENV}
    }
}