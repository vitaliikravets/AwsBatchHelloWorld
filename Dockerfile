FROM frolvlad/alpine-java:jdk8-slim

COPY target/AwsBatchHelloWorld-1.0-SNAPSHOT-jar-with-dependencies.jar /app

WORKDIR /app

# ENTRYPOINT defines script that has to be triggered.
ENTRYPOINT ["java", "-jar", "AwsBatchHelloWorld-1.0-SNAPSHOT-jar-with-dependencies.jar"]

# CMD defines default arguments. This is useful for local runs. AWS Batch will override those arguments.
CMD ["--marketplaceId", "default-value-from-dockerfile"]

# Run in aws batch
# aws batch submit-job --region us-west-2 --job-name JobName --job-queue JobQueue-03a951d66d884ac --job-definition JobDefinition-9323d517baea6d3 --parameters marketplaceId=123

# get job status in cli
# aws batch describe-jobs --region us-west-2 --jobs 34c6473f-6c50-47bf-8613-7f0baf8ea86c

# get job logs. You can get --log-stream-name param from describe-jobs output
# aws logs get-log-events --region us-west-2 --log-group-name /aws/batch/job --log-stream-name JobDefinition-9323d517baea6d3/default/1f4e4961-b387-4d9a-bb55-29cbf2ac5907

#Run in locally
# docker build -t mybatch .
# docker run mybatch:latest
