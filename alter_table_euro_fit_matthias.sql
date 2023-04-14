-- Bon, on va devoir altérer une table. La table salles contient des salles qui peuvent être de type cycliste ou non cycliste, on peut remplacer ça par un booléen.alter

ALTER TABLE salles
ADD `cycliste` BOOL NOT NULL;


-- J'ai altéré la table salles, voyons ce qu'il se passe.

SELECT * FROM salles;

-- Après avoir fais un select all sur salles, je vois que ma colonne cycliste ne contient que des zéros, on va changer ça.

UPDATE salles
SET `cycliste` = true
WHERE `type` = "cycliste";

SELECT * FROM salles;

-- La colonne cycliste a bien été mis à jours, je peux maintenant supprimer la colonne type.alter

ALTER TABLE salles
DROP `type`;

SELECT * FROM salles;

-- La colonne type a bien disparu, maintenant, il faut faire attention aux requètes déjà créées si elles requièrent la colonne type, il faut remplacer par cycliste.
-- Cette requète ne marche plus, je dois la mettre à jours.
-- SELECT nom_salles, `type`, nom_club
-- FROM salles sl
-- INNER JOIN club cb ON cb.id_club = sl.id_club
-- WHERE `type` = 'cycliste';

-- Cette nouvelle requète doit être utilisé à la place de la précédente pour éviter les erreurs.

SELECT nom_salles, cycliste, nom_club
FROM salles sl
INNER JOIN club cb ON cb.id_club = sl.id_club
WHERE cycliste = true;