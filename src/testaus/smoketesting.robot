*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***
Open home page

    Open Browser     http://localhost:3000/    Chrome
    Maximize Browser Window

Should render Logo-image element

    Page Should Contain Image    logo

Should render header

    Wait Until Element Is Visible    class:sticky

    Page Should Contain Link    Projects

    Page Should Contain Link    Home

Page should contain heading "Home"

    Wait Until Page Contains    Home

    [Teardown]    Close Browser