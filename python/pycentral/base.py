
# Import Base Class from pycentral
from pycentral.base import ArubaCentralBase

# Define var to store Aruba Central details
#   to authorize into API Gateway
central_info = {
    "base_url": "https://apigw-prod2.central.arubanetworks.com/",
    "client_id": "un9Az01gtLD8Vq9qu70h2c1BJQTvrbm5",
    "client_secret": "UyWgwA4sTPkMGbQbna1x9sqMCssu2VMc",
    "username": "cvincent@bryan.k12.ga.us",
    "password": "Admin@1.one",
    "customer_id": "72e8cabda94e4e6685ec1aab897f9525"
}

# Create an instance of the base class and initialize it with the Aruba Central details
central = ArubaCentralBase(central_info=central_info)

# Define vars for Central API Endpoint inorder to make an API call
apiPath = "configuration/v1/wlan/BCES-APs"
apiMethod = "GET"
#apiParams = {
#    "limit": 20,
#    "offset": 0
#}

# Make a func call to command() defined within Base Class using instance object
base_resp = central.command(apiMethod=apiMethod,
                            apiPath=apiPath,
#                            apiParams=apiParams
 )

# Print the resposne of the API call
print(base_resp)
