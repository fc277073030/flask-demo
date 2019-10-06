def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, cloud: 'kubernetes',  namespace: "jenkins", serviceAccount: "my-jenkins",
    containers: [
        containerTemplate(name: 'docker', image: 'docker:stable', command: 'cat', ttyEnabled: true,),
        containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.12.5', command: 'cat', ttyEnabled: true),
        containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true),
    ],
    volumes: [
            hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock'),
        ]) {
        node(label) {

            stage(' build and push image') {
                def myRepo = checkout scm
                def gitCommit = myRepo.GIT_COMMIT
                def gitBranch = myRepo.GIT_BRANCH
                def shortGitCommit = "${gitCommit[0..7]}"
                container('docker') {
                        withCredentials([[$class: 'UsernamePasswordMultiBinding',
                          credentialsId: 'dockerhub',
                          usernameVariable: 'DOCKER_HUB_USER',
                          passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
                            sh """
                                docker build -t ${DOCKER_HUB_USER}/flask-demo:${shortGitCommit} .
                                docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}
                                docker push ${DOCKER_HUB_USER}/flask-demo:${shortGitCommit}
                            """
                        }
                }

            }

        }
    }