*** Settings ***
Documentation       Test suite for verifying product visibility and consistency between the UI and the database

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/products_keywords.resource


*** Variables ***
${FROM_INDEX}    2                # Start index for verifying product visibility
${TO_INDEX}      4                # End index for verifying product visibility


*** Test Cases ***
Verify Product Count Matches Database
    [Documentation]    Verifies that the total number of products displayed on the products page
    ...                matches the expected product count retrieved from the database.
    There Should Be ${FAKE_DB_PRODUCTS_COUNT} Products Visible

Verify Specific Products Are Visible
    [Documentation]    Verifies that products within the specified index range (e.g., index 2 to 4)
    ...                are visible on the products page
    Products From Index ${FROM_INDEX} To Index ${TO_INDEX} Should Be Visible
