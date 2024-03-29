from pycentral.base import ArubaCentralBase
from pycentral.configuration import Groups
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


group = Groups()
base_resp = group.delete_group(conn=central, group_name="Python_Test")



pprint(base_resp)
