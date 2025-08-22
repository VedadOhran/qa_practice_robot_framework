*** Settings ***
Documentation       Cart-related keywords for verifying add/remove product operations and cart total updates.

Library             SeleniumLibrary
Variables           ../../Locators/Ecommerce/cart_locators.py
Resource            ./ecommerce_reusable_keywords.resource


*** Keywords ***
Remove Product With Title ${PRODUCT_TITLE} From Cart
    [Documentation]    Removes a product from the cart based on its title
    ${CART_REMOVE_BUTTON}=    Get Cart Item Remove Button    ${PRODUCT_TITLE}
    Click Element    ${CART_REMOVE_BUTTON}

Remove Products From List ${PRODUCTS_LIST} From Cart
    [Documentation]    Removes product with passed title from cart
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${CART_REMOVE_BUTTON}=    Get Cart Item Remove Button    ${PRODUCT_TITLE}
        Click Element    ${CART_REMOVE_BUTTON}
    END

Cart Should Contain Product With Title ${PRODUCT_TITLE}
    [Documentation]    Verify that a product at a given index is present in the cart by checking its title
    ${PRODUCT_TITLE_TEXT}=    Get Product Title Text    ${PRODUCT_TITLE}
    Element Should Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE_TEXT}

Cart Should Contain Products Added From List ${PRODUCTS_LIST}
    [Documentation]    Verifies that all products from the provided list are present in the cart by checking their titles
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${PRODUCT_TITLE_TEXT}=    Get Product Title Text    ${PRODUCT_TITLE}
        Element Should Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE_TEXT}
    END

Cart Total Should Be Updated After Product With Title ${PRODUCT_TITLE} Is Added
    [Documentation]    Validates that the cart total is updated correctly after adding a product with the given title
    ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
    ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    add
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Total Should Be Updated After Product With Title ${PRODUCT_TITLE} Is Removed
    [Documentation]    Validates that the cart total is updated correctly after removing a product with the given title
    ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
    ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    remove
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Total Should Be Updated After Products From List ${PRODUCTS_LIST} Are Added
    [Documentation]    Validates that the cart total is updated correctly after adding multiple products
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
        ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    add
    END
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Total Should Be Updated After Products From List ${PRODUCTS_LIST} Are Removed
    [Documentation]    Validates that the cart total is updated correctly after removing multiple products
    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
        ${PRODUCT_PRICE}=    Get Product Price    ${PRODUCT_TITLE}
        ${EXPECTED_TOTAL}=    Update Cart Total    ${PRODUCT_PRICE}    remove
    END
    Element Text Should Be    ${CART_TOTAL_PRICE_LOCATOR}    ${EXPECTED_TOTAL}

Cart Should Not Contain Removed Product With Title ${PRODUCT_TITLE}
    [Documentation]    Verifies that the cart does not contain the removed product
    Element Should Not Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE}

Cart Should Not Contain Removed Products From List ${PRODUCTS_LIST}
    [Documentation]    Verifies that the cart does not contain the removed productS

    FOR    ${PRODUCT_TITLE}    IN    @{PRODUCTS_LIST}
         Element Should Not Contain    ${CART_ITEMS_LOCATOR}    ${PRODUCT_TITLE}
    END
