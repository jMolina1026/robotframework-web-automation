*** Settings ***
Resource    ../resources/common_keywords.resource
Resource    ../resources/config.robot
Resource    ../pages/login_page.robot
Resource    ../pages/header_page.robot
Test Setup       Open Browser And See Login Page
Test Teardown    Close Browser

*** Test Cases ***
Testcase_001_Verify the Sign In Form
    [Documentation]    Verifies that all necessary elements are in the login page
    [Tags]             Sanity    Login
    Wait Until Login Element: ${username_field}, Is Visible
    Login Element: ${username_field}, Should Be Visible    The $username_field is not on the page
    Login Element: ${password_field}, Should Be Visible    The $password_field is not on the page
    Login Element: ${login_button}, Should Be Visible      The $login_button is not on the page
    Capture Page Screenshot                                screenshots/${TEST_NAME}.png
    Sleep    3

Testcase_002_Verify login with the correct email and password
    [Documentation]    Logs in to the site as expected
    [Tags]             Regression    Login
    Log In                                             ${USERNAME}    ${PASSWORD}
    Header Element: ${sub_title}, Should Be Visible    The sub_title may be missing or did now appear in time
    Header Element: ${sub_title}, Should Have Text     Products
    Capture Page Screenshot                            screenshots/${TEST_NAME}.png

Testcase_003_Verify login with the incorrect username and correct password
    [Documentation]    The user will not log into the site.
    [Tags]             Regression    Login
    Log In                                                          wrong_username                ${PASSWORD}
    Login Element: ${error_message_container}, Should Be Visible    The error message is not displayed
    Login Element: ${error_message_container}, Should Have Text     Epic sadface: Username and password do not match any user in this service
    Capture Page Screenshot                                         screenshots/${TEST_NAME}.png

Testcase_004_Verify login with the correct username and incorrect password
    [Documentation]    The user will not log into the site.
    [Tags]             Regression    Login
    Log In    ${USERNAME}    wrong_password
    Login Element: ${error_message_container}, Should Be Visible    The error message is not displayed
    Login Element: ${error_message_container}, Should Have Text     Epic sadface: Username and password do not match any user in this service
    Capture Page Screenshot                                         screenshots/${TEST_NAME}.png

Testcase_005_Verify login with no username and correct password
    [Documentation]    The user will be prompted with an error message.
    ...                The error message will read that the username is missing
    [Tags]             Regression    Login
    Login Element: ${password_field}, Should Be Visible             The $password_field is not on the page
    Input Text: ${PASSWORD} Into Element Field: ${password_field}
    Login Element: ${login_button}, Should Be Visible               The $login_button is not on the page
    Click The Login Element: ${login_button}
    Login Element: ${error_message_container}, Should Be Visible    The error message is not displayed
    Login Element: ${error_message_container}, Should Have Text     Epic sadface: Username is required
    Capture Page Screenshot                                         screenshots/${TEST_NAME}.png

Testcase_006_Verify login with the correct username and no password
    [Documentation]    The user will be prompted with an error message.
    ...                The error message will read that password is missing
    [Tags]             Regression    Login
    Login Element: ${username_field}, Should Be Visible             The $username_field is not on the page
    Input Text: ${USERNAME} Into Element Field: ${username_field}
    Login Element: ${login_button}, Should Be Visible               The $login_button is not on the page
    Click The Login Element: ${login_button}
    Login Element: ${error_message_container}, Should Be Visible    The error message is not displayed
    Login Element: ${error_message_container}, Should Have Text     Epic sadface: Password is required
    Capture Page Screenshot                                         screenshots/${TEST_NAME}.png
