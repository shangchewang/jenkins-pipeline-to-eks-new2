#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = "AKIAYD6EYUVR5PX2K7BO"
        AWS_SECRET_ACCESS_KEY = "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"
        AWS_DEFAULT_REGION = "ap-southeast-2"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f nginx-deployment.yaml"
                        sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}
