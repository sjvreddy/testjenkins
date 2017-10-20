pipeline {
  agent none
  stages {
    stage('test') {
      steps {
        echo 'hello world!'
        chef_cookbook_lint(installation: '/opt/chefdk/bin')
        chef_cookbook_cookstyle(installation: 'chefdk')
      }
    }
  }
}