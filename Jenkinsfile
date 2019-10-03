/* Demo project for Tonik-Bank
Prabhu Kasisekar*/
//Test webhook to project
pipeline {
agent any
stages {
stage("Checkout") {
steps {
    // git repo for source code
git url:'https://github.com/kaspr01/demo.git'
}
}
stage("Compile") {
steps {
sh './gradlew compileJava'
}
}
stage("Unit test") {
steps {
sh './gradlew test'
}
}
stage("Code coverage") {
  steps {
   sh "./gradlew jacocoTestReport"
//   publishHTML (target: [
//               reportDir: 'build/reports/jacoco/test/html',
//               reportFiles: 'index.html',
//               reportName: "JaCoCo Report"
//          ]) 
   sh "./gradlew jacocoTestCoverageVerification"
    }
}
}
}
