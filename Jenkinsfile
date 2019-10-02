/* Demo project for Tonik-Bank
Prabhu Kasisekar*/
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
}
}
