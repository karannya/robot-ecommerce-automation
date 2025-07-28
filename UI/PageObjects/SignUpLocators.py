#Creat an account page locators
CREATE_ACCOUNT_LINK= "xpath=//a[contains(text(), 'Signup / Login')]"
EXPECTED_SIGNUP_PAGE_TEXT="New User Signup!"

SIGNUP_NAME="xpath=//input[@data-qa='signup-name']" 
SIGNUP_EMAIL="xpath=//input[@data-qa='signup-email']" 
SIGNUP_BUTTON="xpath=//button[@data-qa='signup-button']" 
SIGNUP_NEXT_STEP_MSG="Enter Account Information" 

#Enter user information
USER_GENDER="Mrs"
USER_NAME="xpath=//input[@data-qa='name']" 
USER_EMAIL="xpath=//input[@data-qa='email']" 
USER_PASSWORD="xpath=//input[@data-qa='password']" 
USER_FNAME="xpath=//input[@data-qa='first_name']" 
USER_LNAME="xpath=//input[@data-qa='last_name']" 
USER_BIRTH_DAY="id=days"
USER_BIRTH_MONTH="id=months"
USER_BIRTH_YEAR="id=years"
DAY= "15"
MONTH= "7"
YEAR= "2000"
USER_COMPANY="xpath=//input[@data-qa='company']" 
USER_ADDRESS="xpath=//input[@data-qa='address']" 
USER_ADDRESS2="xpath=//input[@data-qa='address2']" 
USER_COUNTRY="xpath=//select[@id='country']" 
USER_STATE="xpath=//input[@data-qa='state']" 
USER_CITY="xpath=//input[@data-qa='city']" 
USER_ZIPCODE="xpath=//input[@data-qa='zipcode']" 
USER_PHN_NUMBER="xpath=//input[@data-qa='mobile_number']" 

# Account creation success page locators
CREATE_ACCOUNT_BUTTON="xpath=//button[@data-qa='create-account']" 
ACCOUNT_CREATION_MSG="Account Created!"
CONTINUE_BUTTON="xpath=//a[@data-qa='continue-button']"
USERNAME_DISPLAY_LOCATOR="xpath=//a[contains(., 'Logged in as')]/b"

# checking with existing credential
EMAIL_EXISTS_MSG="Email Address already exist!"

