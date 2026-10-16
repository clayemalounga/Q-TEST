# RobotFrameWork Test case On Web.

- Tests d'un ou plusieurs parcours utilisateurs

# https://automationplayground.com/crm/ 
- Url de la plateforme web cible.

# 1- Organisation des dossiers

# a- Dossier : PAGEOBJECT 
- locator.py et variables.py | Ces fichiers contiennent les configurations des variables et paths ( chemins des elements html) utilisent pour le fonctionnement des differents scenarios. 

# b- Dossier : PERFORMANCE
- loadTest.js et README.md | Le premier contenant le script puis le second decrivant les outils ( K6 ) pui d'autres elements important.

# c- Dossier : RESOURCES 
- Ce dossier contient la configuration des paramettres ( import des differentes libraries, etc..) et mots cles dont nos differents diferents fichier contenant les cas de test proporement auront besoin. 

# d- Dossier : RESULTS
- Ce dossier est genere lorsque le clique sur l'execution des differents cas de test sans passer par la ligne de commande. 

# e- Dossier : TESTCASES
- Ce dossier contient nos differents fichiers qui contiendront les cas de tests. Nous en avons deux dans ce dossier (authentication_valide.robot puis le authentification.robot)

- Authentication_valide.robot contient les bonne pratiques. L'utilisation des differents fichiers(celui qui est dans le dossier resources et les fichiers qui sont dans le dossier pageobject). 

- authentification.robot contient un code pas non restructurer. Tout y est. Variables, settings, KeyWords etc...

# f- Dossier : OUTPUT
- Ce dernier dossier contient 

# Commande d'execussion des fichiers de tests
- Manuelle : robot -d output  authentication_valide.robot


