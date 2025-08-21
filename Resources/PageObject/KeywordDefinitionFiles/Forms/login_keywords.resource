*** Settings ***
Documentation       Login form keywords for entering credentials, submitting the form, and verifying login success or failure

Library             SeleniumLibrary
Variables           ../../TestData/test_data.py
Variables           ../../Locators/Forms/login_locators.py
Variables           ../../Locators/Ecommerce/products_locators.py


*** Keywords ***
Input Email
    [Documentation]    Inputs the provided email address into the login email field
    [Arguments]    ${EMAIL}
    Input Text    ${LOGIN_EMAIL_LOCATOR}    ${EMAIL}

Input Password
    [Documentation]    Inputs the provided password into the login password field
    [Arguments]    ${PASSWORD}
    Input Text    ${LOGIN_PASSWORD_LOCATOR}    ${PASSWORD}

Submit Credentials
    [Documentation]    Submits the login form by clicking the login button
    Click Button    ${LOGIN_BUTTON_LOCATOR}

Products Page Should Be Open
    [Documentation]    Verifies that the products page is displayed after a successful login by checking the section header
    Wait Until Element Contains    ${SECTION_HEADER_LOCATOR}    SHOPPING CART    3s

Login With Invalid Credentials
    [Documentation]    Attempts to log in with invalid credentials and verifies that the appropriate error message is displayed
    [Arguments]    ${EMAIL}    ${PASSWORD}
    Input Email    ${EMAIL}
    Input Password    ${PASSWORD}
    Submit Credentials
    Element Text Should Be
    ...    ${BAD_CREDENTIALS_MESSAGE_LOCATOR}
    ...    Bad credentials! Please try again! Make sure that you've registered.
