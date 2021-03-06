FROM gradle:6.3.0-jdk8 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:8-jre-slim

EXPOSE 8000

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/currencyexchange.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/currencyexchange.jar"]