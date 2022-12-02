FROM alpine:3.16
RUN apk add git && \
    apk add openjdk11 && \
    apk add maven
WORKDIR /
RUN mkdir /webapps/ && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && mvn -f /boxfuse-sample-java-war-hello/pom.xml clean package && cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /webapps/
