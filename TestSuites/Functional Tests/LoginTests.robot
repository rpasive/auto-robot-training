*** Settings ***
Documentation   This is test suite is all about login
Library  SeleniumLibrary
Resource  ../../Resources/Login.resource
Resource  ../../Resources/Shared.resource

Library  DataDriver     ../../TestData/LoginTestData.xlsx       sheet_name=${env}

Suite Setup      Start test
Suite Teardown   End test

Test Template   Verify that login works

*** Test Cases ***
Login functionality     ${username}     ${password}     ${message}

*** Keywords ***
Verify that login works
    [Documentation]  Verify logins works with valid credentials
    [Arguments]     ${username}   ${password}   ${message}

    Login  ${username}      ${password}
    page should contain   ${message}