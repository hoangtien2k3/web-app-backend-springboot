FROM maven:3.9.8-amazoncorretto-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package -DskipTests

FROM amazoncorretto:17.0.12
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

##Run Docker build image: interminal macOs, linux, windown
# docker build -t web-app-backend-springboot:1.0.1 .

##Create docker network
# docker network create web-app-backend-springboot-network

##Start Mysql in web-app-backend-springboot-network
# docker run --network web-app-backend-springboot-network --name mysql-connect -p 3307:3306 -e MYSQL_ROOT_PASSWORD=12042003 -d mysql:8.2.0

##Run your application in web-app-backend-springboot-network
# docker run --name web-app-backend-springboot --network web-app-backend-springboot-network -p 8088:8088 -e SPRING_DATASOURCE_URL=jdbc:mysql://mysql-connect:3307/shopapp web-app-backend-springboot:1.0.1
