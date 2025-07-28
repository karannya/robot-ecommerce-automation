# Navigation and Page Verification Locators
NAVIGATE_TO_PRODUCTS="//a[@href='/products']"
LANDING_PRODUCTS_TEXT="All Products"

# Product Search Locators
PRODUCT_SEARCH_TEXT="//input[@id='search_product']"
SEARCH_BUTTON="//button[@id='submit_search']"

# Product Listing and Viewing Locators
VIEW_PRODUCT="(//a[contains(text(), 'View Product')])[3]"
PRODUCT_CATEGORY="xpath=//p[contains(text(), 'Category:')]"

# Product Details Page Locators
PRODUCT_NAME="xpath=//div[@class='product-information']/h2"
PRODUCT_CATEGORY="xpath=//div[@class='product-information']/p[contains(text(),'Category')]"
PRODUCT_PRICE="xpath=//div[@class='product-information']//span/span[contains(text(),'Rs.')]"
PRODUCT_AVAILABILITY="xpath=//div[@class='product-information']/p[b[text()='Availability:']]"
PRODUCT_CONDITION="xpath=//div[@class='product-information']/p[b[text()='Condition:']]"
PRODUCT_BRAND="xpath=//div[@class='product-information']/p[b[text()='Brand:']]"

# Brand Filtering Locator
FIRST_BRAND="xpath=(//a[contains(text(), 'View Product')])[1]"
