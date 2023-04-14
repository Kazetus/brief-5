use euro_fit_matthias;

-- Insertion de quelques sociétés de services

INSERT INTO `societe` (`societe`) VALUES 
('Make thing clean'),
('Absolute Security'),
('Nettoie Tout'),
('Make Danger');

-- insertion des services à effectuer

INSERT INTO `fonctions` (`fonctions`) VALUES 
('Ménage'),
('Sécurité');

-- insertion de quelques abonnements

INSERT INTO `abonnement` (`titre`, `tout_club`, `toutes_salles`,`tout_pays`, `reduc_complement`, `reduc_medecine`, `reduc_coach`) VALUES 
( 'VIP', true, true, true, 100, 0, 100),
( 'premium version international', true, true, true, 25, 0, 25 ),
( 'premium', false, true, false, 25, 0, 25),
( 'cycliste international', true, true, true, 100, 100, 0),
( 'cycliste d\'eau douce', false, true, false, 0, 0, 0),
( 'le muscle est partout', true, true, true, 100, 100, 0),
( 'coach', false, false, false, 0, 0, 0),
( 'sécurité et ménage', false, false, false, 0, 0, 0);

-- Insertion de quelques villes

INSERT INTO `ville` (`ville`) VALUES 
('Paris'),
('Berlin'),
('Nice');

-- Insertion de quelques quartiers

INSERT INTO `quartier` (`quartier`) VALUES 
('XIIIeme'),
('Ouest'),
('Nord');

-- Insertion des pays des villes

INSERT INTO `pays` (`pays`) VALUES 
('France'),
('Allemagne');

-- Insertion de code_postal

INSERT INTO `code_postal` (`code_postal`) VALUES 
('10178'),
('75634'),
('06100'),
('06200');

-- Insertion d'adresse

INSERT INTO `adresse` (`adresse`, `id_ville`, `id_pays`, `id_quartier`, `id_code_postal`) VALUES 
('14 avenue de la république', 1, 1, 1, 2),
('18 avenue de l\'armistice', 2, 2, 3, 1),
('0 avenue de l\'Italie', 3, 1, 2, 4),
('40 Avenue du 18 Juin', 1, 2, 3, 1),
('6 Rue dela Tisonnière', 1, 1, 1, 2),
('Busch 12, 1562 HH Krommenie', 2, 2, 3, 1),
('La Frétière', 3, 1, 2, 4);

-- Insertion de médecin

INSERT INTO `medecin` (`prenom_medecin`, `nom_medecin`, `mail`, `tel`, `id_adresse`) VALUES 
('Jean', 'Lafitte', 'pirate@mexique.golf', '+594 0418231827', 2),
('Marie', 'Curie', 'marie@radiation.fr', '+33 0416871934', 1),
('FitzChevalerie', 'Loinvoyant', 'fitz@cerf.duc', '+95 0785456585', 3),
('Agatha', 'Duggan', 'A.Dug@gmail.com', '+33 678543289', 4);

-- Insertion de categorie de produit

INSERT INTO `categorie` (`categorie`) VALUES 
('dopant'),
('antalgique'),
('NRJ drink');

-- Insertion de produit

INSERT INTO `produit` (`intitule`, `fournisseur`, `fabriquant`, `prix_HT`, `id_categorie`) VALUES 
('Dope de Cycliste', 'Grosstriche', 'Laboratoire L. Armstrong', '100.99', 1),
('Dolipron', 'Faux medoc co.', 'SONO HIFI', '25.99', 2),
('anti monstre', 'Diabeteur', 'sucreenplus', '2.99', 3);

-- Insertion d'assurances

INSERT INTO `assurance` (`nom_assurance`, `id_adresse`) VALUES 
('pas assurant', 1),
('Garantie sans remboursement', 3),
('hors conditions', 2);

-- Insertion de club

INSERT INTO `club` (`nom_club`, `mail`, `tel`, `superficie`, `contrat_assurance`, `id_adresse`, `id_assurance`) VALUES 
('Sandwich', 'sandwich@club.com', '0101010101', '40000', '000N4523', 1, 2),
('Medoc', 'medoc@club.com', '0181818181', '100', 'PA3280487413', 2, 1),
('sans sport', 'sans@club.com', '0987845812', '3000', 'NRDCDR458597810518472', 3, 3);

-- Insertion de stock 

INSERT INTO `stock` (`quantite`, `id_produit`, `id_club`) VALUES 
(50, 1, 1),
(35, 2, 1),
(30, 3, 1),
(900, 1, 2),
(155, 3, 3);

-- Insertion de salles

INSERT INTO `salles` (`nom_salles`, `type`, `id_club`) VALUES 
('Sans triche', 'Cycliste', 1),
('Santé', 'Non cycliste', 1),
('Albert Camus', 'Cycliste', 2),
('42', 'Non Cycliste', 3),
('Maillot vert', 'Cycliste', 3);

-- Insertion d'équipements

INSERT INTO `equipements` (`type`, `nombre`, `id_salles`) VALUES 
('musculation', 25, 1),
('musculation', 50, 3),
('musculation', 1, 4),
('cardio', 12, 2),
('cardio', 99, 3),
('cardio', 3, 1);

-- Insertion de capteur

INSERT INTO `capteurs` (`type`, `date`, `valeur`, `id_salles`) VALUES 
('température', '2022-07-05 12:50:30', 25, 1),
('hygrométrie', '2022-07-05 12:50:30', 60, 1),
('pression', '2022-07-05 12:50:30', 200, 1),
('CO2', '2022-07-05 12:50:30', 0, 1),
('température', '2023-04-14 16:00:00', 46, 1),
('hygrométrie', '2023-04-14 16:00:00', 80, 1),
('pression', '2023-04-14 16:00:00', 10, 1),
('CO2', '2023-04-14 16:00:00', 900, 1),
('température', '2023-04-14 16:00:00', 72, 1),
('hygrométrie', '2023-04-14 16:00:00', 20, 1),
('pression', '2022-07-05 12:50:30', 89, 1),
('CO2', '2023-04-13 06:45:27', 100, 1),
('température', '2023-04-14 16:00:00', 0, 1),
('hygrométrie', '2023-04-14 16:00:00', 650, 1),
('pression', '2023-04-14 16:00:00', 1000, 1),
('CO2', '2023-04-14 16:00:00', 2, 1),
('température', '2023-04-14 16:00:00', 15, 1),
('hygrométrie', '2023-04-14 16:00:00', 50, 1),
('pression', '2023-04-14 16:00:00', 300, 1),
('CO2', '2023-04-14 16:00:00', 65, 1);

-- Insertion d'activites

INSERT INTO `activites` (`nom_activite`, `prof`, `reservation`, `id_salles`) VALUES 
('Tennis', 'Rafael Nadal', '2063-12-10', 1),
('Patinage', 'philippe candeloro', '2024-01-14', 1),
('Volley ball', 'Earvin Ngapeth', '2063-12-10', 2),
('Course à pied', 'Usain Bolt', '2063-12-10', 2),
('Ping pong', 'Fan Zhendong', '2063-12-10', 3),
('Equitation', 'Yasmin Ingham', '2063-12-10', 4),
('Mario Kart', 'Florent “Neo” Lecoanet', '2063-12-10', 5);

-- Insertion de salles d'hygiene

INSERT INTO `hygiene` (`type`,`nombre`, `id_club`) VALUES 
('Toilettes normales', 1, 1),
('Toilettes sèches', 14, 1),
('Douche', 5, 1),
('Vestiaire', 3, 1),
('sauna', 50, 1),
('Toilettes normales', 10, 2),
('Toilettes sèches', 1, 2),
('Douche', 1, 2),
('Vestiaire', 6, 2),
('sauna', 1, 2),
('Toilettes normales', 25, 3),
('Toilettes sèches', 40, 3),
('Douche', 15, 3),
('Vestiaire', 1, 3),
('sauna', 2, 3);

-- Insertion de membres

INSERT INTO `membres` ( `prenom_membres`, `nom_membres`, `tel`, `mail`,`certificat_medical`,`card_number`,`card_date`,`CCV`,`password`,`id_club`,`id_abonnement`,`id_medecin`,`id_adresse`) VALUES 
( 'Umbre', 'Tombetoile', '+33 0410258578', 'ombre@thym.dame', 'cerfa-152587848.pdf', '4280-5327-9968-7228', '2/2026', 285, '$2y$10$MSsZqFK2Vo2RysD2/408MeEBPxGLcGtFM5PL0Og06Nj9oL/YCQ6xm', 1, 1, 3, 2),
( 'Subtil', 'Loinvoyant', '+33 0425564575', 'leroi@cerf.duc', 'cerfa-155856457588912354.pdf', '4772-0680-7633-5491', '2/2027', 715, '$2y$10$gpXEwM6MiRIDXRmKzBHRGOWdTHtyvQq1OVp04F2UgQnJ6DfFZPfFS', 1, 7, 3, 2),
( 'Agent', 'ménage', '+33 0400700756', 'agent@mtc.co', 'cerfa-15.pdf', '4584-5546-2269-5320', '4/2027', 634, '$2y$10$LsNIQ47NEPq2dyFtGEjOOeZpXtOZ0wWM87VKc73Wd5BEdJ79kmD.6', 2, 8, 2, 4),
( 'Lamar', 'Bellic', '+45 11527563', 'imporage@gmail.com', 'cerfa-15156464684.pdf', '3617-4607-6802-9683', '1/2024', 676, '$2y$10$yqveMyjGalHTuOryw90/LeBOnatgbzxLd.EaPX05NTnMYmB50kY3.', 3, 2, 4, 5), 
( 'Franklin', 'Jakowski', '+336 55487565', 'frajaski@aol.com', 'cerfa-154545786765454.pdf', '4540-7336-0239-1976', '6/2027', 215, '$2y$10$yqveMyjGalHTuOryw90/LeBOnatgbzxLd.EaPX05NTnMYmB50kY3.', 2, 8, 4, 6);

-- Insertion de données corporelles

INSERT INTO `donnees_corporelles` (`IMC`, `metabolisme`, `besoins`, `masse_seche`,`contenu_mineral`,`eau_totale`,`masse_grasse`,`masse_musculaire`,`masse_hydrique`,`id_membres`) VALUES 
(45, 25, 12, 10, 58, 35, 75, 715, 25, 1),
(30, 75, 2, 199, 25, 30, 14, 400, 21, 3),
(5, 1, 69, 32, 63, 85, 34, 18, 50, 2);

-- Insertion de coaching

INSERT INTO `coaching` (`id_coach`, `id_eleve`) VALUES 
(2, 1),
(2, 4);

-- Insertion de parrains

INSERT INTO `parrains` (`id_parrain`, `id_filleul`) VALUES 
(1, 2),
(4, 1);

-- Insertion d'achats

INSERT INTO `achats` (`date`, `quantite`, `id_membres`, `id_produit`, `id_club`) VALUES 
('2022-07-05 12:14:25','20', 1, 1, 2),
('2022-08-14 14:59:59','2', 2, 3, 1),
('2022-09-17 01:59:00','49', 4, 2, 3),
('2022-10-25 06:18:16','1', 3, 2, 1),
('2022-11-02 03:18:16','3', 5, 1, 2);

-- Insertion de services

INSERT INTO `services` (`heure_arrivee`, `heure_depart`, `id_membres`, `id_societe`, `id_fonctions`, `id_club`) VALUES 
('2022-07-05 02:14:25','2022-07-05 04:45:25', 3, 1, 1, 2),
('2022-08-14 04:59:59','2022-08-15 01:59:59', 5, 3, 2, 1),
('2022-09-17 09:59:00','2022-09-17 11:59:00', 3, 2, 1, 3),
('2022-10-25 06:18:16','2022-10-25 18:18:16', 5, 2, 1, 1),
('2022-11-02 04:18:16','2022-11-02 05:18:16', 3, 3, 2, 2);

-- Insertion d'un admin

INSERT INTO `admin` (`login`,`password`) VALUES
('sysadmingestioneurofit','$2y$10$6NNSEPgPcKaaHgIekZFEDOsQY7I41ZC4myo3vXXwmWvirWMqBVa.u')