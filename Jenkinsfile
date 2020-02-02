pipeline {
  agent any

  options {
    disableConcurrentBuilds()
    parallelsAlwaysFailFast()
    retry(1)
    skipStagesAfterUnstable()
    timeout(time: 10, unit: 'MINUTES')
  }

  stages {
    stage("ENV") {
      steps {
        script {
          env.BUILD_TAG = env.BRANCH_NAME.toString().hashCode()
        }
      }
    }

    stage("Create image") {
      when {
        branch 'master'
      }

      steps {
        sh label: 'container', script: ''' #!/usr/bin/env bash
        # build release artifact
        sudo docker build -t concat/notebook:$BUILD_NUMBER -t concat/notebook:latest .

        # tag release
        sudo docker tag concat/notebook:$BUILD_NUMBER registry.conc.at/concat/notebook:$BUILD_NUMBER
        sudo docker tag concat/notebook:latest registry.conc.at/concat/notebook:latest

        # push to registry
        sudo docker push registry.conc.at/concat/notebook:$BUILD_NUMBER
        sudo docker push registry.conc.at/concat/notebook:latest
        '''
      }
    }
  }
}
