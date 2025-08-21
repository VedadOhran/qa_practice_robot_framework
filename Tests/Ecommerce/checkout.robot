*** Settings ***
Documentation   Test suite for verifying the checkout flow, ensuring that a user can submit the checkout form with valid data

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/checkout_keywords.resource
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/products_keywords.resource


*** Test Cases ***
Verify Checkout Form Submission With Valid Data
    [Documentation]    Verify that a user can successfully complete the checkout process by submitting the order form.
    Click Button    ${CHECKOUT_BUTTON_LOCATOR}
    Form Should Be Visible
    Input Phone    ${VALID_PHONE_NUMBER}
    Input Street    ${VALID_STREET_NAME}
    Input City    ${VALID_CITY_NAME}
    Select Country    ${VALID_COUNTRY_NAME}
    Submit Form
    Successful Order Message Should Be Displayed
