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

# Variables pour la création d'un nouveau customer
${nom}          Tata@gmail.com
${prenom}       Toto
${email}        exemple.claye@gmail.com
${telephone}    +221 785818082
${stateRegion}  Florida
${gender}       male


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

CAS_CREATION_CUSTOMER
    [Documentation]    Création d'un nouveau customer.
    Page de creation d'un nouveau customer
    Creation d'un nouveau customer   ${nom}   ${prenom}    ${email}    ${telephone}   ${stateRegion}   ${gender}
    Verifier que l'utilisateur est connecté

*** Keywords ***
Ouverture Navigateur
    Open Browser    ${URL}    Edge
    Sleep    1
    Log    Ouverture du navigateur avec l'URL ${URL}

Survoler element login
    Mouse Up    xpath=/html/body/nav/ul/li/a
    Sleep    1
    Mouse Down    xpath=/html/body/nav/ul/li/a
    Sleep    1
    Log    Survol du bouton de login

Ouvrir la page de login
    Click Element    xpath=/html/body/nav/ul/li/a
    Sleep    1
    Log    Ouverture de la page de login

Verifier que la page contient Login
    Page Should Contain    Login
    Sleep    1
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

#Creation d'un nouveau customer 

Page de creation d'un nouveau customer
    Click Element    id=new-customer
    sleep    2
    log    Ouverture de la page de création d'un nouveau customer

Creation d'un nouveau customer
    [Arguments]    ${nom}    ${prenom}    ${email}    ${telephone}   ${stateRegion}   ${gender}
    Page Should Contain    Add Customer
    Sleep    1
    Input Text    id=EmailAddress    ${email}
    Input Text    id=FirstName     ${prenom}
    Input Text    id=LastName         ${nom}
    Input Text    id=City         ${telephone}
    Select From List By Label    id=StateOrRegion    ${stateRegion}
    Select Radio Button    gender    ${gender}
    Select Checkbox    name=promos-name  
    Click Button   Submit
    sleep    1
    Log  Création d'un nouveau customer en cours 

Fermer le navigateur
    Close Browser
    Log    Fermeture du navigateur