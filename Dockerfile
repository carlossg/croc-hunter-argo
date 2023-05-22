FROM maven:3.9.2-eclipse-temurin-17 AS builder
COPY pom.xml ./src/
RUN cd src && mvn dependency:resolve
COPY .git/ ./src/.git
COPY src ./src/src
RUN cd src && mvn package

FROM eclipse-temurin:17
ENV PORT 8080

EXPOSE 8080

COPY --from=builder /src/target/quarkus-app /opt/quarkus-app
RUN ls -alFhR /opt/quarkus-app/app/
WORKDIR /opt/quarkus-app
CMD ["java", "-jar", "quarkus-run.jar"]
