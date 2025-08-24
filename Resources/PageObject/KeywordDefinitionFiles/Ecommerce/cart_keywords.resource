*** Settings ***
Documentation       Cart-related keywords - add/remove products and total updates

Library             SeleniumLibrary
Variables           ../../Locators/Ecommerce/cart_locators.py
Resource            ./ecommerce_reusable_keywords.resource


*** Keywords ***
# Actions

Remove Product ${PRODUCT_TITLE} From Cart
    [Documentation]    Remove single product based on its title
    ${CART_REMOVE_BUTTON}=    Get Cart Item Remove Button    ${PRODUCT_TITLE}
    Click Element    ${CART_REMOVE_BUTTON}

Remove Products ${PRODUCTS_LIST} From Cart
    [Documentation]    Remove multiple products from cart
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${CART_REMOVE_BUTTON}=    Get Cart Item Remove Button    ${PRODUCT_TITLE}
        Click Element    ${CART_REMOVE_BUTTON}
    END

Increment Quantity Of Product ${PRODUCT_TITLE} By ${QUANTITY_NUMBER}
    [Documentation]    Increase product quantity in cart
    ${INCREASE_QUANTITY_INPUT}=    Get Increase Quanity Input    ${PRODUCT_TITLE}
    Click Element    ${INCREASE_QUANTITY_INPUT}
    Press Keys    ${INCREASE_QUANTITY_INPUT}    BACKSPACE
    Input Text    ${INCREASE_QUANTITY_INPUT}    ${QUANTITY_NUMBER}
    Press Keys    ${INCREASE_QUANTITY_INPUT}    ENTER

# Assertions - Should

Cart Should Contain Product ${PRODUCT_TITLE}
    [Documentation]    Verify single product is present in cart
    ${PRODUCT_TITLE_TEXT}=    Get Product Title Text    ${PRODUCT_TITLE}
    Element Should Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE_TEXT}

Cart Should Contain Products ${PRODUCTS_LIST}
    [Documentation]    Verify multiple products are present in cart
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${PRODUCT_TITLE_TEXT}=    Get Product Title Text    ${PRODUCT_TITLE}
        Element Should Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE_TEXT}
    END

Cart Total Should Be Updated After Product ${PRODUCT_TITLE} Is Added
    [Documentation]    Verify cart total after adding a product
    ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
    ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    add
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Total Should Be Updated After Product ${PRODUCT_TITLE} Is Removed
    [Documentation]    Verify cart total after removing a product
    ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
    ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    remove
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Total Should Be Updated After Products ${PRODUCTS_LIST} Are Added
    [Documentation]    Verify cart total after adding multiple products
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
        ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    add
    END
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Total Should Be Updated After Products ${PRODUCTS_LIST} Are Removed
    [Documentation]    Verify cart total after removing multiple products
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
        ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    remove
    END
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Total Should Update When ${PRODUCT_TITLE} Quantity Increases By ${QUANTITY_NUMBER}
    [Documentation]    Verify cart total after quantity increase
    ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
    ${PRODUCT_PRICE_QUANTITY}=    Evaluate    round(${PRODUCT_PRICE} * ${QUANTITY_NUMBER}, 2)
    ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE_QUANTITY}    add
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

# Assertions - Should Not

Cart Should Not Contain Removed Product ${PRODUCT_TITLE}
    [Documentation]    Verify product is removed from cart
    Element Should Not Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE}

Cart Should Not Contain Removed Products ${PRODUCTS_LIST}
    [Documentation]    Verify multiple products are removed from cart
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        Element Should Not Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE}
    END
