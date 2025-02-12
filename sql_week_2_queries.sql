-- Question : Afficher la liste des commandes avec l’ID de la commande, la date et le nom du client, triée par date décroissante.
SELECT
    co.id_commande, 
    co.datecom, 
    cl.nom
FROM COMMANDE co
LEFT JOIN CLIENT cl 
    ON co.id_client = cl.id_client
ORDER BY co.datecom DESC;

-- Question : Afficher les détails des commandes avec l’ID de la commande, la description du produit et la quantité commandée.
SELECT
    de.id_commande, 
    pr.description_produit, 
    de.qcom
FROM DETAIL de
LEFT JOIN PRODUIT pr 
    ON de.id_produit = pr.id_produit;

-- Question : Afficher la liste des clients ayant passé au moins une commande, avec leur ID et leur nom.
SELECT DISTINCT
    cl.id_client, 
    cl.nom
FROM CLIENT cl
INNER JOIN COMMANDE co -- INNER JOIN pour ne garder que les clients ayant une commande
    ON cl.id_client = co.id_client;

-- Question : Afficher l’ID des commandes avec le montant total dépensé (quantité commandée × prix unitaire), trié par montant décroissant.
SELECT
    co.id_commande, 
    SUM(de.qcom * pr.prix) AS montant_total
FROM COMMANDE co
LEFT JOIN DETAIL de 
    ON co.id_commande = de.id_commande
LEFT JOIN PRODUIT pr 
    ON de.id_produit = pr.id_produit
GROUP BY co.id_commande
ORDER BY montant_total DESC;

-- Question : Afficher pour chaque client l’ID, le nom et le nombre total de commandes passées, trié par ordre décroissant.
SELECT
    cl.id_client, 
    cl.nom, 
    COUNT(co.id_commande) AS nombre_commandes
FROM CLIENT cl
LEFT JOIN COMMANDE co -- LEFT JOIN : on inclut tous les clients, même ceux sans commandes
    ON cl.id_client = co.id_client
GROUP BY cl.id_client, cl.nom
ORDER BY nombre_commandes DESC;

-- Question : Afficher la liste des clients ayant commandé plus de 100 unités au total (toutes commandes confondues).
SELECT
    cl.id_client, 
    cl.nom, 
    SUM(de.qcom) AS total_commandé
FROM CLIENT cl
INNER JOIN COMMANDE co -- INNER JOIN : on ne garde que les clients ayant passé des commandes
    ON cl.id_client = co.id_client
INNER JOIN DETAIL de -- INNER JOIN : on relie les commandes aux détails
    ON co.id_commande = de.id_commande
GROUP BY cl.id_client, cl.nom
HAVING total_commandé > 100;

-- Question : Afficher les 5 produits les plus commandés, avec leur ID, leur description et la quantité totale commandée.
SELECT
    pr.id_produit, 
    pr.description_produit, 
    SUM(de.qcom) AS quantité_totale
FROM PRODUIT pr
INNER JOIN DETAIL de -- INNER JOIN : on ne garde que les produits qui ont été commandés
    ON pr.id_produit = de.id_produit
GROUP BY pr.id_produit, pr.description_produit
ORDER BY quantité_totale DESC
LIMIT 5;

-- Question : Afficher la liste des commandes ayant au moins un produit de type “Brosse_dent_2018”, avec leur ID et leur date.
SELECT DISTINCT
    co.id_commande, 
    co.datecom,
    pr.description_produit
FROM COMMANDE co
LEFT JOIN DETAIL de 
    ON co.id_commande = de.id_commande
LEFT JOIN PRODUIT pr 
    ON de.id_produit = pr.id_produit
WHERE pr.description_produit = 'Brosse_dent_2018';

-- Question : Afficher la liste des localités des clients ayant passé au moins une commande, ainsi que le nombre de clients par localité, triée par nombre de clients décroissant.
SELECT
    cl.localite, 
    COUNT(DISTINCT cl.id_client) AS nombre_clients
FROM CLIENT cl
INNER JOIN COMMANDE co -- INNER JOIN : on ne garde que les clients ayant passé au moins une commande
    ON cl.id_client = co.id_client
GROUP BY cl.localite
ORDER BY nombre_clients DESC;