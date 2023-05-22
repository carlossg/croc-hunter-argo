FROM maven:17-eclipse-temurin AS builder
COPY .git/ ./src/
COPY pom.xml ./src/
COPY src ./src/
RUN cd src && maven package

FROM eclipse-temurin:17
ENV PORT 8080
ENV CLASSPATH /opt/lib

EXPOSE 8080

# NOTE we assume there's only 1 jar in the target dir
# but at least this means we don't have to guess the name
# we could do with a better way to know the name - or to always create an app.jar or something
COPY --from=builder src/target/*-runner.jar /opt/app.jar
WORKDIR /opt
CMD ["java", "-jar", "app.jar"]
