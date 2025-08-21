*** Settings ***
Documentation       Products-related reusable keywords for verifying product visibility, adding products to the cart

Library             String
Library             SeleniumLibrary
Variables           ../../Locators/Ecommerce/products_locators.py
Resource            ./ecommerce_reusable_keywords.resource


*** Keywords ***
There Should Be ${EXPECTED_COUNT} Products Visible
    [Documentation]    Verify that expected number of products is visible on the page
    ${ITEMS_COUNT}=    Get Count From List    ${PRODUCT_LOCATOR}
    Should Be Equal    ${ITEMS_COUNT}    ${EXPECTED_COUNT}

Products From Index ${FROM} To Index ${TO} Should Be Visible
    [Documentation]    Verify that products in the given range are visible on the page

    FOR    ${INDEX}    IN RANGE    ${FROM}    ${TO}
        VAR
        ...    ${PRODUCT_BUTTON_LOCATOR}=    ${ADD_TO_CART_BUTTON_LOCATOR_BY_INDEX.format(index=${INDEX})}
        Wait Until Element Is Visible    ${PRODUCT_BUTTON_LOCATOR}
    END

Add Product With Title ${PRODUCT_TITLE} To Cart
    [Documentation]    Add a product with passed title to cart
    VAR
    ...    ${PRODUCT_BUTTON_LOCATOR}=    ${ADD_TO_CART_BUTTON_LOCATOR_BY_TITLE.format(title="${PRODUCT_TITLE}")}
    Click Element    ${PRODUCT_BUTTON_LOCATOR}

Add Products From List ${PRODUCTS_LIST} To Cart
    [Documentation]    Add multiple products from passed list to cart
    FOR    ${PRODUCT_NAME}    IN    @{PRODUCTS_LIST}
        Add Product With Title ${PRODUCT_NAME} To Cart
    END
