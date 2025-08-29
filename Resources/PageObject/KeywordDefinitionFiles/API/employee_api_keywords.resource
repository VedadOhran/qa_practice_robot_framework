*** Settings ***
Documentation    Api-related keywords
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary
Variables    ../../TestData/ApiEndpoints/test_api_endpoints.py
Variables    ../../TestData/test_data.py


*** Variables ***
${SCHEMA_FILE_BASE}   ${CURDIR}${/}../../TestData
${EMPLOYE_SCHEMA_FILE}    ${SCHEMA_FILE_BASE}/JsonModelsSchema/employee_schema.json


*** Keywords ***
Get All Employees
    [Documentation]    Get all employees list
    [Arguments]    ${SESSION_NAME}    ${BASE_URL}
    ${RESPONSE}=    GET On Session    ${SESSION_NAME}    ${BASE_URL}${ALL_EMPLOYEES}

    RETURN    ${RESPONSE}

Get Employee By Id ${EMPLOYEE_ID}
    [Documentation]    Get employee by the given id
    [Arguments]    ${SESSION_NAME}    ${BASE_URL}
    ${RESPONSE}=    GET On Session    ${SESSION_NAME}    ${BASE_URL}${EMPLOYEE_BY_ID.format(id=${EMPLOYEE_ID})}

    RETURN    ${RESPONSE}

Create Employee
    [Documentation]    Creates new employee with values provided from json file
    [Arguments]    ${EMPLOYEE_JSON_FILE}    ${SESSION_NAME}    ${BASE_URL}
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${EMPLOYEE_DATA}=    Load Json From File    ${EMPLOYEE_JSON_FILE}
    POST On Session    ${SESSION_NAME}    ${BASE_URL}${ALL_EMPLOYEES}    json=${EMPLOYEE_DATA}    headers=${HEADERS}

Get Last Employee
    [Documentation]    Since the POST for Employee doesn't return a response, I take the last created employee to validate its schema
    [Arguments]    ${SESSION_NAME}    ${BASE_URL}
    ${ALL_EMPLOYEES}=    Get All Employees    ${SESSION_NAME}    ${BASE_URL}
    ${EMPLOYEES_COUNT}=    Get Length    ${ALL_EMPLOYEES.json()}
    VAR    ${LAST_EMPLOYEE}=
    ...    ${ALL_EMPLOYEES.json()}[${EMPLOYEES_COUNT -1}]

    RETURN    ${LAST_EMPLOYEE}

Delete Employee By Id ${EMPLOYEE_ID}
    [Documentation]    Delete employee by the given id
    [Arguments]    ${SESSION_NAME}    ${BASE_URL}
    DELETE On Session    ${SESSION_NAME}    ${BASE_URL}${EMPLOYEE_BY_ID.format(id=${EMPLOYEE_ID})}

Get All Employees Authorized
    [Documentation]    Get all employees endpoint that requires authorization
    [Arguments]    ${SESSION_NAME}    ${BASE_URL}    ${HEADERS}
    ${RESPONSE}=    GET On Session    ${SESSION_NAME}    ${BASE_URL}${REQUIRE_AUTHORIZATION_EMPLOYEES}    headers=${HEADERS}

    RETURN    ${RESPONSE}

Validate Employee Schema
    [Documentation]    Validates employee json schema
    [Arguments]    ${RESPONSE}
    Validate Json By Schema File    ${RESPONSE}    ${EMPLOYE_SCHEMA_FILE}
