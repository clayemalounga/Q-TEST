*** Settings ***

Library    SeleniumLibrary
Variables    ../pageobject/locator.py
Variables    ../pageobject/variable.py

#Suite Setup       Ouverture Navigateur cela n'est pas possible car on ne peut pas ouvrir le navigateur avant d'avoir lancer les tests, car le navigateur doit être ouvert pour chaque test case. Donc on ne peut pas l'ouvrir dans le suite setup.
#Suite Teardown    Fermer le navigateur


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
    [Arguments]    ${EMAIL_VALIDE}    ${PASSWORD_VALIDE}
    Input Text    ${EMAIL_VALIDE_ID}   ${EMAIL_VALIDE}
    Input Text    ${PASSWORD_VALIDE_ID}    ${PASSWORD_VALIDE}
    Click Button  ${SUBMIT_BUTTON_ID}
    Sleep    1
    Log    Authentification de l'utilisateur en cours avec le nom d'utilisateur ${EMAIL_VALIDE} et le mot de passe ${PASSWORD_VALIDE}

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
    [Arguments]    ${NOM_CUSTOMER}    ${PRENOM_CUSTOMER}    ${EMAIL_CUSTOMER}    ${TELEPHONE_CUSTOMER}    ${STATE_REGION_CUSTOMER}    ${GENDER_CUSTOMER}
    Page Should Contain    Add Customer
    Sleep    1
    Input Text    ${EMAIL_CUSTOMER_INPUT}    ${EMAIL_CUSTOMER}
    Input Text    ${FIRST_NAME_INPUT}     ${PRENOM_CUSTOMER}
    Input Text    ${LAST_NAME_INPUT}         ${NOM_CUSTOMER}
    Input Text    ${CITY_INPUT}         ${TELEPHONE_CUSTOMER}
    Select From List By Label    ${STATE_REGION_SELECT}    ${STATE_REGION_CUSTOMER}
    Select Radio Button    ${GENDER_RADIO_BUTTON}    ${GENDER_CUSTOMER}
    Select Checkbox    ${CHECKBOX_PROMOS}  
    Click Button   ${SUBMIT_CUSTOMER_BUTTON}
    sleep    1
    Log  Création d'un nouveau customer en cours 

Fermer le navigateur
    Close Browser
    Log    Fermeture du navigateur