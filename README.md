# Fun Fact Generator

Demo project showcasing integration with AWS services and Amazon Bedrock.

## Overview
This application generates neutral, objective facts about a subject and uses Amazon Bedrock to add a witty tone to the output. It's intended as a demo exercise for integrating generative AI capabilities into a serverless project.

## Architecture
- AWS Lambda: Backend logic for fact generation
- Amazon API Gateway: Exposes Lambda as a REST API
- Amazon DynamoDB: Stores generated facts
- AWS Amplify: Hosts the React.js frontend
- Amazon Bedrock: Uses a Gen-AI foundation model to add sentiment/personality to facts
- AWS IAM: Manages secure permissions between services

User accesses app hosted on AWS Amplify -> Click on button triggers API call to API Gateway -> API Gateway invoked Lambda function -> Lambda queries DynamoDB -> Lambda sends data to Bedrock for enhancement -> Amplify displays enhanced data to the user.