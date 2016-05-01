from linkedin import linkedin

API_KEY = ''
API_SECRET = ''
RETURN_URL = 'http://localhost:8000'

authentication = linkedin.LinkedInAuthentication(API_KEY, API_SECRET, RETURN_URL)
# Optionally one can send custom "state" value that will be returned from OAuth server
# It can be used to track your user state or something else (it's up to you)
# Be aware that this value is sent to OAuth server AS IS - make sure to encode or hash it
#authorization.state = 'your_encoded_message'
print authentication.authorization_url  # open this url on your browser

#authentication.authorization_code = "AQU32GSIYKLneFIfXbEzYk7dSeYqJ8pI4T0OC1nkCW\
#hVdSr_UVbJ5NjuiGkSmcAaBGrP9KyYc0v2cv0Jk5mxaMCxSyT6dDR0QeVX5cQ43OiFRu6x1uRBUXQNV\
#MWy8iXQmtT-nH63DbqPKdq_kfi24sdnu0kbc_P0j-zIWCIkjhMani18ryk"


#authentication.get_access_token()
application = linkedin.LinkedInApplication(token="AQU32GSIYKLneFIfXbEzYk7dSeYq\
J8pI4T0OC1nkCWhVdSr_UVbJ5NjuiGkSmcAaBGrP9KyYc0v2cv0Jk5mxaMCxSyT6dDR0QeVX5cQ43Oi\
FRu6x1uRBUXQNVMWy8iXQmtT-nH63DbqPKdq_kfi24sdnu0kbc_P0j-zIWCIkjhMani18ryk")
#application.search_profile(selectors=[{'people': ['first-name', 'last-name']}], params={'keywords': 'apple microsoft'})

print application.get_profile()
