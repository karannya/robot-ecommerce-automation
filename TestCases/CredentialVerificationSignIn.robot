*** Settings ***
Documentation    This test suite validates various invalid sign-in scenarios
Library      SeleniumLibrary
Variables    ../PageObjects/SignInLocators.py
Resource     ../Resources/BrowserKeywords.robot
Resource     ../Resources/CredentialVerificationSignInKeywords.robot
Resource     ../Resources/SignInKeywords.robot

Suite Setup        Open My Browser  ${URL}   ${BROWSER}   
Suite Teardown     Close All The Browsers
*** Test Cases ***
Validate Sign In Scenarios
     [Tags]    regression    signin_validation 
     SignInKeywords.Goto User Signup/Login 
     CredentialVerificationSignInKeywords.SignIn With Invalid Email
     CredentialVerificationSignInKeywords.SignIn With Invalid password
     CredentialVerificationSignInKeywords.SignIn With Blank Email Field
     CredentialVerificationSignInKeywords.SignIn With Blank Password Field
     CredentialVerificationSignInKeywords.SignIn With Email without @
  



    

