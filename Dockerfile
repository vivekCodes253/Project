FROM openjdk:8
ADD ./target/Scrum-1.war app.war
EXPOSE 8083
ENTRYPOINT ["java","-jar","/app.war"]