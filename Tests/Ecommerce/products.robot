*** Settings ***
Documentation       Test suite for verifying product visibility and UI and DB consistency
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/products_keywords.resource


*** Variables ***
${FROM}       2    # Start index for verifying product visibility
${TO}         4    # End index for verifying product visibility


*** Test Cases ***
Verify Product Count Matches Database
    [Documentation]    Product count UI vs DB
    [Tags]    positive    regression
    There Should Be ${FAKE_DB_PRODUCTS_COUNT} Products Visible

Verify Specific Products Are Visible
    [Documentation]    Products visible in range
    [Tags]    positive    regression
    Products In Range ${FROM_} To ${TO} Should Be Visible
