pipeline {
  agent none
  stages {
    stage('test') {
      steps {
        echo 'hello world!'
        chef_cookbook_lint(installation: 'chefdk')
        chef_cookbook_cookstyle(installation: 'chefdk')
      }
    }
  }
}