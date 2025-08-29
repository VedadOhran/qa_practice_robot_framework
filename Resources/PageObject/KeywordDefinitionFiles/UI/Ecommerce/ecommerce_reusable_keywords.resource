*** Settings ***
Documentation       Reusable keywords for ordering operations

Library             String
Library             SeleniumLibrary
Variables           ../../../Locators/Ecommerce/products_locators.py
Variables           ../../../Locators/Ecommerce/cart_locators.py
Variables           ../../../TestData/test_data.py


*** Variables ***
${PREVIOUS_VALUE_PRICE}     0
${CURRENCY}                 $


*** Keywords ***
Parse Price From String To Number
    [Documentation]    Extracts price from a web element, removes currency symbol, and converts it to a number.
    [Arguments]    ${LOCATOR}
    ${PRICE_TEXT}=    Get Text    ${LOCATOR}
    ${PRICE_TEXT}=    Replace String    ${PRICE_TEXT}    ${CURRENCY}    ${EMPTY}
    ${CLEAN_PRICE}=    Convert To Number    ${PRICE_TEXT}
    RETURN    ${CLEAN_PRICE}

Update Cart Total
    [Documentation]    Recaluculate and validate cart total based on the operation(add/remove)
    [Arguments]    ${PRODUCT_VALUE}    ${OPERATION}
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
    [Documentation]    Returns the number of elements matching the locator
    [Arguments]    ${LOCATOR}
    ${LIST}=    Get WebElements    ${LOCATOR}
    ${LIST_COUNT}=    Get Length    ${LIST}

    RETURN    ${LIST_COUNT}

Get Product Price
    [Documentation]    Helper keyword created for cleaner cart_keywords.resource code
    ...    Parses and returns the product price of the specified product title
    [Arguments]    ${PRODUCT_TITLE}
    ${EXPECTED_VALUE_PRICE}=    Parse Price From String To Number
    ...    ${PRODUCT_PRICE_LOCATOR_BY_TITLE.format(title="${PRODUCT_TITLE}")}

    RETURN    ${EXPECTED_VALUE_PRICE}

Get Product Title Text
    [Documentation]    Helper keyword created for cleaner cart_keywords.resource code
    ...    Returns the text of the specified product title
    [Arguments]    ${PRODUCT_TITLE}
    ${PRODUCT_TITLE_TEXT}=    Get Text    ${PRODUCT_TITLE_LOCATOR_BY_TITLE.format(title="${PRODUCT_TITLE}")}

    RETURN    ${PRODUCT_TITLE_TEXT}

Get Cart Item Remove Button
    [Documentation]    Helper keyword created for cleaner and more readable cart_keywords.resource code
    ...    Returns the locator for the cart item's remove button by product title
    [Arguments]    ${PRODUCT_TITLE}
    RETURN    ${ITEM_IN_CART_BUTTON_LOCATOR_BY_TITLE.format(title="${PRODUCT_TITLE}")}

Get Increase Quanity Input
    [Documentation]    Helepr keyword created for cleaner and more readable cart_keywrods.resource code
    ...    Return the increase number of item in cart by product title
    [Arguments]    ${PRODUCT_TITLE}

    RETURN    ${CART_ITEM_QUANTITY_INPUT_BY_TITLE.format(title="${PRODUCT_TITLE}")}
