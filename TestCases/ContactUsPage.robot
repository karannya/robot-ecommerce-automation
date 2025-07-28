*** Settings ***
Documentation    Test suite to validate contact form submission and redirect behavior.

Library    SeleniumLibrary
Resource    ../Resources/BrowserKeywords.robot
Resource    ../Resources/ContactUsKeywords.robot

Suite Setup    Open My Browser    ${URL}    ${BROWSER}  
Suite Teardown    Close All The Browsers   

*** Test Cases ***
Contact Form Submission And Redirection
    ContactUsKeywords.Submit Contact Form With Details
    ContactUsKeywords.Verify Contact Submission Success And Home Redirect
    Wait Until Element Is Visible    ${HOME_PAGE_IMG}