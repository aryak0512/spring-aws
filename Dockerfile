FROM openjdk:25-ea-jdk

LABEL maintainer="Aryak D. <aryak@gmail.com>"
LABEL region="Key <Value>"

WORKDIR /app

# RUN used for executing task after container spins up
#RUN apt-get update

# CMD can be overidded by command line args
CMD ["java", "-version"]

COPY /build/libs/*.jar app.jar

# ENTRYPOINT cannot be overidded by command line args, the args are appended to the ENTRYPOINT
ENTRYPOINT ["java", "-jar", "app.jar"]