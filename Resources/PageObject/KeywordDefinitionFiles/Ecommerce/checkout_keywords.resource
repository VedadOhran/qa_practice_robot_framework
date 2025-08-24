*** Settings ***
Documentation       Checkout-related keywords

Library             SeleniumLibrary
Variables           ../../Locators/Ecommerce/checkout_locators.py
Variables           ../../TestData/test_data.py


*** Keywords ***
Form Should Be Visible
    [Documentation]    Verify form is visible
    Wait Until Element Is Visible    ${FORM_LOCATOR}    5s

Input Phone
    [Documentation]    Input phone number
    [Arguments]    ${PHONE_NUMBER}
    Input Text    ${PHONE_NUMBER_INPUT_LOCATOR}    ${PHONE_NUMBER}

Input Street
    [Documentation]    Input street name
    [Arguments]    ${STREET_NAME}
    Input Text    ${STREET_INPUT_LOCATOR}    ${STREET_NAME}

Input City
    [Documentation]    Input city name
    [Arguments]    ${CITY_NAME}
    Input Text    ${CITY_INPUT_LOCATOR}    ${CITY_NAME}

Select Country
    [Documentation]    Select country from dropdown
    [Arguments]    ${COUNTRY_NAME}
    Select From List By Label    ${COUNTRY_DROP_LIST_LOCATOR}    ${COUNTRY_NAME}

Submit Form
    [Documentation]    Submit the shipping form
    Click Button    ${SUBMIT_BUTTON_LOCATOR}

Successful Order Message Should Be Displayed
    [Documentation]    Verify success message
    Wait Until Element Is Visible    ${ORDER_MESSAGE_LOCATOR}    5s
