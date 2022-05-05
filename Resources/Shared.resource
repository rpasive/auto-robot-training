*** Settings ***
Library    SeleniumLibrary
Resource   Login.resource

*** Variables ***

*** Keywords ***
Start test
    open browser    ${login_url}  chrome
    maximize browser window

End test
    close browser