*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${login_url}    https://qa.letsdochinese.com/KJTCore/resources/index.html

${username_textfield}       id:username
${password_textfield}       id:password
${login_button}             id:login

*** Keywords ***
Login
    [Arguments]  ${username}    ${password}

    wait until element is visible   id:loginform
    input text      ${username_textfield}   ${username}
    input password  ${password_textfield}  ${password}

    click element   ${login_button}
