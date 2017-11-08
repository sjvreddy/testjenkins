pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
      args '-u 0:0 -v /var/run/docker.sock:/var/run/docker.sock  -v /Users/sjvreddy/.dokken:/root/.dokken'
    }
    
  }
  stages {
    stage('Chef') {
      steps {
        parallel(
          "Chef Cookbook Unit": {
            chef_cookbook_unit()
            
          },
          "Publish": {
            chef_cookbook_publish()
            
          }
        )
      }
      post {
        always {
          warnings(canComputeNew: false, canResolveRelativePaths: false, categoriesPattern: '', consoleParsers: [[parserName: 'ChefCookbookLint']], defaultEncoding: '', excludePattern: '', healthy: '', includePattern: '', messagesPattern: '', unHealthy: '')
          junit '*_junit.xml'
          archive '*_junit.xml'
          
        }
        
      }
    }
  }
}