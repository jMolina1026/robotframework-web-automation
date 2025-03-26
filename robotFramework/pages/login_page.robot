*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common_keywords.resource

*** Variables ***
#=================== Locators =============================
${login_logo}                 css:div.login_logo
${username_field}             id:user-name
${password_field}             id:password
${login_button}               id:login-button
${error_message_container}    css:div.error-message-container.error

#=================== Strings =============================

*** Keywords ***

Input Credentials
    [Arguments]    ${username}    ${password}
    Input Text: ${username} Into Element Field: ${username_field}
    Input Text: ${password} Into Element Field: ${password_field}

Click Login Button
    Click The Element: ${login_button}

Log In
    [Documentation]    Log into the site
    [Arguments]        ${username}    ${password}
    Wait Until The Element: ${username_field}, Is Visible
    Wait Until The Element: ${password_field}, Is Visible
    Input Credentials       ${username}    ${password}
    Wait Until The Element: ${login_button}, Is Visible
    Click Login Button

Login Element: ${element}, Should Have Text
    [Documentation]    Asserts that the header element has the specified text
    [Arguments]    ${text}
    Element: ${element}, Should Have Text    ${text}

Login Element: ${element}, Should Be Visible
    [Documentation]    Asserts that the login element is visible on the page
    [Arguments]    ${error_message}
    Element: ${element}, Should Be Visible    ${error_message}

Wait Until Login Element: ${element}, Is Visible
    [Documentation]    Waits until the specified Login page element is visible on the page
    Wait Until The Element: ${element}, Is Visible

Click The Login Element: ${element}
    [Documentation]    Clicks the Login Button/element
    Click The Element: ${element}
