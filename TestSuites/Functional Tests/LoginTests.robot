*** Settings ***
Documentation   This is test suite is all about login
Library  SeleniumLibrary
Resource  ../../Resources/Login.resource

Test Setup      Start test
Test Teardown   End test

*** Variables ***
${R88866 resto button}     id:e1555637-2afa-11e9-afe2-0a17052014c8
${pickup button}           id:pickup
${phone number field}      id:originPhone
${chicken category}        id:cat_07a7108b-10e4-41c8-8c93-f0ab99eb40f0
${chicken w broccoli}      id:dish_f57d5d02-03f4-449a-b0f9-f91e29236288
${send button}             id:send
${confirm popup}           id:confirmModal

*** Test Cases ***
Verify that login works
    [Documentation]  Verify logins works with valid credentials
    [Tags]    login  TEST123  regression

    Login  cbarton      kjt
    sleep  15s
    Select restaurant  ${R88866 resto button}
    Select order type   ${pickup button}
    Inout phone number
    Select dish    click element   ${send button}
    sleep  3s
    element should be visible   ${confirm popup}
    page should contain element

*** Keywords ***
Start test
    open browser    ${login_url}  headlesschrome
    maximize browser window

End test
    close browser

Select restaurant
    [Arguments]    ${resto}
    click element   ${resto}

Select order type
    [Arguments]  ${order type}
    click element   ${order type}

Inout phone number
    input text      ${phone number field}   1524953820

Select dish
    click element   ${chicken category}

    click element   ${chicken w broccoli}

