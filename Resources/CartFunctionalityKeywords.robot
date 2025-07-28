*** Settings ***
Documentation     It includes tests to validate cart status, add products to the cart, verify product
...              quantity updates, and ensure products can be successfully removed.
Library      SeleniumLibrary
Resource     ../Resources/CommonVariables.robot
Resource     ../Resources/BrowserKeywords.robot
Variables    ../PageObjects/ProductDetailsLocators.py
Variables    ../PageObjects/CartFunctionalityLocators.py  

*** Keywords ***
Validate Cart Status
    #Checks if cart is empty. If so, navigates to product page.
    Click Link    ${VIEW_CART_LINK} 
    #Wait Until Page Contains    Cart is empty!    timeout=5s
    ${cart_is_empty}=    Run Keyword And Return Status    Page Should Contain     ${EMPTY_CART_MSG}
    Sleep    1s
    IF    ${cart_is_empty}
        Log To Console    Cart is empty!
        Page Should Contain Element    ${PRODUCT_PAGE_LINK}
        # Click the link to go to products page
        Click Element    ${PRODUCT_PAGE_LINK}
        Page Should Contain    ${LANDING_PRODUCTS_TEXT}
    ELSE
        Log To Console    ${CART_HAS_ITEMS_MSG}
        # Verify product elements exist
        Page Should Contain Element    ${VISIBLE_CART_PRODUCT}
    END
Add Product To Cart   
    Execute Javascript    window.scrollBy(0, 400)
    ${product_name}=    Get Text    ${SELECTED_PRODUCT_PATH}    
    Log To Console    Product name from page: ${product_name}
    Click Element    ${ADD_PRODUCT_TO_CART_LINK}    

    # Wait for modal to show and View Cart link to appear and be enabled
    Wait Until Element Is Visible    ${ADD_TO_CART_MODAL}        timeout=5s
    Wait Until Element Is Visible    ${MODAL_VIEW_CART_BUTTON}        timeout=5s
    Wait Until Element Is Enabled    ${MODAL_VIEW_CART_BUTTON}    timeout=5s
    
    # Now click View Cart link in modal
    Click Element    ${MODAL_VIEW_CART_BUTTON}

    # Get product name from cart page
    ${cart_product_name}=    Get Text    ${CART_PRODUCT_DESCRIPTION}
    Log To Console    Product name in cart: ${cart_product_name}

    # Assert that product names match
    Should Be Equal    ${product_name}    ${cart_product_name}
Verify Product Quantity In Cart
    Scroll Element Into View    ${VIEW_PRODUCT}
    Sleep    1s
    Click Element    ${VIEW_PRODUCT}    
    Wait Until Page Contains Element    ${PRODUCT_CATEGORY}
    Press Keys    id=quantity    ARROW_UP
    Press Keys    id=quantity    ARROW_UP
    Click Element    ${ADD_TO_CART_BUTTON}    
    Wait Until Element Is Visible    ${ADD_TO_CART_MODAL}    timeout=5s 
    Wait Until Element Is Visible    ${MODAL_VIEW_CART_BUTTON}    timeout=5s
    Wait Until Element Is Enabled    ${MODAL_VIEW_CART_BUTTON}    timeout=5s
    Click Element    ${MODAL_VIEW_CART_BUTTON}

    ${quantity}=    Get Text    ${CART_QTY_BTN}
    Log To Console    Cart Quantity: ${quantity}
Check and Remove Product From Cart
    Add Product to Cart
    Click Element    ${DELETE_CART_PRODUCT}
    Page Should Contain     ${EMPTY_CART_MSG}
   