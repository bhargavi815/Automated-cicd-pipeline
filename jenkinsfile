pipeline{
    agent any
    stages{
        stage('clone'){
            steps{
                git branch: 'dev', url: 'https://github.com/uday7731/Automated-CI-CD-Pipeline-for-Web-Application.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn build'
            }
        }
        stage('sonar'){
            steps{
                sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=taxi -Dsonar.projectName='taxi' -Dsonar.host.url=http://54.164.168.60:9002 -Dsonar.token=sqp_da871917eb1c1c2f47c9o821e559778605318850'
            }
        }
        stage('nexus'){
            steps{
                nexusArtifactUploader artifacts:[[artifactId:'maven-project', classifier: ,file:'/var/lib/jenkins/workspace/project/taxi-booking-1.0.1.war', type:'war']] credentialsId: 'nexus',groupId:'com.example.maven-project',nexusUrl:'3.86.12.36:8081,'nexusVersion:'nexus3',protocol:'http',repository:'maven-snapshots',version:'1.0-SNAPSHOT'
            }
        }
        stage('docker build & push'){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'docker') {
                        sh 'docker build -t uday7731/project:v2.0.0 .'
                        sh 'docker push uday7731/project:v2.0.0'
                    }
                }
            }
        }
        stage('deploy to k8s'){
            steps{
                script{
                    sh 'aws eks update-kubeconfig --region us-east-1 --name uday'
                    sh 'kubectl create -f deployment.yaml'
                }
            }
        }
    }
} 
