*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/common_keywords.resource

*** Variables ***
${app_logo}              css:div.app_logo
${shopping_cart}         css:a.shopping_cart_link
${burger_menu_button}    id:react-burger-menu-btn
${sub_title}             css:span.title

${product_container}    css:div.inventory_item
${product_name}    css:div.inventory_item_name
${product_desc}    css:div.inventory_item_desc
${product_price}    css:div.inventory_item_price
${product_add_to_cart}    css:button.btn_primary
${proudct_item_image}    css:div.inventory_item_img


*** Keywords ***
Header Element: ${element}, Should Have Text
    [Documentation]    Asserts that the header element has the specified text
    [Arguments]    ${text}
    Element: ${element}, Should Have Text    ${text}

Header Element: ${element}, Should Be Visible
    [Documentation]
    [Arguments]    ${error_message}
    Element: ${element}, Should Be Visible    ${error_message}
