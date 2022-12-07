*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***
Open home page and Go to Projects

    Open Browser     http://localhost:3000/    Chrome
    Maximize Browser Window

    Set Selenium Speed    0.5

    Click Link    Projects
    Page Should Contain Element    class:container

Edit Project Card Beatty, Boehm and West

    Click Button    xpath://button[@aria-label='edit Beatty, Boehm and West']

    Input Text    id:description    Lorem ipsum
    Input Text    id:budget    77200
    Select Checkbox    isActive

    Click Button    xpath://button[@class='primary bordered medium']

    Click Element       //*[contains(text(),'Beatty, Boehm and West')]

    Page Should Contain    Project Detail
    Page Should Contain    Lorem ipsum
    Page Should Contain    Budget : 77200
    Page Should Contain    active

Count Project Cards on First and Second Page

    Click Link    Projects

    ${countfirstpage} =	Get Element Count	class:cols-sm
    Should Be True	${countfirstpage} <= 20

    Scroll Element Into View    class:col-sm-12
    Click Element       //*[contains(text(),'More...')]
    ${countsecondpage} =	Get Element Count	class:cols-sm
    Should Be True	${countsecondpage} > 20        

Back to Project and another Edit

    Click Link    Projects

    Scroll Element Into View    class:col-sm-12
    Click Element       //*[contains(text(),'More...')]

    Scroll Element Into View    //*[contains(text(),'Fisher - Okuneva')]
    Click Button    xpath://button[@aria-label='edit Fisher - Okuneva']
    
    Input Text    id:name    Hunter - Jokuneva
    Unselect Checkbox    isActive

    Click Button    xpath://button[@class='primary bordered medium']

    Click Element       //*[contains(text(),'Hunter - Jokuneva')]

    Page Should Contain    Project Detail
    Page Should Contain    Hunter - Jokuneva
    Page Should Contain    inactive

    [Teardown]    Close Browser