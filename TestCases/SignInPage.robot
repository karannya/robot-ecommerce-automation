*** Settings ***
Documentation    This test suits verifies user authetication functionality.
Library      SeleniumLibrary
Resource     ../Resources/CommonVariables.robot
Resource     ../Resources/SignInKeywords.robot
Resource     ../Resources/BrowserKeywords.robot
Variables    ../PageObjects/SignInLocators.py

Suite Setup        Open My Browser     ${URL}    ${BROWSER}
Suite Teardown     Close All The Browsers

*** Test Cases ***    
Sign In And Sign Out With Valid Credentials
     SignInKeywords.Goto User Signup/Login 
     SignInKeywords.Enter Sign In with credential 
     SignInKeywords.Sign Out         
         
     



     
 
     
   
        

