import json
import boto3
from botocore.exceptions import ClientError


def lambda_handler(event, context):
    
    client = boto3.client('sesv2')
    # send email using ses
    try:
        response = client.send_email(
            FromEmailAddress='mohamedabrazek936@gmail.com',
            Destination={
                'ToAddresses': [
                    'mohamedabrazek936@gmail.com',
                ],
            },
            Content={
                'Simple': {
                    'Subject': {
                        'Data': 'terraform-state',
                        'Charset': 'UTF-8'
                    },
                    'Body': {
                        'Text': {
                            'Data': 'terraform changed ',
                            'Charset': 'UTF-8'
                        },
                    }
                },

            },
        )

    except ClientError as e:
        print(e.response['Error']['Message'])

    return {
        'statusCode': 200,
        'body': json.dumps('upload done')
    }