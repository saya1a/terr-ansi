pipeline {
  agent { label 'ubuntu-node' } 
    stages {
      stage('checkout scm') {
         steps {
        git branch: 'main', url: 'https://github.com/saya1a/terr-ansi.git'
      }
    }
      stage('Terraform init') {
        steps {
          sh 'terraform init'
        }
      }
      stage('Validation') {
        steps {
          sh 'terraform validate'
        }
      }
       stage('Plan') {
        steps {
          sh 'terraform plan'
        }
      }
     /* stage('Apply') {
        steps {
          sh 'terraform destroy --auto-approve'
        }
      }*/
      stage('get-pub-ip') {
        environment {
          pub_ip = sh(returnStdout: true, script: 'terraform output ec2_public_ip').trim()
        }
         steps {
           echo "$pub_ip"
         }
    }
}
}
