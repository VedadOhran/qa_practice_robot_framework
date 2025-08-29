*** Settings ***
Documentation    Authentication-related keywords
Library    Collections
Library    RequestsLibrary
Variables    ../../TestData/test_data.py
Variables    ../../TestData/ApiEndpoints/test_api_endpoints.py


*** Keywords ***
Get Token
    [Documentation]    Returns bearer token required for authorization
    [Arguments]    ${SESSION_NAME}    ${BASE_URL}
    ${BODY}=    Create Dictionary    username=${AUTH_USERNAME}    password=${AUTH_PASSWORD}
    ${RESPONSE}=    POST On Session   ${SESSION_NAME}    ${BASE_URL}${RETURN_TOKEN}    json=${BODY}
    Log    ${RESPONSE.json()}

    RETURN    ${RESPONSE.json()}[token]
