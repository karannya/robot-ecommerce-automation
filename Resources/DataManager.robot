*** Settings ***
Library    ../PageObjects/UserData.py

*** Keywords ***
Get CSV Data
    [Arguments]    ${FilePath}
    ${data} =    read csv file    ${FilePath}
    [Return]  ${Data}