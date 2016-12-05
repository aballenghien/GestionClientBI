
--
-- Base de données :  `bi_ods_officeshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `src_clients`
--

CREATE TABLE IF NOT EXISTS `src_clients` (
  `NoClient` int(10),
  `NomComplet` varchar(60),
  `Region` varchar(30) DEFAULT NULL,
  `Etat` varchar(30) DEFAULT NULL,
  `Ville` varchar(40) DEFAULT NULL,
  `CodePostal` varchar(5) DEFAULT NULL,
  CONSTRAINT PK_CLIENTS PRIMARY KEY(`NoClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `src_commandes`
--

CREATE TABLE IF NOT EXISTS `src_commandes` (
  `NoCommande` int,
  `PrioriteCommande` varchar(25) DEFAULT NULL ,
  `NoClient` int(10) ,
  `Produit` varchar(20),
  `Prix_Unitaire` decimal(10,2),
  `Marge_Produit_Brut` decimal(3,2) DEFAULT NULL,
  `Discount` decimal(3,2) DEFAULT NULL,
  `FraisExpedition` decimal(5,2),
  `ModeExpedition` varchar(50) DEFAULT NULL,
  `SegmentClient` varchar(50) DEFAULT NULL,
  `DateCommande` date,
  `DateExpedition` date,
  `Marge` varchar(255) DEFAULT NULL,
  `QuantiteVentes` int(4),
  `MontantVentes` decimal(7,2),
  CONSTRAINT PK_COMMANDES PRIMARY KEY(`NoCommande`,`NoClient`,`Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `src_produits`
--

CREATE TABLE IF NOT EXISTS `src_produits` (
  `IdProduit` varchar(20),
  `Produit` varchar(20),
  `CategorieProduit` varchar(60),
  `SousCategorieProduit` varchar(60) DEFAULT NULL,
  `TypeEmballage` varchar(40) DEFAULT NULL,
  CONSTRAINT PK_PRODUITS PRIMARY KEY(`IdProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `src_territoires`
--

CREATE TABLE IF NOT EXISTS `src_territoires` (
  `Region` varchar(50) ,
  `Manager` varchar(50),
  CONSTRAINT PK_TERRITOIRES PRIMARY KEY(`Region`,`Manager`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ------------------------------------------------------------

--
-- Structure de la table `rej_clients`
--

CREATE TABLE IF NOT EXISTS `rej_clients` (
  `NoClient` varchar(255) DEFAULT NULL,
  `NomComplet` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `CodePostal` varchar(255) DEFAULT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorMessage` varchar(255) DEFAULT NULL
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
  `MontantVentes` varchar(255) DEFAULT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorMessage` varchar(255) DEFAULT NULL
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
  `TypeEmballage` varchar(255) DEFAULT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorMessage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rej_territoires`
--

CREATE TABLE IF NOT EXISTS `rej_territoires` (
  `Region` varchar(255) DEFAULT NULL,
  `Manager` varchar(255) DEFAULT NULL,
  `errorCode` varchar(255) DEFAULT NULL,
  `errorMessage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
