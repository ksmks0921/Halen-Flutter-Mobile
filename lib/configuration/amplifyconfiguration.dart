const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "halencustomerapp": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://yhz2vpx3qrdjtbjq7rumjblbau.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "AMAZON_COGNITO_USER_POOLS"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:c5944fe5-4803-4542-94c2-07cdf9dafcdf",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_G9gww0MvB",
                        "AppClientId": "tsg8jh3qgv506totfihnkc14",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "gethalen.auth.us-east-1.amazoncognito.com",
                            "AppClientId": "tsg8jh3qgv506totfihnkc14",
                            "SignInRedirectURI": "https://localhost:3000",
                            "SignOutRedirectURI": "https://localhost:3000",
                            "Scopes": [
                                "aws.cognito.signin.user.admin",
                                "email",
                                "openid",
                                "phone"
                            ]
                        },
                        "authenticationFlowType": "CUSTOM_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL",
                            "PHONE_NUMBER"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": [
                                "REQUIRES_LOWERCASE",
                                "REQUIRES_UPPERCASE",
                                "REQUIRES_NUMBERS",
                                "REQUIRES_SYMBOLS"
                            ]
                        },
                        "mfaConfiguration": "OPTIONAL",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://yhz2vpx3qrdjtbjq7rumjblbau.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "AMAZON_COGNITO_USER_POOLS",
                        "ClientDatabasePrefix": "halencustomerapp_AMAZON_COGNITO_USER_POOLS"
                    }
                }
            }
        }
    }
}''';
