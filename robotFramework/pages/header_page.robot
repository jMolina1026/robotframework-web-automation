*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/common_keywords.resource

*** Variables ***
${app_logo}               css:div.app_logo
${shopping_cart}          css:a.shopping_cart_link
${shopping_cart_badge}    css:span.shopping_cart_badge
${burger_menu_button}     id:react-burger-menu-btn
${sub_title}              css:span.title

*** Keywords ***
Header Element: ${element}, Should Have Text
    [Documentation]    Asserts that the header element has the specified text
    [Arguments]    ${text}
    Element: ${element}, Should Have Text    ${text}

Header Element: ${element}, Should Be Visible
    [Documentation]
    [Arguments]    ${error_message}
    Element: ${element}, Should Be Visible    ${error_message}
