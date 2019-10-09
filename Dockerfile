FROM frolvlad/alpine-java
COPY build/libs/tonik-demo-pipeline-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
