#### Stage 1: Build the application
FROM adoptopenjdk/openjdk11:ubi as build

# Set the current working directory inside the image
WORKDIR /app

# Copy maven executable to the image
COPY mvnw .
COPY .mvn .mvn

# Copy the pom.xml file
COPY pom.xml .

# Build all the dependencies in preparation to go offline.
# This is a separate step so the dependencies will be cached unless
# the pom.xml file has changed.
RUN ./mvnw dependency:go-offline -B

# Copy the project source
COPY src src

# Package the application
RUN ./mvnw package -DskipTests

#### Stage 1: Build the application
FROM adoptopenjdk:11-jre-hotspot

# Copy jar from build image to app image
COPY --from=build /app/target/*.jar /opt/app/app.jar

ENTRYPOINT ["java","-jar","./opt/app/app.jar"]
