INSERT INTO `dim_clients`(`pk_client`, `no_client`, `dt_finval`, `dt_debval`, `lib_nom`, `lib_prenom`, `lib_etat`, `lib_ville`, `lib_codepostal`, `lib_region`) 
VALUES (0,0,'00-00-0000','00-00-0000','inconnu','inconnu','inconnu','inconnu','00000','inconnu');

INSERT INTO `dim_managers`(`pk_manager`, `dt_debval`, `dt_finval`, `lib_nommanager`, `lib_region`) 
VALUES (0,'00-00-0000','00-00-0000','inconnu','inconnu');

INSERT INTO `dim_produits`(`pk_produit`, `no_produit`, `dt_debval`, `dt_finval`, `lib_nom`, `lib_categorieproduit`, `lib_souscategorieproduit`, `lib_typeemballage`) 
VALUES (0,'P0','00-00-0000','00-00-0000','inconnu','inconnu','inconnu','inconnu');

INSERT INTO `dim_temps`(`pk_date`, `lib_annee`, `lib_mois`, `lib_jour`, `lib_heure`,`lib_minute`) 
VALUES ('00-00-0000 00:00',0,0,0,0,0);