FROM frolvlad/alpine-java:jdk8-slim

COPY target/AwsBatchHelloWorld-1.0-SNAPSHOT-jar-with-dependencies.jar /app

WORKDIR /app

# ENTRYPOINT defines script that has to be triggered.
ENTRYPOINT ["java", "-jar", "AwsBatchHelloWorld-1.0-SNAPSHOT-jar-with-dependencies.jar"]

# CMD defines default arguments. This is useful for local runs. AWS Batch will override those arguments.
CMD ["--marketplaceId", "default-value-from-dockerfile"]

# Run in aws batch
# aws batch submit-job --job-name SubmittingFromCLI --job-queue JobQueue-03a951d66d884ac --job-definition JobDefinition-9323d517baea6d3 --region us-west-2 --parameters marketplaceId=123

#Run in locally
# docker build -t mybatch .
# docker run mybatch:latest