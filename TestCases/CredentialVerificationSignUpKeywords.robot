*** Settings ***
Documentation     This test suite verifies user account creation using invalid data from a CSV file.
Library     SeleniumLibrary
Resource    ../Resources/BrowserKeywords.robot
Resource    ../Resources/CommonVariables.robot
Resource    ../Resources/SignUpKeywords.robot
Resource    ../Resources/SignInKeywords.robot
Resource    ../Resources/CredentialVerificationSignUpKeywords.robot
Resource    ../Resources/DataManager.robot

Suite Setup        Open My Browser  ${URL}   ${BROWSER}   
Suite Teardown     Close All The Browsers 

*** Test Cases ***
Create Account With Invalid Data
    [Tags]    regression    signup_data_driven
    SignUpKeywords.Goto User SignUp/Login
    CredentialVerificationSignUpKeywords.Register User With Existing Email    
    ${dynamic_email}  Generate Dynamic Email Address 
    SignUpKeywords.Provide Basic Info For SignUp and Proceed     ${dynamic_email}
    ${invalid_scenarios}=  DataManager.Get CSV Data    ${INVALID_CREDENTIALS_PATH_CSV}
    Log     ${invalid_scenarios}
    CredentialVerificationSignUpKeywords.Create Account Scenario With Invalid Data   ${invalid_scenarios}     
