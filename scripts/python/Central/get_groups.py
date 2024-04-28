from pycentral.base import ArubaCentralBase
from pprint import pprint

# Create an instance of ArubaCentralBase using API access token 
# or API Gateway credentials.
central_info = {
    "base_url": "https://apigw-prod2.central.arubanetworks.com",
    "token": {
        "access_token": ""
    }
}
ssl_verify = True
central = ArubaCentralBase(central_info=central_info,
                           ssl_verify=ssl_verify)


# Sample API call using 'ArubaCentralBase.command()'
# GET groups from Aruba Central
apiPath = "/configuration/v2/groups"
apiMethod = "GET"
apiParams = {
    "limit": 50,
    "offset": 0
}
base_resp = central.command(apiMethod=apiMethod, 
                            apiPath=apiPath,
                            apiParams=apiParams)
pprint(base_resp)
