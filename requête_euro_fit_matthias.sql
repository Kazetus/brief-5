USE euro_fit_matthias;

-- Testons les vues

SELECT * FROM vue_services;
SELECT * FROM vue_donnee;

-- Connaitre toutes les ventes, qui a acheté, dans quel club et combien ça a couté.

SELECT nom_membres, prenom_membres, `date`, intitule, categorie, quantite, prix_HT, prix_ht*quantite as total, nom_club
FROM achats ac
INNER JOIN membres mb ON mb.id_membres = ac.id_membres
INNER JOIN club cb ON cb.id_club = ac.id_club
INNER JOIN produit pb ON pb.id_produit = ac.id_produit
INNER JOIN categorie ct ON ct.id_categorie = pb.id_categorie;

-- Connaitre le nom et l'adresse de l'assurance du club sandwich

SELECT nom_assurance, adresse, ville, code_postal, pays, nom_club, mail, tel, superficie, contrat_assurance
FROM assurance ar
INNER JOIN club cb ON cb.id_assurance = ar.id_assurance
INNER JOIN adresse ad ON ad.id_adresse = ar.id_adresse
INNER JOIN ville vl ON vl.id_ville = ad.id_ville
INNER JOIN pays ps ON ps.id_pays = ad.id_pays
INNER JOIN code_postal cp ON cp.id_code_postal = ad.id_code_postal
WHERE nom_club = 'Sandwich';

-- connaitre la liste des personnes coachés par Subtil Loinvoyant grâce à une requète imbriquée.

SELECT nom_membres, prenom_membres 
FROM coaching cg
INNER JOIN membres mb ON mb.id_membres = cg.id_eleve
WHERE id_coach = (
	SELECT id_membres
    FROM membres
    WHERE prenom_membres = 'Subtil' AND nom_membres = 'Loinvoyant'
);

-- Connaitre la liste des salles pour cycliste.

SELECT nom_salles, `type`, nom_club
FROM salles sl
INNER JOIN club cb ON cb.id_club = sl.id_club
WHERE `type` = 'cycliste';