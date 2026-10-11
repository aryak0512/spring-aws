FROM openjdk:25-ea-jdk

LABEL authors="aryak"

WORKDIR /app

COPY /build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]