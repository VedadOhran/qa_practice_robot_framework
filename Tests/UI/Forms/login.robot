*** Settings ***
Documentation       Test suite for verifying login with valid and invalid credentials

Library             SeleniumLibrary
Resource            ../../../Resources/PageObject/KeywordDefinitionFiles/UI/Forms/login_keywords.resource

Suite Setup         Open Browser    ${SITE_URL}    ${BROWSER}

Test Tags           regression    login


*** Test Cases ***
Verify Login With Invalid Credentials Should Fail
    [Documentation]    Invalid login attempts
    [Tags]    negative
    [Template]    Login With Invalid Credentials
    ${INVALID_EMAIL}    ${VALID_PASSWORD}    # Invalid Email + Valid Password
    ${INVALID_EMAIL}    ${INVALID_PASSWORD}    # Invalid Email + Invalid Password
    ${VALID_EMAIL}    ${INVALID_PASSWORD}    # Valid Email + Invalid Password
    ${VALID_EMAIL}    ${EMPTY}    # Valid Email + Empty Password
    ${EMPTY}    ${VALID_PASSWORD}    # Empty Email + Valid Password
    ${EMPTY}    ${EMPTY}    # Empty Email + Empty Password

Verify Login With Valid Credentials Should Pass
    [Documentation]    Valid login flow
    [Tags]    positive
    Input Email    ${VALID_EMAIL}
    Input Password    ${VALID_PASSWORD}
    Submit Credentials
    Products Page Should Be Open
