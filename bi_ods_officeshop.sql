-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 10 Décembre 2016 à 19:36
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- Base de données :  `bi_ods_officeshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `dim_clients`
--

CREATE TABLE IF NOT EXISTS `dim_clients` (

  `pk_client` int(11) NOT NULL,
  `no_Client` int(11) NOT NULL,
  `dt_finval` date NOT NULL DEFAULT '0000-00-00',
  `dt_debval` date NOT NULL DEFAULT '0000-00-00',
  `lib_nom` varchar(30) DEFAULT NULL,
  `lib_prenom` varchar(30) DEFAULT NULL,
  `lib_etat` varchar(30) NOT NULL DEFAULT '',
  `lib_ville` varchar(40) NOT NULL DEFAULT '',
  `lib_codePostal` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_managers`
--


CREATE TABLE IF NOT EXISTS `dim_managers` (
  `pk_manager` int(11) NOT NULL,
  `dt_debval` date NOT NULL DEFAULT '0000-00-00',
  `dt_finval` date NOT NULL DEFAULT '0000-00-00',
  `lib_nommanager` varchar(50) NOT NULL DEFAULT '',
  `lib_region` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_produits`
--

CREATE TABLE IF NOT EXISTS `dim_produits` (

  `pk_produit` int(11) NOT NULL,
  `no_produit` varchar(20) NOT NULL,  
  `dt_debval` date DEFAULT '0000-00-00',
  `dt_finval` date DEFAULT '0000-00-00',
  `lib_nom` varchar(20) DEFAULT NULL,
  `lib_categorieproduit` varchar(60) DEFAULT NULL,
  `lib_souscategorieproduit` varchar(60) DEFAULT NULL,
  `lib_typeemballage` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_temps`
--

CREATE TABLE IF NOT EXISTS `dim_temps` (  
  `pk_date` date NOT NULL DEFAULT '0000-00-00',
  `annee` int(11) NOT NULL DEFAULT '0',
  `mois` int(11) NOT NULL DEFAULT '0',
  `jour` int(11) NOT NULL DEFAULT '0',
  `heure` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fait_commandes`
--

CREATE TABLE IF NOT EXISTS `fait_commandes` (
  `pk_commande` int(11) NOT NULL,
  `no_commande` int(11) NOT NULL,
  `fk_client` int(11) NOT NULL DEFAULT '0',
  `fk_idproduit` int(11) NOT NULL DEFAULT '0',
  `fk_region` int(11) NOT NULL,
  `fk_datecommande` date NOT NULL DEFAULT '0000-00-00',
  `fk_dateexpedition` date NOT NULL DEFAULT '0000-00-00',
  `lib_prioritecommande` varchar(25) DEFAULT NULL,
  `mt_prixunitaire` decimal(10,2) DEFAULT NULL,
  `mt_margeproduitbrute` decimal(3,2) DEFAULT NULL,
  `lib_discount` decimal(3,2) DEFAULT NULL,
  `mt_fraisexpedition` decimal(5,2) DEFAULT NULL,
  `lib_modeexpedition` varchar(50) DEFAULT NULL,
  `lib_segmentclient` varchar(50) DEFAULT NULL,
  `lib_marge` varchar(255) DEFAULT NULL,
  `qt_quantiteVentes` int(4) DEFAULT NULL,
  `mt_ventes` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fic_clients`
--

CREATE TABLE IF NOT EXISTS `fic_clients` (
  `NoClient` varchar(255) DEFAULT NULL,
  `NomComplet` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `CodePostal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fic_commandes`
--

CREATE TABLE IF NOT EXISTS `fic_commandes` (
  `NoCommande` varchar(255) DEFAULT NULL,
  `PrioriteCommande` varchar(255) DEFAULT NULL,
  `NoClient` varchar(255) DEFAULT NULL,
  `Produit` varchar(255) DEFAULT NULL,
  `Prix_Unitaire` varchar(255) DEFAULT NULL,
  `Marge_Produit_Brut` varchar(255) DEFAULT NULL,
  `Discount` varchar(255) DEFAULT NULL,
  `FraisExpedition` varchar(255) DEFAULT NULL,
  `ModeExpedition` varchar(255) DEFAULT NULL,
  `SegmentClient` varchar(255) DEFAULT NULL,
  `DateCommande` varchar(255) DEFAULT NULL,
  `DateExpedition` varchar(255) DEFAULT NULL,
  `Marge` varchar(255) DEFAULT NULL,
  `QuantiteVentes` varchar(255) DEFAULT NULL,
  `MontantVentes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fic_produits`
--

CREATE TABLE IF NOT EXISTS `fic_produits` (
  `IdProduit` varchar(255) DEFAULT NULL,
  `Produit` varchar(255) DEFAULT NULL,
  `CategorieProduit` varchar(255) DEFAULT NULL,
  `SousCategorieProduit` varchar(255) DEFAULT NULL,
  `TypeEmballage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fic_territoires`
--

CREATE TABLE IF NOT EXISTS `fic_territoires` (
  `Region` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ods_clients`
--

CREATE TABLE IF NOT EXISTS `ods_clients` (
  `noClient` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `etat` varchar(30) NOT NULL DEFAULT '',
  `ville` varchar(40) NOT NULL DEFAULT '',
  `codePostal` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ods_commandes`
--

CREATE TABLE IF NOT EXISTS `ods_commandes` (
  `noCommande` int(11) NOT NULL,
  `prioriteCommande` varchar(25) DEFAULT NULL,
  `prixUnitaire` decimal(10,2) DEFAULT NULL,
  `margeProduitBrute` decimal(3,2) DEFAULT NULL,
  `discount` decimal(3,2) DEFAULT NULL,
  `fraisExpedition` decimal(5,2) DEFAULT NULL,
  `modeExpedition` varchar(50) DEFAULT NULL,
  `segmentClient` varchar(50) DEFAULT NULL,
  `marge` varchar(255) DEFAULT NULL,
  `quantiteVentes` int(4) DEFAULT NULL,
  `montantVentes` decimal(7,2) DEFAULT NULL,
  `client` int(11) NOT NULL DEFAULT '0',
  `region` varchar(30) NOT NULL,
  `produit` varchar(20) NOT NULL DEFAULT '0',
  `dateCommande` date DEFAULT NULL,
  `dateExpedition` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ods_manager`
--

CREATE TABLE IF NOT EXISTS `ods_manager` (
  `manager` varchar(50) NOT NULL DEFAULT '',
  `region` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ods_produits`
--

CREATE TABLE IF NOT EXISTS `ods_produits` (
  `idProduit` varchar(20) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `categorieProduit` varchar(60) DEFAULT NULL,
  `sousCategorieProduit` varchar(60) DEFAULT NULL,
  `typeEmballage` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ods_temps`
--

CREATE TABLE IF NOT EXISTS `ods_temps` (  
  `date` date NOT NULL DEFAULT '0000-00-00',
  `annee` int(11) NOT NULL DEFAULT '0',
  `mois` int(11) NOT NULL DEFAULT '0',
  `jour` int(11) NOT NULL DEFAULT '0',
  `heure` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_src_clients`
--

CREATE TABLE IF NOT EXISTS `rej_src_clients` (
  `NoClient` varchar(255) DEFAULT NULL,
  `NomComplet` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `CodePostal` varchar(255) DEFAULT NULL,
  `liberror` varchar(25) DEFAULT NULL,
  `error` varchar(100) DEFAULT NULL,
  `dateerror` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_src_commandes`
--

CREATE TABLE IF NOT EXISTS `rej_src_commandes` (
  `NoCommande` varchar(255) DEFAULT NULL,
  `PrioriteCommande` varchar(255) DEFAULT NULL,
  `NoClient` varchar(255) DEFAULT NULL,
  `Produit` varchar(255) DEFAULT NULL,
  `Prix_Unitaire` varchar(255) DEFAULT NULL,
  `Marge_Produit_Brut` varchar(255) DEFAULT NULL,
  `Discount` varchar(255) DEFAULT NULL,
  `FraisExpedition` varchar(255) DEFAULT NULL,
  `ModeExpedition` varchar(255) DEFAULT NULL,
  `SegmentClient` varchar(255) DEFAULT NULL,
  `DateCommande` varchar(255) DEFAULT NULL,
  `DateExpedition` varchar(255) DEFAULT NULL,
  `Marge` varchar(255) DEFAULT NULL,
  `QuantiteVentes` varchar(255) DEFAULT NULL,
  `MontantVentes` varchar(255) DEFAULT NULL,
  `liberror` varchar(25) DEFAULT NULL,
  `error` varchar(100) DEFAULT NULL,
  `dateerror` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_src_produits`
--

CREATE TABLE IF NOT EXISTS `rej_src_produits` (
  `IdProduit` varchar(255) DEFAULT NULL,
  `Produit` varchar(255) DEFAULT NULL,
  `CategorieProduit` varchar(255) DEFAULT NULL,
  `SousCategorieProduit` varchar(255) DEFAULT NULL,
  `TypeEmballage` varchar(255) DEFAULT NULL,
  `liberror` varchar(25) DEFAULT NULL,
  `error` varchar(100) DEFAULT NULL,
  `dateerror` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_src_territoires`
--

CREATE TABLE IF NOT EXISTS `rej_src_territoires` (
  `Region` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL,
  `liberror` varchar(25) DEFAULT NULL,
  `error` varchar(100) DEFAULT NULL,
  `dateerror` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Structure de la table `rej_ods_commandes`
--

CREATE TABLE IF NOT EXISTS `rej_ods_commandes` (
  `noCommande` int(11) NOT NULL,
  `prioriteCommande` varchar(25) DEFAULT NULL,
  `prixUnitaire` decimal(10,2) DEFAULT NULL,
  `margeProduitBrute` decimal(3,2) DEFAULT NULL,
  `discount` decimal(3,2) DEFAULT NULL,
  `fraisExpedition` decimal(5,2) DEFAULT NULL,
  `modeExpedition` varchar(50) DEFAULT NULL,
  `segmentClient` varchar(50) DEFAULT NULL,
  `marge` varchar(255) DEFAULT NULL,
  `quantiteVentes` int(4) DEFAULT NULL,
  `montantVentes` decimal(7,2) DEFAULT NULL,
  `client` int(11) NOT NULL DEFAULT '0',
  `region` varchar(30) NOT NULL,
  `produit` varchar(20) NOT NULL DEFAULT '0',
  `dateCommande` date DEFAULT NULL,
  `dateExpedition` date DEFAULT NULL,
  `liberror` varchar(25) DEFAULT '',
  `error` varchar(100) DEFAULT '',
  `dateerror` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `src_clients`
--

CREATE TABLE IF NOT EXISTS `src_clients` (
  `NoClient` int(10) NOT NULL DEFAULT '0',
  `NomComplet` varchar(60) DEFAULT NULL,
  `Region` varchar(30) DEFAULT NULL,
  `Etat` varchar(30) DEFAULT NULL,
  `Ville` varchar(40) DEFAULT NULL,
  `CodePostal` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `src_commandes`
--

CREATE TABLE IF NOT EXISTS `src_commandes` (
  `NoCommande` int(11) NOT NULL DEFAULT '0',
  `PrioriteCommande` varchar(25) DEFAULT NULL,
  `NoClient` int(10) NOT NULL DEFAULT '0',
  `Produit` varchar(20) NOT NULL DEFAULT '',
  `Prix_Unitaire` decimal(10,2) DEFAULT NULL,
  `Marge_Produit_Brut` decimal(3,2) DEFAULT NULL,
  `Discount` decimal(3,2) DEFAULT NULL,
  `FraisExpedition` decimal(5,2) DEFAULT NULL,
  `ModeExpedition` varchar(50) DEFAULT NULL,
  `SegmentClient` varchar(50) DEFAULT NULL,
  `DateCommande` date DEFAULT NULL,
  `DateExpedition` date DEFAULT NULL,
  `Marge` varchar(255) DEFAULT NULL,
  `QuantiteVentes` int(4) DEFAULT NULL,
  `MontantVentes` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `src_produits`
--

CREATE TABLE IF NOT EXISTS `src_produits` (
  `IdProduit` varchar(20) NOT NULL DEFAULT '',
  `Produit` varchar(20) DEFAULT NULL,
  `CategorieProduit` varchar(60) DEFAULT NULL,
  `SousCategorieProduit` varchar(60) DEFAULT NULL,
  `TypeEmballage` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `src_territoires`
--

CREATE TABLE IF NOT EXISTS `src_territoires` (
  `Region` varchar(50) NOT NULL DEFAULT '',
  `Manager` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `dim_clients`
--
ALTER TABLE `dim_clients`
 ADD PRIMARY KEY (`pk_client`);

--
-- Index pour la table `dim_managers`
--
ALTER TABLE `dim_managers`
 ADD PRIMARY KEY (`pk_manager`);

--
-- Index pour la table `dim_produits`
--
ALTER TABLE `dim_produits`
 ADD PRIMARY KEY (`pk_produit`);

--
-- Index pour la table `dim_temps`
--
ALTER TABLE `dim_temps`
 ADD PRIMARY KEY (`pk_date`);

--
-- Index pour la table `fait_commandes`
--
ALTER TABLE `fait_commandes`
 ADD PRIMARY KEY (`pk_commande`,`fk_client`,`fk_idproduit`,`fk_region`,`fk_datecommande`,`fk_dateexpedition`),
 ADD KEY `fait_commande_dim_clients` (`fk_idproduit`),
 ADD KEY `fait_commande_dim_produits` (`fk_client`), 
 ADD KEY `fait_commande_dim_managers` (`fk_region`), 
 ADD KEY `fait_commande_dim_tempscommande` (`fk_datecommande`), 
 ADD KEY `fait_commande_dim_tempsexpedition` (`fk_dateexpedition`);

ALTER TABLE `fait_commandes` CHANGE pk_commande pk_commande INT(11) AUTO_INCREMENT;
ALTER TABLE `dim_clients` CHANGE pk_client pk_client INT(11) AUTO_INCREMENT;
ALTER TABLE `dim_managers` CHANGE pk_manager pk_manager INT(11) AUTO_INCREMENT;
ALTER TABLE `dim_produits` CHANGE pk_produit pk_produit INT(11) AUTO_INCREMENT;

--
-- Index pour la table `ods_clients`
--
ALTER TABLE `ods_clients`
 ADD PRIMARY KEY (`noClient`);

--
-- Index pour la table `ods_commandes`
--
ALTER TABLE `ods_commandes`
 ADD PRIMARY KEY (`noCommande`,`client`,`region`,`produit`),
 ADD KEY `ods_commandes_ods_clients_noClient_fk` (`client`),
 ADD KEY `ods_commandes_ods_produits_idProduit_fk` (`produit`),
 ADD KEY `ods_commandes_ods_temps_idDate_fk` (`dateCommande`), 
 ADD KEY `ods_commandes_ods_temps_idDate2_fk` (`dateExpedition`),
 ADD KEY `ods_commandes_ods_manager_region_fk` (`region`);

--
-- Index pour la table `ods_manager`
--
ALTER TABLE `ods_manager`
 ADD PRIMARY KEY (`region`);

--
-- Index pour la table `ods_produits`
--
ALTER TABLE `ods_produits`
 ADD PRIMARY KEY (`idProduit`);

--
-- Index pour la table `ods_temps`
--
ALTER TABLE `ods_temps`
 ADD PRIMARY KEY (`date`);

--
-- Index pour la table `src_clients`
--
ALTER TABLE `src_clients`
 ADD PRIMARY KEY (`NoClient`);

--
-- Index pour la table `src_commandes`
--
ALTER TABLE `src_commandes`
 ADD PRIMARY KEY (`NoCommande`,`NoClient`,`Produit`);

--
-- Index pour la table `src_produits`
--
ALTER TABLE `src_produits`
 ADD PRIMARY KEY (`IdProduit`);

--
-- Index pour la table `src_territoires`
--
ALTER TABLE `src_territoires`
 ADD PRIMARY KEY (`Region`,`Manager`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `fait_commandes`
--
ALTER TABLE `fait_commandes`
ADD CONSTRAINT `fait_commande_dim_clients` FOREIGN KEY (`fk_idproduit`) REFERENCES `dim_produits` (`pk_produit`),
ADD CONSTRAINT `fait_commande_dim_managers` FOREIGN KEY (`fk_region`) REFERENCES `dim_managers` (`pk_manager`),
ADD CONSTRAINT `fait_commande_dim_produits` FOREIGN KEY (`fk_client`) REFERENCES `dim_clients` (`pk_client`),
ADD CONSTRAINT `fait_commande_dim_tempsCommande` FOREIGN KEY (`fk_datecommande`) REFERENCES `dim_temps` (`pk_date`),
ADD CONSTRAINT `fait_commande_dim_tempsExpedition` FOREIGN KEY (`fk_dateexpedition`) REFERENCES `dim_temps` (`pk_date`);

--
-- Contraintes pour la table `ods_commandes`
--
ALTER TABLE `ods_commandes`
ADD CONSTRAINT `ods_commandes_ods_clients_noClient_fk` FOREIGN KEY (`client`) REFERENCES `ods_clients` (`noClient`),
ADD CONSTRAINT `ods_commandes_ods_manager_region_fk` FOREIGN KEY (`region`) REFERENCES `ods_manager` (`region`),
ADD CONSTRAINT `ods_commandes_ods_produits_idProduit_fk` FOREIGN KEY (`produit`) REFERENCES `ods_produits` (`idProduit`),
ADD CONSTRAINT `ods_commandes_ods_temps_idDate2_fk` FOREIGN KEY (`dateExpedition`) REFERENCES `ods_temps` (`date`),
ADD CONSTRAINT `ods_commandes_ods_temps_idDate_fk` FOREIGN KEY (`dateCommande`) REFERENCES `ods_temps` (`date`);

