*** Settings ***
Documentation       Test suite for verifying checkout flow

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/checkout_keywords.resource
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/products_keywords.resource


*** Test Cases ***
Verify Checkout Form Submission With Valid Data
    [Documentation]    Valid checkout flow
    [Tags]    positive    regression
    Proceed To Checkout
    Form Should Be Visible
    Input Phone    ${VALID_PHONE_NUMBER}
    Input Street    ${VALID_STREET_NAME}
    Input City    ${VALID_CITY_NAME}
    Select Country    ${VALID_COUNTRY_NAME}
    Submit Form
    Successful Order Message Should Be Displayed
