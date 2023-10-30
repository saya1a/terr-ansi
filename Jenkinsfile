pipeline {
  agent { label 'kworker1' }
  environment {
    EC2_PUBLIC_IP = '54.234.73.40'
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
          }
        }
      }
      stage('Install Docker with Ansible') {
            steps {
                script {
                    // Create an Ansible inventory file
                   // writeFile file: 'ansible-inventory.ini', text: "[ubuntu]\n${EC2_PUBLIC_IP} ansible_ssh_user=ubuntu\n"

                    // Run the Ansible playbook to install Docker
                    sh 'ansible-playbook -i ansible-inventory.ini -u ubuntu -b -e "ansible_python_interpreter=/usr/bin/python3" instll-docker.yml'
                }
            }
        }
      
    }
}

  
