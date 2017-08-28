FROM openjdk
MAINTAINER Xhulio Xole <xhulio.xole@gmail.com>
COPY target/apigateway-1.0.0.jar apigateway-1.0.0.jar
ENTRYPOINT ["java", "-jar", "/apigateway-1.0.0.jar"]
EXPOSE 8888