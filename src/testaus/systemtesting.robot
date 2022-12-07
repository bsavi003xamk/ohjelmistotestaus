*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***
Open home page and Go to Projects

    Open Browser     http://localhost:3000/    Chrome
    Maximize Browser Window

    Set Selenium Speed    0.5

    Wait Until Page Contains    Home

    Click Link    Projects

Press More -button as many times that there is more Project Cards to load  

    ${projectsCount} =    Set Variable    0
    ${previousProjectsCount} =    Set Variable    0

    # https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#while-loops
    WHILE    True
        Scroll Element Into View    class:col-sm-12
        Click Element       //*[contains(text(),'More...')]

        # https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Using%20variables%20with%20keywords%20creating%20or%20accessing%20variables
        Set Local Variable    $previousProjectsCount    ${projectsCount}

        Log To Console    previous projects ${previousProjectsCount} and project in the page right now ${projectsCount}

        ${projectsCount} =     Get Element Count    class:cols-sm
        Exit For Loop If    ${projectsCount} == ${previousProjectsCount}
    END

Edit Wiza - Howell and check the Project Details    

    Click Button    xpath://button[@aria-label='edit Wiza - Howell']

    Input Text    id:description    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Input Text    id:budget    96235
    Select Checkbox    isActive

    Click Button    xpath://button[@class='primary bordered medium']

    Click Element       //*[contains(text(),'Wiza - Howell')]

    Page Should Contain    Project Detail
    Page Should Contain    Wiza - Howell
    Page Should Contain    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Page Should Contain    Budget : 96235
    Page Should Contain    active

Back to Home page    

    Click Link    Home

    Page Should Contain    Home

    Sleep    3s

    [Teardown]    Close Browser