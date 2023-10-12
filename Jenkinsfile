pipeline {
  agent { label 'ubuntu-node' }
  environment {
    EC2_PUBLIC_IP = ''
  }
    stages {
      stage('checkout scm') {
         steps {
        git branch: 'main', url: 'https://github.com/saya1a/terr-ansi.git'
      }
    }
      stage('Provision EC2 from Terraform') {
        steps {
          script {
            sh 'terraform init'
            sh 'terraform validate'
            sh 'terraform plan'
            sh 'terraform apply --auto-approve'
            EC2_PUBLIC_IP = sh(returnStdout: true, script: 'terraform output ec2_public_ip').trim()
            sh 'echo $EC2_PUBLIC_IP
          }
        }
      }
      
    }
}

     /* stage('Validation') {
        steps {
          sh 'terraform validate'
        }
      }
       stage('Plan') {
        steps {
          sh 'terraform plan'
        }
      }
      stage('Apply') {
        steps {
          sh 'terraform apply --auto-approve'
        }
      }
      stage('get-pub-ip') {
        environment {
          pub_ip = 
        }
         steps {
           sh 'echo $pub_ip'
         }
    } */
