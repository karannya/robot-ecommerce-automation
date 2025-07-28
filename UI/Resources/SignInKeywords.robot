*** Settings ***
Documentation    This file contains keywords for signing in and signing out users. 
...              It includes login navigation, credential entry, and logout verification.
Library      SeleniumLibrary
Variables    ../PageObjects/SignInLocators.py
Resource     CommonVariables.robot

*** Keywords ***
Goto User Signup/Login 
    #Navigates to the signup/login page
    Click Link    ${SIGNIN_PATH}   
    Wait Until Page Contains    ${LOGIN_PAGE_MSG}        
Enter Sign In With Credential
    #Enters the username and password
    Input Text    ${SIGNIN_ID}     ${USER_ID}     
    Input Text    ${SIGNIN_PWD}   ${PASSWORD}        
    Click Element     ${SIGNIN_BTN} 
Sign Out 
    #Logs out the current user        
    Click Element    ${SIGNOUT_PATH}
    Wait Until Page Contains    ${LOGIN_PAGE_MSG}        
      

