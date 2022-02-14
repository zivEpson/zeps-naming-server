FROM adoptopenjdk:11-jre-hotspot

COPY target/*.jar /opt/app/app.jar

ENTRYPOINT ["java","-jar","./opt/app/app.jar"]
