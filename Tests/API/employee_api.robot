*** Settings ***
Documentation    Test suite for verifying employee api's
Library    RequestsLibrary
Resource    ../../Resources/PageObject/KeywordDefinitionFiles/API/employee_api_keywords.resource
Resource    ../../Resources/PageObject/KeywordDefinitionFiles/API/auth_api_keywords.resource

Suite Setup    Create Session    ${SESSION_NAME}    ${BASE_URL}


*** Variables ***
${EMPLOYEE__TO_CREATE_JSON}    ${CURDIR}${/}../../Resources/PageObject/TestData/JsonModels/create_employee.json


*** Test Cases ***
Verify GET All Employees
    [Documentation]    Get all employees flow
    ${RESPONSE}=    Get All Employees    ${SESSION_NAME}   ${BASE_URL}
    Status Should Be    200    ${RESPONSE}
    Log    ${RESPONSE.json()}

Verify GET Employee By Id
    [Documentation]    Get employee by id flow
    ${RESPONSE}=    Get Employee By Id ${GET_EMPLOYEE_BY_ID}    ${SESSION_NAME}   ${BASE_URL}
    Status Should Be    200    ${RESPONSE}
    Validate Employee Schema    ${RESPONSE.json()}
    Log    ${RESPONSE.json()}

Verify POST Employee
    [Documentation]    Create new employee flow
    Create Employee    ${EMPLOYEE__TO_CREATE_JSON}    ${SESSION_NAME}    ${BASE_URL}
    Status Should Be    201
    ${CREATED_EMPLOYEE}=    Get Last Employee    ${SESSION_NAME}    ${BASE_URL}
    Validate Employee Schema    ${CREATED_EMPLOYEE}
    Log    ${CREATED_EMPLOYEE}

Verify DELETE Employee By Id
    [Documentation]    Delete employee by id flow
    ${EMPLOYEE_TO_DELETE}=    Get Last Employee    ${SESSION_NAME}    ${BASE_URL}
    ${EMPLOYEE_TO_DELETE_ID}=  Set Variable     ${EMPLOYEE_TO_DELETE}[id]
    ${RESPONSE}=    Delete Employee By Id ${EMPLOYEE_TO_DELETE_ID}    ${SESSION_NAME}    ${BASE_URL}
    Status Should Be    204    ${RESPONSE}

Verify Authorized GET All Employees
    [Documentation]    Get all employees when authorized
    ${TOKEN}=    Get Token    ${SESSION_NAME}    ${BASE_URL}
    ${HEADER}=    Create Dictionary    Authorization=Bearer ${TOKEN}
    ${RESPONSE}=    Get All Employees Authorized  ${SESSION_NAME}   ${BASE_URL}   ${HEADER}
    Status Should Be    200    ${RESPONSE}
    Log    ${RESPONSE.json()}
