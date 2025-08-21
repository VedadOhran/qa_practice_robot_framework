*** Settings ***
Documentation       Reusable keywords for ordering operations: parsing prices, updating totals, and counting items, etc...

Library             String
Library             SeleniumLibrary
Variables           ../../Locators/Ecommerce/products_locators.py
Variables           ../../Locators/Ecommerce/cart_locators.py
Variables           ../../TestData/test_data.py


*** Variables ***
${PREVIOUS_VALUE_PRICE}     0


*** Keywords ***
Parse Price From String To Number
    [Documentation]    Extracts price from a web element, removes currency symbol, and converts it to a number.
    [Arguments]    ${LOCATOR}    ${CURRENCY}
    ${PRICE_TEXT}=    Get Text    ${LOCATOR}
    ${PRICE_TEXT}=    Replace String    ${PRICE_TEXT}    ${CURRENCY}    ${EMPTY}
    ${CLEAN_PRICE}=    Convert To Number    ${PRICE_TEXT}
    RETURN    ${CLEAN_PRICE}

Update Cart Total
    [Documentation]    Recaluculate and validate cart total based on the operation(add/remove)
    [Arguments]    ${PRODUCT_VALUE}    ${OPERATION}    ${CURRENCY}
    IF    '${OPERATION}' == 'add'
        ${CORRECT_VALUE}=    Evaluate    round(${PREVIOUS_VALUE_PRICE} + ${PRODUCT_VALUE}, 2)
    ELSE
        ${CORRECT_VALUE}=    Evaluate    round(${PREVIOUS_VALUE_PRICE} - ${PRODUCT_VALUE}, 2)
    END
    VAR    ${PREVIOUS_VALUE_PRICE}=    ${CORRECT_VALUE}    scope=SUITE    # robocop:off

    IF    ${CORRECT_VALUE} == 0.0
        VAR    ${DISPLAY_VALUE}=    ${CURRENCY}0
    ELSE
        VAR    ${DISPLAY_VALUE}=    ${CURRENCY}${CORRECT_VALUE}
    END
    RETURN    ${DISPLAY_VALUE}

Get Count From List
    [Documentation]    Returns the number of elements matching the locator, useful for verifying product counts or cart items
    [Arguments]    ${LOCATOR}
    ${LIST}=    Get WebElements    ${LOCATOR}
    ${LIST_COUNT}=    Get Length    ${LIST}
    RETURN    ${LIST_COUNT}
