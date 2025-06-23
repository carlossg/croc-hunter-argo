FROM maven:3.9.10-eclipse-temurin-21 AS builder
COPY pom.xml ./src/
RUN cd src && mvn -B -ntp dependency:resolve
# for buildnumber-maven-plugin
COPY .git/ ./src/.git
COPY src ./src/src
RUN cd src && mvn package -B -ntp -Dmaven.test.skip=true

FROM eclipse-temurin:21-alpine
ENV PORT 8080

EXPOSE 8080

COPY --from=builder /src/target/quarkus-app /opt/quarkus-app
WORKDIR /opt/quarkus-app
CMD ["java", "-jar", "quarkus-run.jar"]
