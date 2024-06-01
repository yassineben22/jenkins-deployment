FROM openjdk:22
EXPOSE 9005
ADD /target/deploy-automation.jar deploy-automation.jar
ENTRYPOINT ["java", "-jar", "deploy-automation.jar"]