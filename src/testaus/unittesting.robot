*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***
Open home page and Go to Projects

    Open Browser     http://localhost:3000/    Chrome
    Maximize Browser Window

    Set Selenium Speed    0.3

    Click Link    Projects

Edit Project Card Davis and Sons with Empty Fields

    Click Button    xpath://button[@aria-label='edit Davis and Sons']
    Click Element    id:name
    Press Keys    None    CTRL+A
    Press Keys    None    BACKSPACE
    Current Frame Should Contain    Name is required

    Click Element    id:description
    Press Keys    None    CTRL+A
    Press Keys    None    BACKSPACE
    Current Frame Should Contain    Description is required.

    Input Text    id:budget    0
    Current Frame Should Contain    Budget must be more than $0.

Edit name with one and two letters

    Input Text    id:name    A
    Current Frame Should Contain    Name needs to be at least 3 characters.

    Input Text    id:name    Aa
    Current Frame Should Contain    Name needs to be at least 3 characters.

Edit Budget of Disselik LLCs    
    
    Click Button    xpath://button[@aria-label='edit Dillesik LLCs']
    ${budget1} =    Get Value   id:budget
    Click Element    id:budget
    Press Keys    None    '\ue013'
    ${budget2} =    Get Value   id:budget
    Should Be True	${budget1} < ${budget2}

Budget can be more than 0 

    Input Text    id:budget    0.1
    Click Button    xpath://button[@class='primary bordered medium']

    [Teardown]    Close Browser