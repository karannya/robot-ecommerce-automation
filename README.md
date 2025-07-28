Robot E-Commerece Automation

This project automates key scenarios on a demo e-commerce website using Robot Framework and Selenium Library. 
It focuses on core UI functionality such as user registration, login, product browsing, cart operations and contact form validation.  

--- Project Structure ---

robot-ecommerce-automation/
  UI                   # UI automation suite
    PageObjects/       # Locators for page elements
    Resources/         # Reusable keywords and variables
    Tests/             # Test cases grouped by feature
    TestData/          # CSV test data (Ex: invalid credentials)
  .gitignore
  README.md

--- Features Covered ---
- User Sign Up (valid/invalid data)
- User Sign In (multiple scenario)/Out
- Product Search, Filter, and Browse
- Add to Cart/ Cart Status/ Verfy Product Quanity/ Remove from Cart
- Contact Us Form Validation

--- Test Tags ---
- Smoke (Critical functional paths like sign up and login)
- Regression (Includes tests for both standard flows and negative scenarios)
  
