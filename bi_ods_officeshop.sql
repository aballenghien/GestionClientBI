-- MySQL dump 10.15  Distrib 10.0.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: bi_ods_officeshop
-- ------------------------------------------------------
-- Server version	10.0.27-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dim_temps`
--

DROP TABLE IF EXISTS `dim_temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_temps` (
  `pk_date` date NOT NULL DEFAULT '0000-00-00',
  `annee` int(11) NOT NULL DEFAULT '0',
  `mois` int(11) NOT NULL DEFAULT '0',
  `jour` int(11) NOT NULL DEFAULT '0',
  `heure` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_temps`
--

LOCK TABLES `dim_temps` WRITE;
/*!40000 ALTER TABLE `dim_temps` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_temps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fait_commandes`
--

DROP TABLE IF EXISTS `fait_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fait_commandes` (
  `pk_commande` int(11) NOT NULL AUTO_INCREMENT,
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
  `mt_ventes` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`pk_commande`,`fk_client`,`fk_idproduit`,`fk_region`,`fk_datecommande`,`fk_dateexpedition`),
  KEY `fait_commande_dim_clients` (`fk_idproduit`),
  KEY `fait_commande_dim_produits` (`fk_client`),
  KEY `fait_commande_dim_managers` (`fk_region`),
  KEY `fait_commande_dim_tempscommande` (`fk_datecommande`),
  KEY `fait_commande_dim_tempsexpedition` (`fk_dateexpedition`),
  CONSTRAINT `fait_commande_dim_clients` FOREIGN KEY (`fk_idproduit`) REFERENCES `dim_produits` (`pk_produit`),
  CONSTRAINT `fait_commande_dim_managers` FOREIGN KEY (`fk_region`) REFERENCES `dim_managers` (`pk_manager`),
  CONSTRAINT `fait_commande_dim_produits` FOREIGN KEY (`fk_client`) REFERENCES `dim_clients` (`pk_client`),
  CONSTRAINT `fait_commande_dim_tempsCommande` FOREIGN KEY (`fk_datecommande`) REFERENCES `dim_temps` (`pk_date`),
  CONSTRAINT `fait_commande_dim_tempsExpedition` FOREIGN KEY (`fk_dateexpedition`) REFERENCES `dim_temps` (`pk_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fait_commandes`
--

LOCK TABLES `fait_commandes` WRITE;
/*!40000 ALTER TABLE `fait_commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fait_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rej_ods_commandes`
--

DROP TABLE IF EXISTS `rej_ods_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rej_ods_commandes` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rej_ods_commandes`
--

LOCK TABLES `rej_ods_commandes` WRITE;
/*!40000 ALTER TABLE `rej_ods_commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rej_ods_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_managers`
--

DROP TABLE IF EXISTS `dim_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_managers` (
  `pk_manager` int(11) NOT NULL AUTO_INCREMENT,
  `dt_debval` date NOT NULL DEFAULT '0000-00-00',
  `dt_finval` date NOT NULL DEFAULT '0000-00-00',
  `lib_nommanager` varchar(50) NOT NULL DEFAULT '',
  `lib_region` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_managers`
--

LOCK TABLES `dim_managers` WRITE;
/*!40000 ALTER TABLE `dim_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rej_src_territoires`
--

DROP TABLE IF EXISTS `rej_src_territoires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rej_src_territoires` (
  `Region` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL,
  `liberror` varchar(25) DEFAULT NULL,
  `error` varchar(100) DEFAULT NULL,
  `dateerror` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rej_src_territoires`
--

LOCK TABLES `rej_src_territoires` WRITE;
/*!40000 ALTER TABLE `rej_src_territoires` DISABLE KEYS */;
/*!40000 ALTER TABLE `rej_src_territoires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `src_produits`
--

DROP TABLE IF EXISTS `src_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `src_produits` (
  `IdProduit` varchar(20) NOT NULL DEFAULT '',
  `Produit` varchar(20) DEFAULT NULL,
  `CategorieProduit` varchar(60) DEFAULT NULL,
  `SousCategorieProduit` varchar(60) DEFAULT NULL,
  `TypeEmballage` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`IdProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `src_produits`
--

LOCK TABLES `src_produits` WRITE;
/*!40000 ALTER TABLE `src_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `src_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fic_commandes`
--

DROP TABLE IF EXISTS `fic_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fic_commandes` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fic_commandes`
--

LOCK TABLES `fic_commandes` WRITE;
/*!40000 ALTER TABLE `fic_commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fic_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_clients`
--

DROP TABLE IF EXISTS `dim_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_clients` (
  `pk_client` int(11) NOT NULL AUTO_INCREMENT,
  `no_Client` int(11) NOT NULL,
  `dt_finval` date NOT NULL DEFAULT '0000-00-00',
  `dt_debval` date NOT NULL DEFAULT '0000-00-00',
  `lib_nom` varchar(30) DEFAULT NULL,
  `lib_prenom` varchar(30) DEFAULT NULL,
  `lib_etat` varchar(30) NOT NULL DEFAULT '',
  `lib_ville` varchar(40) NOT NULL DEFAULT '',
  `lib_codePostal` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_clients`
--

LOCK TABLES `dim_clients` WRITE;
/*!40000 ALTER TABLE `dim_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ods_temps`
--

DROP TABLE IF EXISTS `ods_temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ods_temps` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `annee` int(11) NOT NULL DEFAULT '0',
  `mois` int(11) NOT NULL DEFAULT '0',
  `jour` int(11) NOT NULL DEFAULT '0',
  `heure` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ods_temps`
--

LOCK TABLES `ods_temps` WRITE;
/*!40000 ALTER TABLE `ods_temps` DISABLE KEYS */;
/*!40000 ALTER TABLE `ods_temps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fic_territoires`
--

DROP TABLE IF EXISTS `fic_territoires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fic_territoires` (
  `Region` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fic_territoires`
--

LOCK TABLES `fic_territoires` WRITE;
/*!40000 ALTER TABLE `fic_territoires` DISABLE KEYS */;
/*!40000 ALTER TABLE `fic_territoires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `src_territoires`
--

DROP TABLE IF EXISTS `src_territoires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `src_territoires` (
  `Region` varchar(50) NOT NULL DEFAULT '',
  `Manager` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`Region`,`Manager`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `src_territoires`
--

LOCK TABLES `src_territoires` WRITE;
/*!40000 ALTER TABLE `src_territoires` DISABLE KEYS */;
/*!40000 ALTER TABLE `src_territoires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_produits`
--

DROP TABLE IF EXISTS `dim_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_produits` (
  `pk_produit` int(11) NOT NULL AUTO_INCREMENT,
  `no_produit` varchar(20) NOT NULL,
  `dt_debval` date DEFAULT '0000-00-00',
  `dt_finval` date DEFAULT '0000-00-00',
  `lib_nom` varchar(20) DEFAULT NULL,
  `lib_categorieproduit` varchar(60) DEFAULT NULL,
  `lib_souscategorieproduit` varchar(60) DEFAULT NULL,
  `lib_typeemballage` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pk_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_produits`
--

LOCK TABLES `dim_produits` WRITE;
/*!40000 ALTER TABLE `dim_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rej_src_produits`
--

DROP TABLE IF EXISTS `rej_src_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rej_src_produits` (
  `IdProduit` varchar(255) DEFAULT NULL,
  `Produit` varchar(255) DEFAULT NULL,
  `CategorieProduit` varchar(255) DEFAULT NULL,
  `SousCategorieProduit` varchar(255) DEFAULT NULL,
  `TypeEmballage` varchar(255) DEFAULT NULL,
  `liberror` varchar(25) DEFAULT NULL,
  `error` varchar(100) DEFAULT NULL,
  `dateerror` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rej_src_produits`
--

LOCK TABLES `rej_src_produits` WRITE;
/*!40000 ALTER TABLE `rej_src_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `rej_src_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rej_src_clients`
--

DROP TABLE IF EXISTS `rej_src_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rej_src_clients` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rej_src_clients`
--

LOCK TABLES `rej_src_clients` WRITE;
/*!40000 ALTER TABLE `rej_src_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `rej_src_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `src_clients`
--

DROP TABLE IF EXISTS `src_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `src_clients` (
  `NoClient` int(10) NOT NULL DEFAULT '0',
  `NomComplet` varchar(60) DEFAULT NULL,
  `Region` varchar(30) DEFAULT NULL,
  `Etat` varchar(30) DEFAULT NULL,
  `Ville` varchar(40) DEFAULT NULL,
  `CodePostal` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`NoClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `src_clients`
--

LOCK TABLES `src_clients` WRITE;
/*!40000 ALTER TABLE `src_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `src_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ods_produits`
--

DROP TABLE IF EXISTS `ods_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ods_produits` (
  `idProduit` varchar(20) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `categorieProduit` varchar(60) DEFAULT NULL,
  `sousCategorieProduit` varchar(60) DEFAULT NULL,
  `typeEmballage` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ods_produits`
--

LOCK TABLES `ods_produits` WRITE;
/*!40000 ALTER TABLE `ods_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `ods_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ods_manager`
--

DROP TABLE IF EXISTS `ods_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ods_manager` (
  `manager` varchar(50) NOT NULL DEFAULT '',
  `region` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ods_manager`
--

LOCK TABLES `ods_manager` WRITE;
/*!40000 ALTER TABLE `ods_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `ods_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ods_clients`
--

DROP TABLE IF EXISTS `ods_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ods_clients` (
  `noClient` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `etat` varchar(30) NOT NULL DEFAULT '',
  `ville` varchar(40) NOT NULL DEFAULT '',
  `codePostal` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`noClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ods_clients`
--

LOCK TABLES `ods_clients` WRITE;
/*!40000 ALTER TABLE `ods_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ods_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ods_commandes`
--

DROP TABLE IF EXISTS `ods_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ods_commandes` (
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
  `region` int(11) NOT NULL DEFAULT '0',
  `produit` int(11) NOT NULL DEFAULT '0',
  `dateCommande` date DEFAULT NULL,
  `dateExpedition` date DEFAULT NULL,
  PRIMARY KEY (`noCommande`,`client`,`region`,`produit`),
  KEY `ods_commandes_ods_clients_noClient_fk` (`client`),
  KEY `ods_commandes_ods_produits_idProduit_fk` (`produit`),
  KEY `ods_commandes_ods_temps_idDate_fk` (`dateCommande`),
  KEY `ods_commandes_ods_temps_idDate2_fk` (`dateExpedition`),
  KEY `ods_commandes_ods_manager_region_fk` (`region`),
  CONSTRAINT `ods_commandes_ods_clients_noClient_fk` FOREIGN KEY (`client`) REFERENCES `dim_client` (`pk_client`),
  CONSTRAINT `ods_commandes_ods_manager_region_fk` FOREIGN KEY (`region`) REFERENCES `dim_managers` (`pk_manager`),
  CONSTRAINT `ods_commandes_ods_produits_idProduit_fk` FOREIGN KEY (`produit`) REFERENCES `dim_produit` (`pk_produit`),
  CONSTRAINT `ods_commandes_ods_temps_idDate2_fk` FOREIGN KEY (`dateExpedition`) REFERENCES `dim_temps` (`pk_date`),
  CONSTRAINT `ods_commandes_ods_temps_idDate_fk` FOREIGN KEY (`dateCommande`) REFERENCES `dim_temps` (`pk_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ods_commandes`
--

LOCK TABLES `ods_commandes` WRITE;
/*!40000 ALTER TABLE `ods_commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ods_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fic_produits`
--

DROP TABLE IF EXISTS `fic_produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fic_produits` (
  `IdProduit` varchar(255) DEFAULT NULL,
  `Produit` varchar(255) DEFAULT NULL,
  `CategorieProduit` varchar(255) DEFAULT NULL,
  `SousCategorieProduit` varchar(255) DEFAULT NULL,
  `TypeEmballage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fic_produits`
--

LOCK TABLES `fic_produits` WRITE;
/*!40000 ALTER TABLE `fic_produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `fic_produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `src_commandes`
--

DROP TABLE IF EXISTS `src_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `src_commandes` (
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
  `MontantVentes` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`NoCommande`,`NoClient`,`Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `src_commandes`
--

LOCK TABLES `src_commandes` WRITE;
/*!40000 ALTER TABLE `src_commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `src_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fic_clients`
--

DROP TABLE IF EXISTS `fic_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fic_clients` (
  `NoClient` varchar(255) DEFAULT NULL,
  `NomComplet` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `CodePostal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fic_clients`
--

LOCK TABLES `fic_clients` WRITE;
/*!40000 ALTER TABLE `fic_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `fic_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rej_src_commandes`
--

DROP TABLE IF EXISTS `rej_src_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rej_src_commandes` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rej_src_commandes`
--

LOCK TABLES `rej_src_commandes` WRITE;
/*!40000 ALTER TABLE `rej_src_commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rej_src_commandes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-04  9:35:09
