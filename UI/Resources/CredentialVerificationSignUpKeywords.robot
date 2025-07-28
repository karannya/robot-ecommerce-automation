*** Settings ***
Documentation     This file includes keywords to verify account creation form validation using invalid data.
Library      SeleniumLibrary
Library      Collections
Variables    ../PageObjects/SignUpLocators.py
Resource     BrowserKeywords.robot
Resource     CommonVariables.robot
Resource     SignUpKeywords.robot
  
*** Keywords ***
Register User With Existing Email
     #Attempts to register with an existing emailid.
     Input Text       ${SIGNUP_NAME}   ${NAME}
     Input Text       ${SIGNUP_EMAIL}  ${USER_ID}   
     Click Element    ${SIGNUP_BUTTON}
     Wait Until Page Contains    ${EMAIL_EXISTS_MSG}    timeout=5s 
Create Account Scenario With Invalid Data 
    #Loops through invalid input sets from CSV and verifies validation on each.
    [Arguments]     ${invalid_scenarios} 
    ${length}=    Get Length    ${invalid_scenarios}
    Log     Testing with data length: ${length}
    FOR  ${index}  IN RANGE  0  ${length}  
        ${scenario}=    Get From List    ${invalid_scenarios}    ${index}             
        Run Keyword And Continue On Failure    Attempt Registration    ${scenario}
        Run Keyword And Continue On Failure    Attempt Submit
        Run Keyword And Continue On Failure    Verify Create Account Page Error Message
        Reload Page
    END  

Attempt Registration
    #Inputs test data into the account registration fields based on scenarios
    [Arguments]      ${credentials}
    Log    Testing with data: ${credentials}
    Run Keyword If  '${credentials[0]}' == '#BLANK'    Clear Element Text    ${USER_NAME}
    Run keyword If  '${credentials[0]}' != '#BLANK'   Input Text      ${USER_NAME}                         ${credentials[0]}   
    Run keyword If  '${credentials[1]}' != '#BLANK'   Input Text      ${USER_PASSWORD}                     ${credentials[1]}
    Run keyword If  '${credentials[2]}' != '#BLANK'   Input Text      ${USER_FNAME}                        ${credentials[2]} 
    Run keyword If  '${credentials[3]}' != '#BLANK'   Input Text      ${USER_LNAME}                        ${credentials[3]} 
    Run keyword If  '${credentials[4]}' != '#BLANK'   Input Text      ${USER_ADDRESS}                      ${credentials[4]}   
    Run keyword If  '${credentials[5]}' != '#BLANK'   Select From List By Label      ${USER_COUNTRY}               ${credentials[5]} 
    Run Keyword If  '${credentials[5]}' == '#BLANK'
...    Execute JavaScript    document.querySelector("select[name='country']").selectedIndex = -1;
    Run keyword If  '${credentials[6]}' != '#BLANK'   Input Text      ${USER_STATE}                 ${credentials[6]} 
    Run keyword If  '${credentials[7]}' != '#BLANK'   Input Text      ${USER_CITY}                  ${credentials[7]} 
    Run keyword If  '${credentials[8]}' != '#BLANK'   Input Text      ${USER_ZIPCODE}               ${credentials[8]}  
    Run keyword If  '${credentials[9]}' != '#BLANK'   Input Text      ${USER_PHN_NUMBER}            ${credentials[9]} 
          
Attempt Submit 
    Scroll Element Into View         ${CREATE_ACCOUNT_BUTTON}
    Wait Until Element Is Visible    ${CREATE_ACCOUNT_BUTTON}    timeout=5s
    Click Button    ${CREATE_ACCOUNT_BUTTON}
    Sleep    1s
    
Verify Create Account Page Error Message
    #Verifies if any input field on the page failed its HTML5 validation
    ${field}=    Create List
    ...    ${USER_NAME}
    ...    ${USER_PASSWORD}
    ...    ${USER_FNAME}
    ...    ${USER_LNAME}
    ...    ${USER_ADDRESS}
    ...    ${USER_COUNTRY}
    ...    ${USER_STATE}
    ...    ${USER_CITY}
    ...    ${USER_ZIPCODE}
    ...    ${USER_PHN_NUMBER}
    
    ${invalid_found}=    Set Variable    False

   FOR    ${locator}    IN    @{field}
    ${element}=     Get WebElement    ${locator}
    ${is_valid}=    Run Keyword And Ignore Error    Execute JavaScript    return arguments[0].checkValidity();    ${element}
    ${status}=    Set Variable    ${is_valid[0]}
    ${result}=    Set Variable    ${is_valid[1]}
    Run Keyword If    '${status}' == 'PASS' and '${result}' == 'False'    Set Variable    ${invalid_found}    True
  END

   Should Be True    ${invalid_found}
    