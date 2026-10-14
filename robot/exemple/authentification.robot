*** Settings ***

Library    SeleniumLibrary

Suite Setup       Ouverture Navigateur
Suite Teardown    Fermer le navigateur

*** Variables ***

${URL}                 https://automationplayground.com/crm/
${EMAIL_VALIDE}        admin@robotframeworktutorial.com
${PASSWORD_VALIDE}     pwd
${EMAIL_INVALIDE}      invalidexample.comhhdjhsjds
${PASSWORD_INVALIDE}       

*** Test Cases ***
CAS_LOGIN_NON_PASSANT1
    [Documentation]    Un email invalide ne doit pas permettre la connexion.
    Scenario Login    ${EMAIL_INVALIDE}    ${PASSWORD_VALIDE}    NON_CONNECTE

CAS_LOGIN_NON_PASSANT2
    [Documentation]    Un mot de passe invalide ne doit pas permettre la connexion.
    Scenario Login    ${EMAIL_VALIDE}    ${PASSWORD_INVALIDE}    NON_CONNECTE

CAS_LOGIN_PASSANT
    [Documentation]    Un email et un mot de passe valides doivent permettre la connexion.
    Scenario Login    ${EMAIL_VALIDE}    ${PASSWORD_VALIDE}    CONNECTE

*** Keywords ***
Ouverture Navigateur
    Open Browser    ${URL}    Edge
    Sleep    2
    Log    Ouverture du navigateur avec l'URL ${URL}

Survoler element login
    Mouse Up    xpath=/html/body/nav/ul/li/a
    Sleep    1
    Mouse Down    xpath=/html/body/nav/ul/li/a
    Sleep    1
    Log    Survol du bouton de login

Ouvrir la page de login
    Click Element    xpath=/html/body/nav/ul/li/a
    Sleep    2
    Log    Ouverture de la page de login

Verifier que la page contient Login
    Page Should Contain    Login
    Sleep    2
    Log    Verification de la page de login

Scenario Login
    [Arguments]    ${email}    ${password}    ${expected_result}
    Survoler element login
    Ouvrir la page de login
    Verifier que la page contient Login
    Authentification de l'utilisateur    ${email}    ${password}

    Run Keyword If    '${expected_result}' == 'CONNECTE'
    ...    Verifier que l'utilisateur est connecté
    ...    ELSE
    ...    Verifier que l'utilisateur n'est pas connecté

Authentification de l'utilisateur
    [Arguments]    ${email}    ${password}
    Input Text    id=email-id    ${email}
    Input Text    id=password    ${password}
    Click Button    id=submit-id
    Sleep    1
    Log    Authentification de l'utilisateur en cours avec le nom d'utilisateur ${email} et le mot de passe ${password}

Verifier que l'utilisateur est connecté
    Page Should Contain    Our Happy Customers
    Sleep    2
    Log    Vérification que l'utilisateur est connecté avec succès

Verifier que l'utilisateur n'est pas connecté
    Page Should Not Contain    Our Happy Customers
    Sleep    2
    Log    Vérification que l'utilisateur n'est pas connecté

Fermer le navigateur
    Close Browser
    Log    Fermeture du navigateur