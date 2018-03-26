FROM openjdk
MAINTAINER Xhulio Xole <xhulio.xole@gmail.com>
COPY target/apigateway-RELEASE.jar apigateway-RELEASE.jar
ENTRYPOINT ["java", "-jar", "/apigateway-RELEASE.jar"]
EXPOSE 8080