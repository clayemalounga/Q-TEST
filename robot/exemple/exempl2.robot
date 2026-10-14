*** Settings ***

Library    SeleniumLibrary

Test Setup       Ouverture Navigateur

Test Teardown    Fermer le navigateur

*** Variables ***
${URL}     https://automationplayground.com/crm/

*** Test Cases ***
CAS_LOGIN
    Survoler element login
    Ouvrir la page de login
    Verifier que la page contient Login

*** Keywords ***
Ouverture Navigateur

    Open Browser    ${URL}    Edge
    Sleep   2
    log    Ouverture du navigateur avec l'URL ${URL}

Survoler element login
    Mouse Up    xpath=/html/body/nav/ul/li/a
    sleep    1
    Mouse Down    xpath=/html/body/nav/ul/li/a
    sleep    1
    log    Survol du bouton de login

Ouvrir la page de login
    Click Element    xpath=/html/body/nav/ul/li/a
    Sleep    5
    log   Ouverture de la page de login

Verifier que la page contient Login
    Page Should Contain    Login
    Sleep    10
    log    Verification de la page de login

Fermer le navigateur
    Close Browser
    log    Fermeture du navigateur