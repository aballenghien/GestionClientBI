# Tableau de bord pour OfficeShop

Le but de ce projet est de pouvoir enregistrer un nombre importants de données concernant les commandes
passées par les client pour l'entreprise OFFICE SHOP. Ces données vont permettre d’extraire des connaissances
sur l'entreprise qui pourra ainsi améliorer son service.

## Prérequis:
* Serveur MYSQL disponible
* JRE 1.7

## Initialisation
1. Créer une nouvelle base de données *bi_ods_officeshop*
2. Exécuter les scripts SQL: 
 * *bi_ods_officeshop.sql* pour créer les tables
 * *init_Tab_Dim.sql* pour initialiser les tables de dimension

## Exécution

1. Paramétrage de l'exécution
 * Remplir le fichier *env.properties*
 * Indiquer le chemin du fichier *env.properties* dans le fichier à exécuter *exec\exec_run.bat* 
2. Lancer le job
 * Réunir tous les fichiers des données sources dans l'endroit que vous avez indiquez dans le fichier *env.properties* (Attention à ce que les noms correspondent !)
 * Exécuter le fichier "exec\exec_run.bat" (windows) ou "exec\exec_run.sh" (linux)

Votre base de données devrait être complète !!
