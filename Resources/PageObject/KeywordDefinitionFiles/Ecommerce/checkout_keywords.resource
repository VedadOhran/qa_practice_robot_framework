*** Settings ***
Documentation       Shipping Details form keywords for verifying form visibility, populating fields, submitting, and validating success messages

Library             SeleniumLibrary
Variables           ../../Locators/Ecommerce/checkout_locators.py
Variables           ../../TestData/test_data.py


*** Keywords ***
Form Should Be Visible
    [Documentation]    Verify that the shipping details form is visible on the page
    Wait Until Element Is Visible    ${FORM_LOCATOR}    5s

Input Phone
    [Documentation]    Inputs the provided phone number into the phone number field of the shipping form
    [Arguments]    ${PHONE_NUMBER}
    Input Text    ${PHONE_NUMBER_INPUT_LOCATOR}    ${PHONE_NUMBER}

Input Street
    [Documentation]    Inputs the provided street name into the street adress field of the shipping form
    [Arguments]    ${STREET_NAME}
    Input Text    ${STREET_INPUT_LOCATOR}    ${STREET_NAME}

Input City
    [Documentation]    Inputs the provided city name into the city field of the shipping form
    [Arguments]    ${CITY_NAME}
    Input Text    ${CITY_INPUT_LOCATOR}    ${CITY_NAME}

Select Country
    [Documentation]    Selects the specified country from the country drop-down list in the shipping form
    [Arguments]    ${COUNTRY_NAME}
    Select From List By Label    ${COUNTRY_DROP_LIST_LOCATOR}    ${COUNTRY_NAME}
    Sleep    1s

Submit Form
    [Documentation]    Submit the shipping form by clicking the submit button.
    Click Button    ${SUBMIT_BUTTON_LOCATOR}

Successful Order Message Should Be Displayed
    [Documentation]    Verify that the order submission was successful by checking for the success message.
    Wait Until Element Is Visible    ${ORDER_MESSAGE_LOCATOR}    5s
