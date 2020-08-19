#Build maven project
FROM registry.gitlab.com/devqube/crm-shared/maven-crm-builder AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean install -U -DskipTests=true

#Create docker image
FROM openjdk:11
ENV CRM_LICENSE_URL="https://doublecrm.doublecloud.pl:8094"
COPY --from=build /home/app/target/crm-eureka-service-0.0.1-SNAPSHOT.jar /usr/src
WORKDIR /usr/src
EXPOSE 8079
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=prod","-Dcrm.license.url=${CRM_LICENSE_URL}","-jar","crm-eureka-service-0.0.1-SNAPSHOT.jar"]
