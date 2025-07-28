#Cart page locators
VIEW_CART_LINK="xpath=//a[@href='/view_cart']"
EMPTY_CART_MSG="Cart is empty!"
CART_HAS_ITEMS_MSG="Cart has items!"
VISIBLE_CART_PRODUCT="xpath=//tr[contains(@id, 'product')]"
DELETE_CART_PRODUCT="xpath=//a[contains(@class, 'cart_quantity_delete')]"
ADD_TO_CART_BUTTON="xpath=//button[@class='btn btn-default cart'] "
CART_QTY_BTN="xpath=//td[@class='cart_quantity']/button"

#Product locators
PRODUCT_PAGE_LINK="xpath=//a[@href='/products']"
SELECTED_PRODUCT_PATH="xpath=(//div[@class='productinfo text-center'])[3]/p"
ADD_PRODUCT_TO_CART_LINK="xpath=//a[@data-product-id='3' and contains(@class, 'add-to-cart')]"
CART_PRODUCT_DESCRIPTION="xpath=//td[@class='cart_description']/h4/a"

#Modal locators
ADD_TO_CART_MODAL="xpath=//div[@id='cartModal' and contains(@class, 'show')]"
MODAL_VIEW_CART_BUTTON="xpath=//div[@id='cartModal']//a[@href='/view_cart']"






