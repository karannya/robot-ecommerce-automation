*** Settings ***
Documentation    This resource file contains keywords to test product-related functionalities
Library    SeleniumLibrary
Library    String
Library    Collections
Resource     CommonVariables.robot
Resource     BrowserKeywords.robot
Variables    ../PageObjects/ProductDetailsLocators.py

*** Variables ***
@{categories}    Women    Men    Kids
${brand_name}    Brand - Polo Products  
    
   
*** Keywords ***
Landing To Product Page 
    #Navigate from landing page to product listing page.
    Click Element          ${NAVIGATE_TO_PRODUCTS}
    Page Should Contain    ${LANDING_PRODUCTS_TEXT}
Product Search Funtionality
    [Arguments]    @{search_term}
    FOR    ${term}    IN    @{search_term}
        Input Text      ${PRODUCT_SEARCH_TEXT}    ${term}
        Click Button    ${SEARCH_BUTTON}
        Wait Until Element Is Visible    ${VIEW_PRODUCT}
        Scroll Element Into View    ${VIEW_PRODUCT}
        Sleep    1s
        Click Element    ${VIEW_PRODUCT}
        Wait Until Page Contains Element    ${PRODUCT_CATEGORY}
        ${category_text} =    Get Text    ${PRODUCT_CATEGORY}
        Should Contain    ${category_text.lower()}    ${term.lower()} 
        Go Back
    END  
       
Verify Products Listing
    #Validate that product details
    Scroll Element Into View    ${VIEW_PRODUCT}
    Sleep    1s
    Click Element    ${VIEW_PRODUCT}
    
    Wait Until Page Contains Element    ${PRODUCT_CATEGORY}
    ${product_name}=    Get Text    ${PRODUCT_NAME}
    Should Not Be Empty    ${product_name}

    ${category_text}=    Get Text    ${PRODUCT_CATEGORY} 
    Should Not Be Empty    ${category_text}

    ${price}=    Get Text    ${PRODUCT_PRICE}    
    Should Match Regexp   ${price}    Rs\\.\\s*\\d+
    
    ${availability}=    Get Text    ${PRODUCT_AVAILABILITY}
    Should Not Be Empty        ${availability} 

    ${condition}=    Get Text    ${PRODUCT_CONDITION}    
    Should Not Be Empty   ${condition}
    
    ${brand}=    Get Text    ${PRODUCT_BRAND}    
    Should Not Be Empty   ${brand}

Verify Product Filtering By Category And Brand
    Verify Product Filtering By Category    Women    Dress    Tops    Saree    
    Verify Product Filtering By Brand

 Verify Product Filtering By Category 
    [Arguments]    ${category}    @{subcategories}
    Execute Javascript    window.scrollBy(0, 200)
    # Expand the ${category} category
    Click Element    xpath=//a[@data-toggle='collapse' and contains(., '${category}')]
    Sleep    1s

    FOR    ${subcategory}    IN    @{subcategories}
        # Locate and click the subcategory
        ${link}=    Get WebElement    xpath=//div[@id='${category}']//ul/li/a[normalize-space(.)='${subcategory}']
        ${raw_text}=    Get Text    ${link}
        Log To Console    Subcategory Raw: ${raw_text}
        ${clean_subcategory}=    Evaluate    '''${raw_text}'''.strip().lower()
        Log To Console    Subcategory Cleaned: ${clean_subcategory}
        
        Click Element    ${link}
        Sleep    1s

        # Validate landing page title contains the subcategory name
        ${page_text}=    Get Text    xpath=//div[@class='features_items']/h2
        ${page_text}=    Evaluate    '''${page_text}'''.lower()
        Should Contain    ${page_text}    ${clean_subcategory}

        # Go back to the category page to click next subcategory
        Go Back
        Sleep    1s
    END

Verify Product Filtering By Brand 
    Scroll Element Into View    ${FIRST_BRAND}
    Sleep    0.5s
    Click Element          ${FIRST_BRAND}
    Page Should Contain    ${brand_name}
    
