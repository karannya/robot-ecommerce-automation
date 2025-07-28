*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL} =    https://automationexercise.com
${BROWSER} =   chrome
${HOME_PAGE_IMG} =    //img[@alt='Website for automation practice'] 
${COOKIE_CONSENT_LOCATOR} =    xpath=//button[@aria-label='Consent'] 

${NAME}     USERNAME
${PWD} =        password@123
${FIRST_NAME} =   User_FirstName
${LAST_NAME} =   User_Lastname
${COMPANY} =     Testing123
${ADDRESS} =     StreetM   
${ADDRESS_2} =    Street2
${COUNTRY} =    India
${STATE} =    Assam
${CITY} =    Guwahati
${ZIPCODE} =    022348
${PHONE_NUMBER} =    243-23456798

${USER_ID}    mytest@mailinator.com
${PASSWORD}    Testing@123
${USER}     Mishika

${INVALID_USER}     admin@gmail.com
${INVALID_PASSWORD}     admin678

${BLANK_USERNAME} 
${BLANK_PASSWORD} 

${INVALID_EMAIL_NO_@}    admingmail.com 

${INVALID_CREDENTIALS_PATH_CSV} =  TestData/SignUpData.csv


#Goto "Create An Account" Link
    #name:Userme
    # mailid: mytest@mailinator.com 
    # Anusha  panda
    # street2
    # India    assam  Guwahati    02589    +91 22334 55667