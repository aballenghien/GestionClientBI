
# Tableau de bord pour OfficeShop

Le but de ce projet est de pouvoir enregistrer un nombre important de données concernant les commandes
passées par les client pour l'entreprise OFFICE SHOP. Ces données vont permettre d’extraire des connaissances
sur l'entreprise qui pourra ainsi améliorer son service.

## Prérequis:
* Serveur MYSQL disponible
* JRE 1.7

## Initialisation
1. Décompresser l'archive *AB_RH_exec_officeshop.zip*
2. Créer une nouvelle base de données *bi_ods_officeshop*
3. Exécuter les scripts SQL: 
 * *AB_RH_bi_ods_officeshop.sql* pour créer les tables
 * *AB_RH_init_Tab_Dim.sql* pour initialiser les tables de dimension

## Exécution

1. Paramétrage de l'exécution
 * Remplir le fichier de paramétrage *env.properties* (voir partie suivante)
 * Indiquer le chemin du fichier *env.properties* dans le fichier à exécuter *exec\exec_run.bat* ou  *exec\exec_run.sh*
2. Lancer le job
 * Réunir tous les fichiers des données sources dans l'endroit que vous avez indiquez dans le fichier *env.properties* (Attention à ce que les noms correspondent !)
 * Exécuter le fichier "exec\exec_run.bat" (windows) ou "exec\exec_run.sh" (linux)

Votre base de données devrait être complète !!

## Fichier de paramétrage

|       Propriété         |                   Commentaire
|          ---            |                       ---
| fichier_produits        | Nom du fichier des produits
| fichier_clients         | Nom du fichier des clients
| fichier_territoires     | Nom du fichier des territoires
| fichier_commandes       | Nom du fichier des commandes
| dossier_data            | Emplacement des fichiers de données (Attention : double slash sous windows !)
| dossier_archive         | Emplacement des archives
| cnxODS_Server           | IP du serveur de BDD
| cnxODS_Port             | Port du serveur de BDD
| cnxODS_AdditionalParams | Autres paramètres pour la BDD
| cnxODS_Database         | Nom de la BDD
| cnxODS_Login            | Identifiant de la BDD
| cnxODS_Password         | Mot de passe de la BDD




