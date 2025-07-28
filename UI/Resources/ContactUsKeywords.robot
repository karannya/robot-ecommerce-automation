*** Settings ***
Documentation    This file contains reusable keywords for filling and submitting the Contact Us form,
...              verifying the success message, and redirecting to the homepage.
Library      SeleniumLibrary
Resource     ../Resources/BrowserKeywords.robot
Resource     ../Resources/CommonVariables.robot
Variables    ../PageObjects/ContactUsLocators.py

*** Keywords ***
Submit Contact Form With Details
    #Navigates to the Contact Us page.
    Click Link             ${CONTACT_US_LINK}
    Page Should Contain    ${CONTACT_US_LANDING_TEXT}
    
    # Fill out contact form fields
    Input Text    ${CONTACT_US_FORM_NAME}        ${USER}
    Input Text    ${CONTACT_US_FORM_EMAIL}       ${USER_ID}     
    Input Text    ${CONTACT_US_FORM_SUBJECT}     ${CONTACT_US_SUBJECT}
    Input Text    ${CONTACT_US_FORM_MSG}         ${CONTACT_US_MESSAGE}

    # Upload file
    Choose File    ${CONTACT_US_FILE}    ${CONTACT_US_FILE_PATH}
    
    # Submit form and handle confirmation alert
    Click Button    ${CONTACT_US_FORM_SUBMIT}
    Handle Alert
Verify Contact Submission Success And Home Redirect
    #Verifies that form submission was successful and navigates back to the homepage.
    Page Should Contain    ${CONTACT_SUCCESS_MESSAGE} 
    Click Element          ${REDIRECT_HOMEPAGE}    
    