pipeline {

    agent { label 'docker-python-worker' }

    stages {

        stage("Run PyLint") {
            steps {
                script {
                    sh 'pylint --rcfile=pylint.cfg app/*.py --disable=W1202 --output-format=parseable --reports=no > pylint.log || echo "pylint exited with $?"'
                    sh 'cat pylint.log'
                }
            }
        }
    }

    post {
        always {
            recordIssues(
                    tool: pyLint(pattern: 'pylint.log'),
                    unstableTotalAll: 20,
                    failedTotalAll: 30
                )
            cleanWs()
        }
    }
}