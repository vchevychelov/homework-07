FROM alpine:3.16 AS builder
RUN apk add git && \
    apk add openjdk11 && \
    apk add maven && \
    git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    mvn -f /boxfuse-sample-java-war-hello/pom.xml clean package

FROM alpine:3.16
WORKDIR / && mkdir /webapps/
COPY --from=builder /boxfuse-sample-java-war-hello/target/hello-1.0.war /webapps/
