node{
    stage("checkout"){
        checkout scm
    }

    stage('build') {
        steps {
            echo "Hello World!"
            sh "echo Hello from the shell"
            sh "hostname"
            sh "uptime"
        }
    }
}