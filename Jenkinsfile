def docker_compose(String cmd, String postfix="") {
    sh "docker-compose -p '${BUILD_TAG}${postfix}' -f docker-compose.yml ${cmd}"
}

pipeline {
    agent any

    stages {
        stage("Build") {
            steps {
                docker_compose("build")
            }
        }

        stage("Test") {
            steps {
                docker_compose("run --rm app isort -rc -c .")
                docker_compose("run --rm app black --check .")
                docker_compose("run --rm app pytest --cov=.")
            }
            post {
                always {
                    docker_compose("down --remove-orphans")
                }
            }
        }
    }

    post {
        always {
            docker_compose("down --remove-orphans")
        }
    }
}
