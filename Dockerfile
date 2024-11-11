FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS

COPY . /app
WORKDIR /app

RUN javac app.java

RUN echo "Main-Class: app" > MANIFEST.MF

RUN jar cmf MANIFEST.MF taskjava.jar app.class

EXPOSE 3000
ENTRYPOINT exec java $JAVA_OPTS -jar taskjava.jar

