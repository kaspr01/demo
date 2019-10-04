pipeline {
     agent any
     stages {
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
         
		   //stage("Code coverage") {
  //   steps {
         // sh "./gradlew jacocoTestReport"
         // sh "./gradlew jacocoTestCoverageVerification"
     //}z
//}
		  
stage("Package") {
     steps {
          sh "./gradlew build"
     }
}

stage("Docker build") {
     steps {
	     
          sh "docker build -t nikhilnidhi/calculator_1 ."
     }
}

stage("Docker push") {
     steps {
	  sh "docker login -u nikhilnidhi -p chinki12"

          sh "docker push nikhilnidhi/calculator_1"
     }
}
stage("Deploy to staging") {
     steps {
	
         // sh "docker run -d --rm -p 8765:8080 --name calculator_1 nikhilnidhi/calculator_1"
		 sh "docker-compose up -d"
     }
}

stage("Acceptance test") {
     steps {
          sleep 60
          sh "./acceptance_test_docker.sh"
     }
}
     }
	 post {
     always {
         sh "docker-compose down"
     }
         success {  
             echo 'This will run only if successful'  
         }  
         failure {  
             mail bcc: 'prabhuprabhuks@yahoo.com', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "prabhuprabhuks@yahoo.com";  
         }  
         unstable {  
             echo 'This will run only if the run was marked as unstable'  
         }  
         changed {  
             echo 'This will run only if the state of the Pipeline has changed'  
             echo 'For example, if the Pipeline was previously failing but is now successful'  
         }  
	}
}
}
