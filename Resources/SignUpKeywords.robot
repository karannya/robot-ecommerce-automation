*** Settings ***
Documentation    This resource file contains keywords related to the user signup flow.
Library      SeleniumLibrary
Library      DateTime 
Variables    ../PageObjects/SignUpLocators.py
Resource     BrowserKeywords.robot
Resource     CommonVariables.robot
  
*** Keywords ***
Goto User SignUp/Login
     #Navigate to the Sign Up / Login page.
     Click Link                  ${CREATE_ACCOUNT_LINK}    
     Wait Until Page Contains    ${EXPECTED_SIGNUP_PAGE_TEXT}    timeout=5s 
Provide Basic Info For SignUp and Proceed
    #Fill in the basic signup info using a dynamic email.
    [Arguments]                 ${dynamic_email}   
    Input Text                  ${SIGNUP_NAME}               ${NAME}
    Input Text                  ${SIGNUP_EMAIL}              ${dynamic_email}
    Click Element               ${SIGNUP_BUTTON}
    Wait Until Page Contains    ${SIGNUP_NEXT_STEP_MSG}      timeout=5s 
Generate Dynamic Email Address 
    #Generate a unique email address using current timestamp for signup.
    ${current_time}=    Get Current Date    result_format=%Y%m%d%H%M%S  
    # Create a username by appending timestamp to a base name
    ${random_username}=    Evaluate    'Mishika{}'.format(${current_time}) 
    ${email}=    Set Variable    ${random_username}@mailinator.com
    [Return]   ${email}

Enter Account Information
    #Fill in full account details and submit the signup form.
    [Arguments]    ${dynamic_email}    
    Select Radio Button    title    ${USER_GENDER}
    Input Text             ${USER_NAME}    ${NAME} 
    Element Attribute Value Should Be    ${USER_EMAIL}     value    ${dynamic_email}
    Input Text             ${USER_PASSWORD}    ${PWD} 
   
    Select From List By Value    ${USER_BIRTH_DAY}      ${DAY}  
    Select From List By Value    ${USER_BIRTH_MONTH}    ${MONTH}   
    Select From List By Value    ${USER_BIRTH_YEAR}     ${YEAR}
  
    #Basic Information
    Input Text    ${USER_FNAME}        ${FIRST_NAME}  
    Input Text    ${USER_LNAME}        ${LAST_NAME}  

    Input Text    ${USER_COMPANY}      ${COMPANY}  
    Input Text    ${USER_ADDRESS}      ${ADDRESS}  
    Input Text    ${USER_ADDRESS2}     ${ADDRESS_2}  

    Select From List By Label    ${USER_COUNTRY}     ${COUNTRY} 
    Input Text     ${USER_STATE}         ${STATE}  
    Input Text     ${USER_CITY}          ${CITY}  
    Input Text     ${USER_ZIPCODE}       ${ZIPCODE}  
    Input Text     ${USER_PHN_NUMBER}    ${PHONE_NUMBER}  

    Click Button                ${CREATE_ACCOUNT_BUTTON}
    Wait Until Page Contains    ${ACCOUNT_CREATION_MSG}

    # Click the continue button after successful account creation
    Click Element    ${CONTINUE_BUTTON}
    # Verify that the username displayed after signup matches the expected name
    ${username}=    Get Text    ${USERNAME_DISPLAY_LOCATOR}    
    Should Be Equal    ${username}    ${NAME}
   