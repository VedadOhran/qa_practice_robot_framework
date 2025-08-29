*** Settings ***
Documentation       Test suite for verifying cart functionality

Resource            ../../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/cart_keywords.resource
Resource            ../../../Resources/PageObject/KeywordDefinitionFiles/Ecommerce/products_keywords.resource


*** Variables ***
@{PRODUCTS_LIST}    ${PRODUCT_LIST_ITEM_1}    ${PRODUCT_LIST_ITEM_2}    ${PRODUCT_LIST_ITEM_3}


*** Test Cases ***
Verify Product Can Be Added To Cart
    [Documentation]    Single product flow
    [Tags]    positive    regression
    Add Product ${PRODUCT_TITLE} To Cart
    Cart Should Contain Product ${PRODUCT_TITLE}
    Cart Total Should Be Updated After Product ${PRODUCT_TITLE} Is Added

Verify Multiple Products Can Be Added To Cart
    [Documentation]    Multiple products flow
    [Tags]    positive    regression
    Add Products ${PRODUCTS_LIST} To Cart
    Cart Should Contain Products ${PRODUCTS_LIST}
    Cart Total Should Be Updated After Products ${PRODUCTS_LIST} Are Added

Verify Product Can Be Removed From Cart
    [Documentation]    Remove product flow
    [Tags]    positive    regression
    Remove Product ${PRODUCT_TITLE} From Cart
    Cart Should Not Contain Removed Product ${PRODUCT_TITLE}
    Cart Total Should Be Updated After Product ${PRODUCT_TITLE} Is Removed

Verify Quantity Can Be Increased For Item In Cart
    [Documentation]    Quantity update
    [Tags]    positive    regression
    Add Product ${PRODUCT_TITLE} To Cart
    Increment Quantity Of Product ${PRODUCT_TITLE} By ${QUANTITY}
    Cart Total Should Update When ${PRODUCT_TITLE} Quantity Increases By ${QUANTITY}
