FROM openjdk:8-jdk-alpine

COPY /target/hello-0.0.1-SNAPSHOT.jar hello-server-1.0.0.jar

EXPOSE 8082

CMD ["java", "-jar" , "/hello-server-1.0.0.jar"]

