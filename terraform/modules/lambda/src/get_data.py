import json
import boto3
import os

client = boto3.client('dynamodb')

def lambda_handler(event, context):
  data = client.get_item(
    TableName = os.environ["TABLE_NAME"],
    Key={
        'Id': {
          'N': '005'
        }
    }
  )

  response = {
      'statusCode': 200,
      'body': json.dumps(data),
      'headers': {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'
      },
  }

  return response
