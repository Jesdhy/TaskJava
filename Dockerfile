FROM openjdk:8-jdk-alpine

COPY . /app
WORKDIR /app

RUN javac app.java

CMD ["java", "app"]

