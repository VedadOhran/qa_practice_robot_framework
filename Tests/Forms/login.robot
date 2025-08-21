*** Settings ***
Documentation       Test suite for verifying login functionality with valid and invalid credentials

Library             SeleniumLibrary
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Forms/login_keywords.resource

Suite Setup         Open Browser    ${SITE_URL}    ${BROWSER}


*** Test Cases ***
Verify Login With Invalid Credentials Should Fail
    [Documentation]    Verifies that login attempts with invalid, empty, or partial credentials fail,
    ...                and that the appropriate error message is displayed in each case
    [Template]    Login With Invalid Credentials
    ${INVALID_EMAIL}    ${VALID_PASSWORD}        # Invalid Email And Valid Password
    ${VALID_EMAIL}    ${INVALID_PASSWORD}        # Valid Email And Invalid Password
    ${INVALID_EMAIL}    ${INVALID_PASSWORD}      # Invalid Email And Invalid Password
    ${EMPTY}    ${VALID_PASSWORD}                # Empty Email And Valid Password
    ${VALID_EMAIL}    ${EMPTY}                   # Valid Email And Empty Password
    ${EMPTY}    ${EMPTY}                         # Empty Email And Empty Password

Verify Login With Valid Credentials Should Pass
    [Documentation]    Verifies that a user can log in successfully with valid credentials,
    ...                and that the products page is displayed after login
    Input Email    ${VALID_EMAIL}
    Input Password    ${VALID_PASSWORD}
    Submit Credentials
    Products Page Should Be Open
