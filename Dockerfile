FROM alpine
RUN apk add git && \
    apk add openjdk11 && \
    apk add maven
WORKDIR /
RUN mkdir /webapps/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f /boxfuse-sample-java-war-hello/pom.xml clean package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /webapps/