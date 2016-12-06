-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 06 Décembre 2016 à 10:53
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
CREATE DATABASE IF NOT EXISTS `bi_ods_officeshop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bi_ods_officeshop`;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
