***Settings***
Library    SeleniumLibrary
Resource    CommonVariables.robot
     
*** Keywords ***
Open My Browser
    [Arguments]    ${URL}   ${BROWSER}
    Set Selenium Speed     .2s
    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${HOME_PAGE_IMG} 
      
    # Try to click the Accept button if it appears
    # Use Run Keyword And Ignore Error to make your test robust — it won’t fail if the popup doesn’t show up.
    Run Keyword And Ignore Error    Click Button    ${COOKIE_CONSENT_LOCATOR}    
    Sleep    3s

Close All The Browsers
    Close Browser    
    