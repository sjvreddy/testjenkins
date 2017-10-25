pipeline {
  agent none
  stages {
    stage('test') {
      steps {
        parallel(
          "Test": {
            chef_cookbook_cookstyle()
            
          },
          "Staging": {
            chef_cookbook_cookstyle(installation: 'chefdk')
            chef_cookbook_functional(installation: 'chefdk')
            
          }
        )
      }
    }
  }
}