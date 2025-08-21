*** Settings ***
Documentation       Cart-related reusable keywords for verifying add/remove product operations and cart total updates.

Library             SeleniumLibrary
Variables           ../../Locators/Ecommerce/cart_locators.py
Resource            ./ecommerce_reusable_keywords.resource


*** Keywords ***
Remove Product With Index ${INDEX} From Cart
    [Documentation]    Removes a product from the cart based on its index position in the cart item list
    Click Element    ${ITEM_IN_CART_BUTTON_LOCATOR_BY_INDEX.format(index=${INDEX})}

Cart Should Contain Product With Title ${PRODUCT_TITLE}
    [Documentation]    Verify that a product at a given index is present in the cart by checking its title
    ${PRODUCT_TITLE_TEXT}=    Get Text    ${PRODUCT_TITLE_LOCATOR_BY_TITLE.format(title="${PRODUCT_TITLE}")}
    Element Should Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE_TEXT}

Cart Should Contain Products Added From List ${PRODUCTS_LIST}
    [Documentation]    Verifies that all products from the provided list are present in the cart by checking their titles
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${PRODUCT_TITLE_TEXT}=    Get Text    ${PRODUCT_TITLE_LOCATOR_BY_TITLE.format(title="${PRODUCT_TITLE}")}
        Element Should Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE_TEXT}
    END

Cart Total Should Be Updated After Product With Title ${PRODUCT_TITLE} Is Added
    [Documentation]    Validates that the cart total is updated correctly after adding a product with the given title
    [Arguments]    ${CURRENCY}
    ${EXPECTED_VALUE_PRICE}=    Parse Price From String To Number
    ...    ${PRODUCT_PRICE_LOCATOR_BY_TITLE.format(title="${PRODUCT_TITLE}")}
    ...    ${CURRENCY}
    ${EXPECTED_VALUE}=    Update Cart Total    ${EXPECTED_VALUE_PRICE}    add    ${CURRENCY}
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_VALUE}
