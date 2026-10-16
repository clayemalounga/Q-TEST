*** Settings ***

Resource    ../resources/authentication.robot

Suite Setup       Ouverture Navigateur
Suite Teardown    Fermer le navigateur

*** Test Cases ***

CAS_LOGIN_NON_PASSANT1
    [Documentation]    Un email invalide ne doit pas permettre la connexion.
    Scenario Login    ${EMAIL_IN_VALIDE}    ${PASSWORD_VALIDE}    NON_CONNECTE

CAS_LOGIN_NON_PASSANT2
    [Documentation]    Un mot de passe invalide ne doit pas permettre la connexion.
    Scenario Login    ${EMAIL_VALIDE}    ${PASSWORD_IN_VALIDE}    NON_CONNECTE

CAS_LOGIN_PASSANT
    [Documentation]    Un email et un mot de passe valides doivent permettre la connexion.
    Scenario Login    ${EMAIL_VALIDE}    ${PASSWORD_VALIDE}    CONNECTE

CAS_CREATION_CUSTOMER
    [Documentation]    Création d'un nouveau customer.
    Page de creation d'un nouveau customer
    Creation d'un nouveau customer   ${NOM_CUSTOMER}   ${PRENOM_CUSTOMER}    ${EMAIL_CUSTOMER}    ${TELEPHONE_CUSTOMER}   ${STATE_REGION_CUSTOMER}   ${GENDER_CUSTOMER}
    Verifier que l'utilisateur est connecté


