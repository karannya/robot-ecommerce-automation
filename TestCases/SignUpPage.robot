*** Settings ***
Documentation    This test suite automates the user registration flow. 
Library     SeleniumLibrary
Resource    ../Resources/BrowserKeywords.robot
Resource    ../Resources/SignUpKeywords.robot

Suite Setup    Open My Browser     ${URL}    ${BROWSER}
Suite Teardown     Close All The Browsers

*** Test Cases ***
Create a new account
    [Tags]    smoke    signup
    SignUpKeywords.Goto User SignUp/Login
    ${dynamic_email}  Generate Dynamic Email Address   
    SignUpKeywords.Provide Basic Info For SignUp and Proceed    ${dynamic_email}
    SignUpKeywords.Enter Account Information    ${dynamic_email}

