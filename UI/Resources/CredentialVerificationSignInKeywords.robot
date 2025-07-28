*** Settings ***
Documentation    This resource file contains reusable keywords to validate sign-in functionality with various invalid inputs.
Library      SeleniumLibrary
Library      BuiltIn
Variables    ../PageObjects/SignInLocators.py
Resource     CommonVariables.robot

*** Keywords ***
 SignIn With Invalid Email
    Login With Wrong Credential     ${INVALID_USER}      ${PASSWORD}
    Verify The Error Message For Invalid Credential
SignIn With Invalid Password
    Login With Wrong Credential     ${USER_ID}      ${INVALID_PASSWORD}
    Verify The Error Message For Invalid Credential 
SignIn With Blank Email Field
    #Attempts to log in using an blank email
    Login With Wrong Credential    ${BLANK_USERNAME}    ${PASSWORD} 
    #checkValidity() is a built-in HTML5 function that checks if the field meets all validation rules (ex: required, pattern, etc.).
    ${valid}=      Execute JavaScript    return document.querySelector("input[name='email']").checkValidity();
     #This fetches the browser’s built-in validation message for that input field.
    ${message}=    Execute JavaScript    return document.querySelector("input[name='email']").validationMessage; 
   # Robot Framework assertions: Should Contain or Should Be Equal allow an optional third argument
    Should Be Equal    ${valid}    ${False}    Browser should flag email field as required
    Should Contain     ${message}    Please fill in this field.    Should show required field message

SignIn With Blank Password Field
    #Attempts to log in using an blank password
    Login With Wrong Credential    ${USER_ID}    ${BLANK_PASSWORD} 
    #checkValidity() is a built-in HTML5 function that checks if the field meets all validation rules (ex: required, pattern, etc.).
    ${valid}=      Execute JavaScript    return document.querySelector("input[name='password']").checkValidity();
     #This fetches the browser’s built-in validation message for that input field.
    ${message}=    Execute JavaScript    return document.querySelector("input[name='password']").validationMessage; 
   # Robot Framework assertions: Should Contain or Should Be Equal allow an optional third argument
    Should Be Equal    ${valid}    ${False}    Browser should flag password field as required
    Should Contain     ${message}    Please fill in this field.    Should show required field message   

SignIn With Email without @
    #Tests login using improperly formatted email
    Login With Wrong Credential    ${INVALID_EMAIL_NO_@}    ${PASSWORD} 
    ${message}=      Execute JavaScript    return document.querySelector("input[name='email']").validationMessage;
    ${email}=      Get Value    name=email
    ${expected}=   Set Variable    Please include an '@' in the email address. '${email}' is missing an '@'.
    Should Be Equal    ${message}    ${expected}    Validation message should match browser’s tooltip 

Login With Wrong Credential
    [Arguments]       ${emailid}        ${paasword}
    Input Text        ${SIGNINID}       ${emailid}     
    Input Text        ${SIGNIN_PWD}     ${paasword}      
    Click Element     ${SIGNIN_BTN} 

Verify The Error Message For Invalid Credential
     #Verifies the standard error message for incorrect credentials
     Page Should Contain    Your email or password is incorrect! 


    

