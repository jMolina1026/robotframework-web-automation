*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PROFILE_ICON}       css:.profile-icon
${LOGOUT_BUTTON}      css:.logout

*** Keywords ***
Verify Dashboard Loaded
    Page Should Contain Element   ${PROFILE_ICON}

Logout
    Click Element   ${PROFILE_ICON}
    Click Element   ${LOGOUT_BUTTON}
