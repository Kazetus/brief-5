-- On efface la BDD au cas ou.

DROP DATABASE IF EXISTS euro_fit_matthias;

-- On crée la base de donnée

CREATE DATABASE euro_fit_matthias;

-- On sélectionne la BDD pour les opérations à suivre.

use euro_fit_matthias;
-- On commence par les tables sans clés étrangères.
-- On efface les tables avant création au cas ou.

DROP TABLE IF EXISTS societe;

-- Création de la table societe pour éviter les redondances

CREATE TABLE societe(
  `id_societe` INT NOT NULL AUTO_INCREMENT,
  `societe` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id_societe`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS fonctions;

-- Création de la table fonctions, pour éviter les redondances

CREATE TABLE fonctions(
  `id_fonctions` INT NOT NULL AUTO_INCREMENT,
  `fonctions` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_fonctions`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS categorie;

-- Création de la table categorie, pour éviter les redondances

CREATE TABLE categorie(
  `id_categorie` INT NOT NULL AUTO_INCREMENT,
  `categorie` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_categorie`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS ville;

-- Création de la table ville, pour éviter les redondances

CREATE TABLE ville(
  `id_ville` INT NOT NULL AUTO_INCREMENT,
  `ville` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_ville`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS pays;

-- Création de la table pays, pour éviter les redondances

CREATE TABLE pays(
  `id_pays` INT NOT NULL AUTO_INCREMENT,
  `pays` VARCHAR(42) NOT NULL,
  PRIMARY KEY (`id_pays`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS quartier;

-- Création de la table quartier, pour éviter les redondances

CREATE TABLE quartier(
  `id_quartier` INT NOT NULL AUTO_INCREMENT,
  `quartier` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_quartier`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS code_postal;

-- Création de la table code_postal, pour éviter les redondances

CREATE TABLE code_postal(
  `id_code_postal` INT NOT NULL AUTO_INCREMENT,
  `code_postal` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_code_postal`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS abonnement;

-- création de la table abonnement, toutes les informations concernant les avantages des abonnements sont présentes.

CREATE TABLE abonnement(
  `id_abonnement` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(50) NOT NULL,
  `tout_club` BOOL NOT NULL,
  `toutes_salles` BOOL NOT NULL,
  `tout_pays` BOOL NOT NULL,
  `reduc_complement` TINYINT NOT NULL,
  `reduc_medecine` TINYINT NOT NULL,
  `reduc_coach` TINYINT NOT NULL,
  PRIMARY KEY (`id_abonnement`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- On passe aux tables avec clés étrangères en respectant l'ordre.

DROP TABLE IF EXISTS produit;

-- Création de la table produit, contenant les informations sur les produits en vente.

CREATE TABLE produit(
  `id_produit` INT NOT NULL AUTO_INCREMENT,
  `intitule` VARCHAR(40) NOT NULL,
  `fournisseur` VARCHAR(25) NOT NULL,
  `fabriquant` VARCHAR(25) NOT NULL,
  `prix_HT` DECIMAL(5, 2) NOT NULL,
  `id_categorie` INT NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `fk_id_categorie` (`id_categorie`),
  CONSTRAINT `fk_produit_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS adresse;

-- création de la table adresse, on efface en cascade du lieu ou elle se trouve, une adresse null est inutile.

CREATE TABLE adresse(
  `id_adresse` INT NOT NULL AUTO_INCREMENT,
  `adresse` VARCHAR(40) NOT NULL,
  `id_ville` INT NOT NULL,
  `id_pays` INT NOT NULL,
  `id_quartier` INT NOT NULL,
  `id_code_postal` INT NOT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `fk_id_ville` (`id_ville`),
  KEY `fk_id_pays` (`id_pays`),
  KEY `fk_id_quartier` (`id_quartier`),
  KEY `fk_id_code_postal` (`id_code_postal`),
  CONSTRAINT `fk_adresse_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_adresse_pays` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_adresse_quartier` FOREIGN KEY (`id_quartier`) REFERENCES `quartier` (`id_quartier`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_adresse_code_postal` FOREIGN KEY (`id_code_postal`) REFERENCES `code_postal` (`id_code_postal`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS assurance;

-- creation de la table assurance, ne surtout pas effacer en cascade, faut voir chez qui pleurer même après coup !

CREATE TABLE assurance(
	`id_assurance` INT NOT NULL AUTO_INCREMENT,
    `nom_assurance` VARCHAR(30) NOT NULL,
    `id_adresse` INT,
    PRIMARY KEY(`id_assurance`),
	KEY `fk_id_adresse` (`id_adresse`),
	CONSTRAINT `fk_assurance_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE SET null ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS club;

-- création de la table club, contient toutes les informations sur les clubs, on efface surtout pas.

CREATE TABLE club(
  `id_club` INT NOT NULL AUTO_INCREMENT,
  `nom_club` VARCHAR(30) NOT NULL,
  `mail` VARCHAR(40) NOT NULL,
  `tel` VARCHAR(15) NOT NULL,
  `superficie` INT NOT NULL,
  `contrat_assurance` VARCHAR(30) NOT NULL,
  `id_adresse` INT,
  `id_assurance` INT,
  PRIMARY KEY (`id_club`),
  KEY `fk_id_adresse` (`id_adresse`),
  KEY `fk_id_assurance` (`id_assurance`),
  CONSTRAINT `fk_club_assurance` FOREIGN KEY (`id_assurance`) REFERENCES `assurance` (`id_assurance`) ON DELETE SET null ON UPDATE CASCADE,
  CONSTRAINT `fk_club_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE SET null ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS hygiene;

-- Création de la table hygiene, cette table répertorie les salles d'hygiene présentent dans chaque club, on efface en cascade, peu pertinent.

CREATE TABLE hygiene(
  `id_hygiene` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(30) NOT NULL,
  `nombre` TINYINT NOT NULL,
  `id_club` INT NOT NULL,
  PRIMARY KEY (`id_hygiene`),
  KEY `fk_id_club` (`id_club`),
  CONSTRAINT `fk_hygiene_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS salles;

-- création de la table salles, contient les informations relative aux salles présentent dans chaque club, on efface en cascade car aucun intérêt de conserver une salle d'un club inexistant.

CREATE TABLE salles(
  `id_salles` INT NOT NULL AUTO_INCREMENT,
  `nom_salles` VARCHAR(15) NOT NULL,
  `type` VARCHAR(15) NOT NULL,
  `id_club` INT NOT NULL,
  PRIMARY KEY (`id_salles`),
  KEY `fk_id_club` (`id_club`),
  CONSTRAINT `fk_salles_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS equipements;

-- création de la table équipements, conservera les données des machines présentent dans chaque salle, on efface en cascade pour éviter une erreur de stock de machine.

CREATE TABLE equipements(
  `id_equipements` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(30) NOT NULL,
  `nombre` TINYINT NOT NULL,
  `id_salles` INT NOT NULL,
  PRIMARY KEY (`id_equipements`),
  KEY `fk_id_salles` (`id_salles`),
  CONSTRAINT `fk_equipements_salles` FOREIGN KEY (`id_salles`) REFERENCES `salles` (`id_salles`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS capteurs;

-- Création de la table capteur, répertorie les capteurs et leurs derniers relevés avec la date, on efface en cascade, l'information est peu pertinente après coup.

CREATE TABLE capteurs(
  `id_capteurs` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(30) NOT NULL,
  `date` DATETIME NOT NULL,
  `valeur` FLOAT NOT NULL,
  `id_salles` INT NOT NULL,
  PRIMARY KEY (`id_capteurs`),
  KEY `fk_id_salles` (`id_salles`),
  CONSTRAINT `fk_capteurs_salles` FOREIGN KEY (`id_salles`) REFERENCES `salles` (`id_salles`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS activites;

-- Création de la table activités, pour répertorier les activités qui ont lieu dans nos clubs, on garde les données en cas de suppression, il faudrait surtout pas perdre une idée.

CREATE TABLE activites(
  `id_activites` INT NOT NULL AUTO_INCREMENT,
  `nom_activite` VARCHAR(15) NOT NULL,
  `prof` VARCHAR(25) NOT NULL,
  `reservation` DATETIME NOT NULL,
  `id_salles` INT,
  PRIMARY KEY (`id_activites`),
  KEY `fk_id_salles` (`id_salles`),
  CONSTRAINT `fk_activites_salles` FOREIGN KEY (`id_salles`) REFERENCES `salles` (`id_salles`) ON DELETE SET null ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS stock;

-- On garde une vue sur les stocks de marchandises dans chaque club, faudrait pas tomber à court !

CREATE TABLE stock (
    `id_stock` INT NOT NULL AUTO_INCREMENT,
    `quantite` SMALLINT NOT NULL,
    `id_produit` INT NOT NULL,
    `id_club` INT NOT NULL,
    PRIMARY KEY (`id_stock`),
    KEY `fk_id_club` (`id_club`),
    KEY `fk_id_produit` (`id_produit`),
    CONSTRAINT `fk_stock_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_stock_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS medecin;

-- création de la table médecin, pour savoir qui attaquer en cas de soucis.

CREATE TABLE medecin(
	`id_medecin` INT NOT NULL AUTO_INCREMENT,
    `nom_medecin` VARCHAR(20) NOT NULL,
    `prenom_medecin` VARCHAR(20) NOT NULL,
    `mail` VARCHAR(50) NOT NULL,
    `tel` VARCHAR(15) NOT NULL,
    `id_adresse` INT,
    PRIMARY KEY(`id_medecin`),
	KEY `fk_id_adresse` (`id_adresse`),
	CONSTRAINT `fk_medecin_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE SET null ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS membres;

-- Création de la table membres, aucune donnée ne doit être effacé ici !

CREATE TABLE membres(
  `id_membres` INT NOT NULL AUTO_INCREMENT,
  `nom_membres` VARCHAR(20) NOT NULL,
  `prenom_membres` VARCHAR(20) NOT NULL,
  `tel` VARCHAR(15) NOT NULL,
  `mail` VARCHAR(50) NOT NULL,
  `certificat_medical` VARCHAR(40) NOT NULL,
  `card_number` VARCHAR(20) NOT NULL,
  `card_date` VARCHAR(10) NOT NULL,
  `CCV` SMALLINT NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `id_club` INT,
  `id_abonnement` INT,
  `id_medecin` INT,
  `id_adresse` INT,
  PRIMARY KEY (`id_membres`),
  KEY `fk_id_club` (`id_club`),
  KEY `fk_id_abonnement` (`id_abonnement`),
  KEY `fk_id_medecin` (`id_medecin`),
  KEY `fk_id_adresse` (`id_adresse`),
  CONSTRAINT `fk_membres_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`) ON DELETE SET null ON UPDATE CASCADE,
  CONSTRAINT `fk_membres_abonnement` FOREIGN KEY (`id_abonnement`) REFERENCES `abonnement` (`id_abonnement`) ON DELETE SET null ON UPDATE CASCADE,
  CONSTRAINT `fk_membres_medecin` FOREIGN KEY (`id_medecin`) REFERENCES `medecin` (`id_medecin`) ON DELETE SET null ON UPDATE CASCADE,
  CONSTRAINT `fk_membres_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE SET null ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS achats;

-- Création de la table achats, si on efface un produit, il n'est pas nécessaire de garder les ventes de celui-ci mais on garde une trace des ventes du produit si l'utilisateur est effacé(Ce qui ne se produira pas.).

CREATE TABLE achats(
  `id_achats` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `quantite` TINYINT NOT NULL,
  `id_membres` INT,
  `id_produit` INT NOT NULL,
  `id_club` INT NOT NULL,
  PRIMARY KEY (`id_achats`),
  KEY `fk_id_membres` (`id_membres`),
  KEY `fk_id_abonnement` (`id_produit`),
  KEY `fk_id_club` (`id_club`),
  CONSTRAINT `fk_achats_membres` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`) ON DELETE SET null ON UPDATE CASCADE,
  CONSTRAINT `fk_achats_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_achats_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS services;

-- Création de la table services, en cas de doute, sur la cascade, on efface les données, on peut pas nous facturer une prestation qui n'a pas eu lieu !

CREATE TABLE services(
  `id_services` INT NOT NULL AUTO_INCREMENT,
  `heure_arrivee` DATETIME NOT NULL,
  `heure_depart` DATETIME NOT NULL,
  `id_club` INT NOT NULL,
  `id_membres` INT NOT NULL,
  `id_fonctions` INT NOT NULL,
  `id_societe` INT NOT NULL,
  PRIMARY KEY (`id_services`),
  KEY `fk_id_club` (`id_club`),
  KEY `fk_id_membres` (`id_membres`),
  KEY `fk_id_fonctions` (`id_fonctions`),
  KEY `fk_id_societe` (`id_societe`),
  CONSTRAINT `fk_services_club` FOREIGN KEY (`id_club`) REFERENCES `club` (`id_club`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_services_membres` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_services_fonctions` FOREIGN KEY (`id_fonctions`) REFERENCES `fonctions` (`id_fonctions`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_services_societe` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id_societe`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS donnees_corporelles;

-- création de la table données_corporelles, concernant la cascade, dans le doute ce sont des informations personnelles, on les garde.

CREATE TABLE donnees_corporelles(
  `id_donnes` INT NOT NULL AUTO_INCREMENT,
  `IMC` TINYINT NOT NULL,
  `metabolisme` INT NOT NULL,
  `besoins` INT NOT NULL,
  `masse_seche` INT NOT NULL,
  `contenu_mineral` INT NOT NULL,
  `eau_totale` INT NOT NULL,
  `masse_grasse` INT NOT NULL,
  `masse_musculaire` INT NOT NULL,
  `masse_hydrique` INT NOT NULL,
  `id_membres` INT,
  PRIMARY KEY (`id_donnes`),
  KEY `fk_id_membres` (`id_membres`),
  CONSTRAINT `fk_donnees_corporelles_membres` FOREIGN KEY (`id_membres`) REFERENCES `membres` (`id_membres`) ON DELETE SET null ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS coaching;

-- Création de la table coaching, il est essentiel d'effacer les données en cascade pour vite retirer les avantages liés au statut de coach !

CREATE TABLE coaching(
  `id_coaching` INT NOT NULL AUTO_INCREMENT,
  `id_coach` INT NOT NULL,
  `id_eleve` INT NOT NULL,
  PRIMARY KEY (`id_coaching`),
  KEY `fk_id_coach` (`id_coach`),
  KEY `fk_id_eleve` (`id_eleve`),
  CONSTRAINT `fk_coaching_coach_membres` FOREIGN KEY (`id_coach`) REFERENCES `membres` (`id_membres`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_coaching_eleve_membres` FOREIGN KEY (`id_eleve`) REFERENCES `membres` (`id_membres`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS parrains;

--  Création de la table parrains, les membres ayant leur id dans la colonne id_parrain auront la carte rouge, on efface en cascade pour retirer cette avantage au moindre soucis.

CREATE TABLE parrains(
  `id_parrainage` INT NOT NULL AUTO_INCREMENT,
  `id_parrain` INT NOT NULL,
  `id_filleul` INT NOT NULL,
  PRIMARY KEY (`id_parrainage`),
  KEY `fk_id_parrain` (`id_parrain`),
  KEY `fk_id_filleul` (`id_filleul`),
  CONSTRAINT `fk_coaching_parrain_membres` FOREIGN KEY (`id_parrain`) REFERENCES `membres` (`id_membres`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_coaching_filleul_membres` FOREIGN KEY (`id_filleul`) REFERENCES `membres` (`id_membres`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- On va quand même créer une table admin

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin`(
	`id_admin` INT NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(25),
    `password` VARCHAR(256),
    PRIMARY KEY (`id_admin`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Création de vue

-- Une vue pour voir les services effectués ou, par qui et de quelle société.

CREATE VIEW vue_services AS
SELECT nom_club, superficie, heure_arrivee, heure_depart, societe, fonctions, nom_membres, prenom_membres, titre as statut
FROM services sv
INNER JOIN club cl ON cl.id_club = sv.id_club
INNER JOIN societe st ON st.id_societe = sv.id_societe
INNER JOIN fonctions fc ON fc.id_fonctions = sv.id_fonctions
INNER JOIN membres mb ON mb.id_membres = sv.id_membres
INNER JOIN abonnement ab ON ab.id_abonnement = mb.id_abonnement;

CREATE VIEW vue_donnee AS
SELECT nom_membres, prenom_membres, IMC, metabolisme, besoins, masse_seche, contenu_mineral, eau_totale, masse_grasse, masse_musculaire, masse_hydrique, titre
FROM donnees_corporelles dc
INNER JOIN membres mb ON mb.id_membres = dc.id_membres
INNER JOIN abonnement ab ON ab.id_abonnement = mb.id_abonnement;