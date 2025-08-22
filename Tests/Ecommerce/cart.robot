*** Settings ***
Documentation       Test suite for verifying cart functionality: adding, removing products and updating cart totals

Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/cart_keywords.resource
Resource            ../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/products_keywords.resource


*** Variables ***
@{PRODUCTS_LIST}    ${PRODUCT_LIST_ITEM_1}    ${PRODUCT_LIST_ITEM_2}    ${PRODUCT_LIST_ITEM_3}


*** Test Cases ***
Verify Product Can Be Added To Cart
    [Documentation]    Verifies that a single product can be added to the cart,
    ...    that it appears in the cart, and that the cart total is updated correctly
    Add Product With Title ${PRODUCT_TITLE} To Cart
    Cart Should Contain Product With Title ${PRODUCT_TITLE}
    Cart Total Should Be Updated After Product With Title ${PRODUCT_TITLE} Is Added

Verify Multiple Products Can Be Added To Cart
    [Documentation]    Verifies that multiple products can be added to the cart from a list,
    ...    and that all products appear in the cart
    Add Products From List ${PRODUCTS_LIST} To Cart
    Cart Should Contain Products Added From List ${PRODUCTS_LIST}
    Cart Total Should Be Updated After Products From List ${PRODUCTS_LIST} Are Added

Verify Product Can Be Removed From Cart
    [Documentation]    Verifies that a product can be removed from the cart by its index,
    ...    and the cart updates accordingly, on teardown product is added again so the next test case do not fail
    Remove Product With Title ${PRODUCT_TITLE} From Cart
    Cart Should Not Contain Removed Product With Title ${PRODUCT_TITLE}
    Cart Total Should Be Updated After Product With Title ${PRODUCT_TITLE} Is Removed

Verify Multiple Products Can Be Removed From Cart
    [Documentation]    Verifies that multiple products can be removed from the cart from a list,
    ...    and that all products disapear from the cart
    Remove Products From List ${PRODUCTS_LIST} From Cart
    Cart Should Not Contain Removed Products From List ${PRODUCTS_LIST}
    Cart Total Should Be Updated After Products From List ${PRODUCTS_LIST} Are Removed
