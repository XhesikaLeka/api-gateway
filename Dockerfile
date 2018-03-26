FROM openjdk
MAINTAINER Xhulio Xole <xhulio.xole@gmail.com>
COPY target/apigateway-RELEASE.jar apigateway-RELEASE.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "-Dspring.config.location=file:///root/api_gateway_config", "/apigateway-RELEASE.jar"]
EXPOSE 8080
