
SELECT * FROM COMMANDE;

--

SELECT * FROM COMMANDE LIMIT 1;

--

SELECT DISTINCT datecom FROM COMMANDE;

--

SELECT nom
FROM CLIENT
WHERE localite = 'Toulouse';

--

SELECT id_commande
FROM DETAIL
WHERE QCOM > 20 AND QCOM < 100; 

--

SELECT id_commande
FROM DETAIL
WHERE QCOM > 20 OR QCOM < 100; 

--

SELECT id_produit
FROM PRODUIT
WHERE QSTOCK IS NULL;

--

SELECT nom
FROM CLIENT
WHERE localite IN ('Toulouse','Lyon'); 

--

SELECT NOM
FROM CLIENT
WHERE localite IN ('Toulouse','Lille','Bruxelles'); 

--

SELECT id_commande
FROM DETAIL
WHERE QCOM BETWEEN 20 AND 100; 

--

SELECT id_produit
FROM PRODUIT
WHERE DESCRIPTION_PRODUIT LIKE '%brosse%'; 

--

SELECT id_produit
FROM PRODUIT
WHERE DESCRIPTION_PRODUIT LIKE '%UBrush%'; 

--

SELECT *
FROM DETAIL
ORDER BY QCOM DESC;

-- 

SELECT id_client , NOM , SOLDE
FROM CLIENT
ORDER BY NOM , SOLDE DESC;

--

SELECT id_client , NOM , SOLDE
FROM CLIENT
ORDER BY 2 , 3 DESC;

--

SELECT count(*),localite
FROM CLIENT
GROUP BY localite;

--
SELECT avg(PRIX) AS prix_moyen
FROM PRODUIT
ORDER BY prix_moyen DESC;

--

SELECT avg(PRIX) AS prix_moyen
FROM PRODUIT p
ORDER BY prix_moyen DESC;

--

SELECT sum(solde) AS Solde_total, LOCALITE 
FROM CLIENT
GROUP BY LOCALITE
ORDER By Solde_total ASC;

--

SELECT sum(QCOM) AS Total_quantity, id_produit
FROM DETAIL
GROUP BY id_produit
ORDER By Total_quantity DESC;

--

SELECT sum(QCOM) AS Total_quantity, id_produit
FROM DETAIL
GROUP BY id_produit
HAVING Total_quantity > 100
ORDER By Total_quantity DESC;

-- 

SELECT COUNT(*) AS total , localite
FROM CLIENT 
GROUP BY localite 
HAVING total BETWEEN 3 AND 5;

--

SELECT localite, SUM(solde) AS solde_par_localite
FROM CLIENT
GROUP BY localite 
HAVING solde_par_localite < 0;

--

SELECT p.qstock, d.qcom  
FROM DETAIL d
INNER JOIN PRODUIT p
	ON d.id_produit = p.id_produit;

--

SELECT  p.DESCRIPTION_PRODUIT, p.qstock - d.qcom  AS stock_residuel
FROM DETAIL d
INNER JOIN PRODUIT p
	on d.id_produit = p.id_produit;
	
--

SELECT sum(D.QCOM*P.PRIX) as montant
FROM DETAIL D
INNER JOIN PRODUIT P
    ON D.id_produit = P.id_produit 
WHERE P.description_produit like 'Brosse%';

--

-- Question : Afficher le nombre de commandes passées par chaque client, trié par ordre décroissant du nombre de commandes.
SELECT 
	id_client, 
	COUNT(id_commande) AS nombre_commandes
FROM COMMANDE
GROUP BY id_client
ORDER BY nombre_commandes DESC;

-- Question : Lister les clients ayant un solde négatif inférieur à -2000 unités, en les triant du plus endetté au moins endetté.
SELECT 
	id_client, 
	nom,
	solde
FROM CLIENT
WHERE solde < -2000
ORDER BY solde ASC;

-- Question : Afficher les produits dont la quantité en stock est inférieure à la quantité moyenne en stock de tous les produits.
SELECT 
	id_produit, 
	description_produit,
	qstock
FROM PRODUIT
WHERE qstock < (SELECT AVG(qstock) FROM PRODUIT);

-- Question : Afficher le nombre total de produits achetés pour chaque commande, en ne gardant que celles où plus de 50 articles ont été commandés.
SELECT 
	id_commande, 
	SUM(qcom) AS total_produits
FROM DETAIL
GROUP BY id_commande
HAVING total_produits > 50
ORDER BY total_produits DESC;

-- Question : Afficher les 3 produits les plus chers de la base de données.
SELECT 
	id_produit, 
	description_produit,
	prix
FROM PRODUIT
ORDER BY prix DESC
LIMIT 3;