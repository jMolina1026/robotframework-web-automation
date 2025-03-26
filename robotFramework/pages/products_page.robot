*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/common_keywords.resource

*** Variables ***
${product_container}        css:div.inventory_item
${product_name}             css:div.inventory_item_name
${product_desc}             css:div.inventory_item_desc
${product_price}            css:div.inventory_item_price
${product_add_to_cart}      css:button.btn_primary
${product_item_image}       css:div.inventory_item_img
${product_remove_button}    css:button.btn_secondary


*** Keywords ***
Product Element: ${element}, Should Have Text
    [Documentation]    Asserts that the product element has the specified text
    [Arguments]        ${text}
    Element: ${element}, Should Have Text    ${text}

Product Element: ${element}, Should Be Visible
    [Documentation]    Asserts that the product element is visible on the page
    [Arguments]        ${error_message}
    Element: ${element}, Should Be Visible    ${error_message}

Product Element Count
    [Documentation]    Test
    [Arguments]    ${element}
    ${element_count}    Get The Element Count    ${element}
    RETURN    ${element_count}
