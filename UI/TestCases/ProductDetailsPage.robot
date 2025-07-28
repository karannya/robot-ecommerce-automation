*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/CommonVariables.robot
Resource    ../Resources/BrowserKeywords.robot
Resource    ../Resources/ProductDetailsKeywords.robot

Suite Setup        Open My Browser     ${URL}    ${BROWSER}
Suite Teardown     Close All The Browsers

*** Test Cases ***
Verify Product Browsing Features
    [Tags]    regression    product
    ProductDetailsKeywords.Landing To Product Page    
    ProductDetailsKeywords.Product Search Funtionality    top    saree    jeans
    ProductDetailsKeywords.Verify Products Listing
    ProductDetailsKeywords.Verify Product Filtering By Category And Brand
