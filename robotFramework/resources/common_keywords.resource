*** Settings ***
Documentation    Common Keywords for All Pages
Library        SeleniumLibrary
Library        DateTime
Library    ../../robot_venv/lib/python3.12/site-packages/robot/libraries/XML.py
Resource       ../resources/config.robot
Resource       ../pages/login_page.robot

*** Variables ***
${x}  0

*** Keywords ***
#=================== Utilities =============================
# Get DateTime
#   ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
#   RETURN     ${date1}

# Screenshot
#   [Arguments]  ${filename}
#   Set Screenshot Directory  /Users/jorgemolina/RobotFrameWork-web-automation-python/report/screenshots
#   # Wait Until Page Contains  Element
#   ${datetime}=  Get DateTime
#   Capture Page Screenshot  ${datetime}.png
#   Log To Console  ${\n}Screenshot    

#=================== ACTIONS =============================
Custom Window Size
    [Documentation]    Resizes the browser window size
    IF    '${BROWSER}' == 'chrome'
        Maximize Browser Window
    ELSE IF   '${BROWSER}' == 'headlesschrome'
        Set Window Size    1920    1080
    END

Open Browser And See Login Page
    Open Browser                 ${URL}    ${BROWSER}
    Custom Window Size

Open Browser And Log Into Application
    [Documentation]    Opens the Browser, decides if headless, then Logs
    ...                into the application
    Open Browser                 ${URL}    ${BROWSER}
    Custom Window Size
    Element Should Be Visible    ${login_logo}
    Log In                       ${USERNAME}    ${PASSWORD}

Get The Element: ${element} Text
    [Documentation]      Stores the elements Text
    Get Element Text    ${element}

Input Text: ${text} Into Element Field: ${element}
    [Documentation]    Types text into an input field or text box
    Input Text    ${element}    ${text}

Click The Element: ${element}
    [Documentation]    Clicks the element specified by the element_locator
    Click Element    ${element}

Get The Element Count
    [Documentation]    Test
    [Arguments]    ${element}
    ${element_count}    SeleniumLibrary.Get Element Count    ${element}
    RETURN    ${element_count}


#=================== ASSERTIONS ==========================

Wait Until The Element: ${element}, Is Visible
    [Documentation]    Waits until an element is visible on the page
    Wait Until Element Is Visible    ${element}

Element: ${element}, Should Be Visible
    [Documentation]    Asserts that the element is shown on the page
    [Arguments]                  ${error_message}
    Element Should Be Visible    ${element}    ${error_message}

Element: ${element}, Should Have Text
    [Documentation]    Asserts that the element in focus has a specfic string of text
    [Arguments]               ${text}
    Element Should Contain    ${element}    ${text}
