*** Settings ***
Documentation    This test suite validates the core shopping cart functionalities
Library     SeleniumLibrary
Resource    ../Resources/CommonVariables.robot
Resource    ../Resources/BrowserKeywords.robot
Resource    ../Resources/CartFunctionalityKeywords.robot

Suite Setup        Open My Browser     ${URL}    ${BROWSER}
Suite Teardown     Close All The Browsers

*** Test Cases ***
Validate Product Add and Remove Flow in Cart
    [Tags]    regression    cart
    CartFunctionalityKeywords.Validate Cart Status
    CartFunctionalityKeywords.Add Product To Cart
    CartFunctionalityKeywords.Verify Product Quantity In Cart
    CartFunctionalityKeywords.Check and Remove Product From Cart