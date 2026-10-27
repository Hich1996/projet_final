SELECT donnes_livreurs.nom, COUNT(donnes_commandes.id_commande) AS nombre_commandes, SUM(donnes_commandes.montant_paye) AS CA_commandes, SUM(donnes_commandes.cout_livreur) AS cout_commandes
FROM {{ref('stg_commandes')}} AS donnes_commandes
JOIN {{ref('stg_livreurs')}} AS donnes_livreurs
ON donnes_commandes.id_livreur = donnes_livreurs.id_livreur
GROUP BY ALL 