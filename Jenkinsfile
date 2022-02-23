pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: kaniko
    image: harbor.arnoo.com/library/kaniko/executor:debug
    imagePullPolicy: IfNotPresent
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
      - name: jenkins-docker-cfg
        mountPath: /kaniko/.docker
  volumes:
  - name: jenkins-docker-cfg
    projected:
      sources:
      - secret:
          name: kaniko-secret
          items:
            - key: .dockerconfigjson
              path: config.json
"""
    }
  }
  environment {
    APP_NAME = 'flask-demo'
    IMAGE_NAME = 'fc277073030/flask-demo'
    
  }
  stages {
    stage('Build with Kaniko') {
      steps {
        container('kaniko') {
          sh 'ls -l'
          sh '/kaniko/executor -f `pwd`/Dockerfile -c `pwd` --insecure --skip-tls-verify --cache=true --destination=$IMAGE_NAME:$GIT_COMMIT'
        }
      }
    }
  }
}
