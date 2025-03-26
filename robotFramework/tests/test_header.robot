*** Settings ***
Resource    ../resources/common_keywords.resource
Resource    ../resources/config.robot
Resource    ../pages/login_page.robot
Resource    ../pages/header_page.robot
Test Setup       Open Browser And Log Into Application
Test Teardown    Close Browser

*** Test Cases ***
Testcase_001_Verify that the Header elements exist
    [Documentation]    Verifies that all necessary elements are in the header bar
    [Tags]             Sanity    Header
    Wait Until Element Is Visible    ${app_logo}
    Element Should Be Visible        ${app_logo}              The $app_logo is not on the page
    Element Should Be Visible        ${burger_menu_button}    The $burger_menu_button is not on the page
    Element Should Be Visible        ${shopping_cart}         The $shopping_cart is not on the page
    Element Should Be Visible        ${sub_title}             The $sub_title is not on the page 
