*** Settings ***
Resource    ../resources/common_keywords.resource
Library     ../libraries/JsonConfig.py
# Library     ../libraries/Test123.py
Resource    ../resources/config.robot
Test Setup       Open Browser And Application
Test Teardown    Close Browser

*** Keywords ***
Open Browser And Application
    ${URL}    Get Config Value    base_url
    ${browser}    Get Config Value    browsers.${BROWSER}
    Open Browser    ${URL}    ${browser}

*** Test Cases ***
Testcase_001_Verify Valid Login
    # Get Config Value    base_url
    Log In    ${USERNAME}    ${PASSWORD}
    Page Should Contain    Products
    Sleep    3
    Capture Page Screenshot  screenshots/${TEST_NAME}.png
