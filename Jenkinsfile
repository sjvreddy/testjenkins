pipeline {
  agent none
  stages {
    stage('Test') {
      steps {
        parallel(
          "Test": {
            chef_cookbook_cookstyle(installation: 'chefdk')
            
          },
          "Stage": {
            chef_cookbook_foodcritic(installation: 'chefdk')
            
          }
        )
      }
    }
  }
}