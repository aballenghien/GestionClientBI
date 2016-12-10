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


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bi_ods_officeshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `dim_clients`
--

CREATE TABLE IF NOT EXISTS `dim_clients` (
  `PK_noClient` int(11) NOT NULL,
  `PK_dtCreate` date NOT NULL DEFAULT '0000-00-00',
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `etat` varchar(30) NOT NULL DEFAULT '',
  `ville` varchar(40) NOT NULL DEFAULT '',
  `codePostal` varchar(5) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_manager`
--

CREATE TABLE IF NOT EXISTS `dim_manager` (
  `manager` varchar(50) NOT NULL DEFAULT '',
  `PK_region` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_produits`
--

CREATE TABLE IF NOT EXISTS `dim_produits` (
  `PK_idProduit` varchar(20) NOT NULL,
  `LIB_nom` varchar(20) DEFAULT NULL,
  `LIB_categorieProduit` varchar(60) DEFAULT NULL,
  `LIB_sousCategorieProduit` varchar(60) DEFAULT NULL,
  `LIB_typeEmballage` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_temps`
--

CREATE TABLE IF NOT EXISTS `dim_temps` (
  `annee` int(11) NOT NULL DEFAULT '0',
  `mois` int(11) NOT NULL DEFAULT '0',
  `jour` int(11) NOT NULL DEFAULT '0',
  `heure` int(11) NOT NULL DEFAULT '0',
  `PK_idDate` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fait_commandes`
--

CREATE TABLE IF NOT EXISTS `fait_commandes` (
  `PK_noCommande` int(11) NOT NULL,
  `FK_noClient` int(11) NOT NULL DEFAULT '0',
  `FK_idProduit` varchar(20) NOT NULL DEFAULT '0',
  `FK_region` varchar(30) NOT NULL,
  `FK_dateCommande` date NOT NULL DEFAULT '0000-00-00',
  `FK_dateExpedition` date NOT NULL DEFAULT '0000-00-00',
  `prioriteCommande` varchar(25) DEFAULT NULL,
  `MT_prixUnitaire` decimal(10,2) DEFAULT NULL,
  `MT_margeProduitBrute` decimal(3,2) DEFAULT NULL,
  `discount` decimal(3,2) DEFAULT NULL,
  `MT_fraisExpedition` decimal(5,2) DEFAULT NULL,
  `LIB_modeExpedition` varchar(50) DEFAULT NULL,
  `LIB_segmentClient` varchar(50) DEFAULT NULL,
  `marge` varchar(255) DEFAULT NULL,
  `QT_quantiteVentes` int(4) DEFAULT NULL,
  `MT_montantVentes` decimal(7,2) DEFAULT NULL
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
  `noClient` int(11) NOT NULL DEFAULT '0',
  `region` varchar(30) NOT NULL,
  `idProduit` varchar(20) NOT NULL DEFAULT '0',
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
  `annee` int(11) NOT NULL DEFAULT '0',
  `mois` int(11) NOT NULL DEFAULT '0',
  `jour` int(11) NOT NULL DEFAULT '0',
  `heure` int(11) NOT NULL DEFAULT '0',
  `idDate` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_clients`
--

CREATE TABLE IF NOT EXISTS `rej_clients` (
  `NoClient` varchar(255) DEFAULT NULL,
  `NomComplet` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `CodePostal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_commandes`
--

CREATE TABLE IF NOT EXISTS `rej_commandes` (
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
-- Structure de la table `rej_produits`
--

CREATE TABLE IF NOT EXISTS `rej_produits` (
  `IdProduit` varchar(255) DEFAULT NULL,
  `Produit` varchar(255) DEFAULT NULL,
  `CategorieProduit` varchar(255) DEFAULT NULL,
  `SousCategorieProduit` varchar(255) DEFAULT NULL,
  `TypeEmballage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_territoires`
--

CREATE TABLE IF NOT EXISTS `rej_territoires` (
  `Region` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL
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
 ADD PRIMARY KEY (`PK_noClient`,`PK_dtCreate`);

--
-- Index pour la table `dim_manager`
--
ALTER TABLE `dim_manager`
 ADD PRIMARY KEY (`PK_region`);

--
-- Index pour la table `dim_produits`
--
ALTER TABLE `dim_produits`
 ADD PRIMARY KEY (`PK_idProduit`);

--
-- Index pour la table `dim_temps`
--
ALTER TABLE `dim_temps`
 ADD PRIMARY KEY (`PK_idDate`);

--
-- Index pour la table `fait_commandes`
--
ALTER TABLE `fait_commandes`
 ADD PRIMARY KEY (`PK_noCommande`,`FK_noClient`,`FK_idProduit`,`FK_region`,`FK_dateCommande`,`FK_dateExpedition`), ADD KEY `fait_commande_dim_clients` (`FK_idProduit`), ADD KEY `fait_commande_dim_produits` (`FK_noClient`), ADD KEY `fait_commande_dim_manager` (`FK_region`), ADD KEY `fait_commande_dim_tempsCommande` (`FK_dateCommande`), ADD KEY `fait_commande_dim_tempsExpedition` (`FK_dateExpedition`);

--
-- Index pour la table `ods_clients`
--
ALTER TABLE `ods_clients`
 ADD PRIMARY KEY (`noClient`);

--
-- Index pour la table `ods_commandes`
--
ALTER TABLE `ods_commandes`
 ADD PRIMARY KEY (`noCommande`,`noClient`,`region`,`idProduit`), ADD KEY `ods_commandes_ods_clients_noClient_fk` (`noClient`), ADD KEY `ods_commandes_ods_produits_idProduit_fk` (`idProduit`), ADD KEY `ods_commandes_ods_temps_idDate_fk` (`dateCommande`), ADD KEY `ods_commandes_ods_temps_idDate2_fk` (`dateExpedition`), ADD KEY `ods_commandes_ods_manager_region_fk` (`region`);

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
 ADD PRIMARY KEY (`idDate`);

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
ADD CONSTRAINT `fait_commande_dim_clients` FOREIGN KEY (`FK_idProduit`) REFERENCES `dim_produits` (`PK_idProduit`),
ADD CONSTRAINT `fait_commande_dim_manager` FOREIGN KEY (`FK_region`) REFERENCES `dim_manager` (`PK_region`),
ADD CONSTRAINT `fait_commande_dim_produits` FOREIGN KEY (`FK_noClient`) REFERENCES `dim_clients` (`PK_noClient`),
ADD CONSTRAINT `fait_commande_dim_tempsCommande` FOREIGN KEY (`FK_dateCommande`) REFERENCES `dim_temps` (`PK_idDate`),
ADD CONSTRAINT `fait_commande_dim_tempsExpedition` FOREIGN KEY (`FK_dateExpedition`) REFERENCES `dim_temps` (`PK_idDate`);

--
-- Contraintes pour la table `ods_commandes`
--
ALTER TABLE `ods_commandes`
ADD CONSTRAINT `ods_commandes_ods_clients_noClient_fk` FOREIGN KEY (`noClient`) REFERENCES `ods_clients` (`noClient`),
ADD CONSTRAINT `ods_commandes_ods_manager_region_fk` FOREIGN KEY (`region`) REFERENCES `ods_manager` (`region`),
ADD CONSTRAINT `ods_commandes_ods_produits_idProduit_fk` FOREIGN KEY (`idProduit`) REFERENCES `ods_produits` (`idProduit`),
ADD CONSTRAINT `ods_commandes_ods_temps_idDate2_fk` FOREIGN KEY (`dateExpedition`) REFERENCES `ods_temps` (`idDate`),
ADD CONSTRAINT `ods_commandes_ods_temps_idDate_fk` FOREIGN KEY (`dateCommande`) REFERENCES `ods_temps` (`idDate`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
