import boto3
import random
import json

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("Facts")

def lambda_handler(event, context):
    response = table.scan()
    items = response.get("Items", [])

    if not items:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": "No facts found"})
        }

    fact = random.choice(items)["FactText"]

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({"fact": fact})
    }
