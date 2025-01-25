*** Settings ***
Resource    ../resources/common_keywords.resource
Resource    ../resources/config.robot
Resource    ../pages/header_page.robot
Resource    ../pages/products_page.robot
Test Setup       Open Browser And Log Into Application
Test Teardown    Close Browser
Library    ../../robot_venv/lib/python3.12/site-packages/robot/libraries/Collections.py

*** Variables ***
&{name}
...    backpack=Sauce Labs Backpack
...    bikelight=Sauce Labs Bike Light
...    bolt_tshirt=Sauce Labs Bolt T-Shirt
...    jacket=Sauce Labs Fleece Jacket
...    onesie=Sauce Labs Onesie
...    red_tshirt=Test.allTheThings() T-Shirt (Red)

&{description}
...    backpack=carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
...    bikelight=A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.
...    bolt_tshirt=Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.
...    jacket=It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.
...    onesie=Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel.
...    red_tshirt=This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton.

&{price}
...    backpack=$29.99
...    bikelight=$9.99
...    bolt_tshirt=$15.99
...    jacket=$49.99
...    onesie=$7.99
...    red_tshirt=$15.99

&{add_to_cart}
...    backpack=Add to cart
...    bikelight=Add to cart
...    bolt_tshirt=Add to cart
...    jacket=Add to cart
...    onesie=Add to cart
...    red_tshirt=Add to cart

# @{product}
# ...    &{name}
# ...    &{description}
# ...    &{price}
# ...    &{AddToCart}

*** Test Cases ***
Testcase_001_Verify that the Products elements exist
    [Documentation]    Verifies that all necessary elements are in the Products Page
    [Tags]             Sanity    Product
    # Wait Until Element Is Visible    ${product_name}

    Wait Until The Element: ${product_name}, Is Visible
    ${count_of_products}    Product Element Count    ${product_name}
    ${product_names}        Get WebElements          ${product_name}
    ${product_descs}        Get WebElements          ${product_desc}
    ${product_prices}       Get WebElements          ${product_price}
    ${product_ATCs}         Get WebElements          ${product_add_to_cart}


    @{name_values}    Get Dictionary Values    ${name}
    @{desc_values}    Get Dictionary Values    ${description}
    @{price_values}   Get Dictionary Values    ${price}
    @{atc_values}     Get Dictionary Values    ${add_to_cart}

    FOR    ${index}    IN RANGE    ${count_of_products}
        Product Element: ${product_names}[${index}], Should Be Visible    The ${product_names}[${index}] = ${name_values[${index}]}, is not on the page  
        Product Element: ${product_names}[${index}], Should Have Text     ${name_values[${index}]}

        Product Element: ${product_descs}[${index}], Should Be Visible    The ${product_descs}[${index}] = ${desc_values[${index}]}, is not on the page  
        Product Element: ${product_descs}[${index}], Should Have Text     ${desc_values[${index}]}
    END
    # Element Should Be Visible        ${product_desc}          The $password_field is not on the page
    # Element Should Be Visible        ${product_price}         The $login_button is not on the page
    # Element Should Be Visible        ${product_container}     The $sub_title is not on the page
    # Element Should Be Visible        ${product_item_image}    The item image container is not visible
