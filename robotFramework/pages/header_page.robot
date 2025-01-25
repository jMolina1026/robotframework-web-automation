*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/common_keywords.resource

*** Variables ***
${app_logo}               css:div.app_logo
${shopping_cart}          css:a.shopping_cart_link
${shopping_cart_badge}    css:span.shopping_cart_badge
${burger_menu_button}     id:react-burger-menu-btn
${sub_title}              css:span.title
${active_sort_option}     css:span.active_option
${sort_container}         css:select.product_sort_container
${sort_options}           css:select.product_sort_container > option

*** Keywords ***
Header Element: ${element}, Should Have Text
    [Documentation]    Asserts that the header element has the specified text
    [Arguments]    ${text}
    Element: ${element}, Should Have Text    ${text}

Header Element: ${element}, Should Be Visible
    [Documentation]    Asserts that the header element is visible on the page
    [Arguments]    ${error_message}
    Element: ${element}, Should Be Visible    ${error_message}
