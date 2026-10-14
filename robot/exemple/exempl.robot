*** Settings ***

Library        SeleniumLibrary

*** Variables ***
${URL}         https://robotcode.io/

*** Test Cases ***
Open Browser and Verify Title
    Open Browser    ${URL}    Edge
    Sleep    5
    Page Should Contain    RobotCode
    Close Browser


    