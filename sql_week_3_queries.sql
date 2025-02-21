
	------ Morning class --------

SELECT m.member_id, maker
FROM cars as c 
INNER JOIN member_car as m 
ON c.car_id = m.car_id

SELECT m.member_id, maker
FROM cars as c 
LEFT JOIN member_car as m 
ON c.car_id = m.car_id


SELECT m.member_id, maker
FROM cars as c 
RIGHT JOIN member_car as m 
ON c.car_id = m.car_id 


SELECT m.last_name , message_id , body
FROM members m
LEFT JOIN  messages ms
ON m.member_id = ms.sender_id


-- Attention : full join ne s'éxécute pas code à illustrer pas exécuter : 

SELECT m.member_id, maker
FROM cars as c 
FULL JOIN member_car as m 
ON c.car_id = m.car_id 

-- simple illustration :

LEFT JOIN member_car AS m
RIGHT JOIN member_car AS m
FULL JOIN member_car AS m
INNER JOIN member_car AS m
ON c.car_id = m.car_id; 
ON c.car_id = m.car_id AND c.type = m.TypeCar; 

-------- 

SELECT c.car_id, maker 
FROM cars as c 
LEFT JOIN member_car AS m  
on c.car_id = m.car_id

UNION 

SELECT c.car_id, maker 
FROM cars as c 
LEFT JOIN member_car AS m  
on c.car_id = m.car_id;


SELECT *
FROM cars as c
WHERE c.car_id < 5

UNION 

SELECT *
FROM cars as c
where c.car_id > 10;



SELECT *
FROM cars as c
WHERE c.car_id < 5

UNION ALL 

SELECT *
FROM cars as c
where c.car_id > 10;


SELECT DISTINCT * FROM `cars` c
WHERE c.car_id IN (
  SELECT c.car_id
  FROM `cars` c
);

-- Why it worked without aliasing?
SELECT * 
FROM cars c 
WHERE c.`year` > (SELECT avg(`year`) from cars c2);



-- Why it doesn't work?
SELECT * 
FROM(SELECT maker, car_id 
     FROM cars c);

-- Why it worked?
SELECT * 
FROM(SELECT Maker, car_id
     FROM cars c) as sb;


SELECT COUNT(maker) AS nb_maker, (SELECT COUNT(car_id)FROM cars) AS nb_cars
FROM cars  
GROUP BY maker;


SELECT *
FROM cars c 
WHERE c.year > (SELECT AVG('year') from cars c2);




-- How to read this query?
SELECT * 
FROM cars c 
WHERE maker IN (SELECT DISTINCT sb.maker 
				FROM (SELECT * 
						FROM cars c3 
						WHERE c3.`year` >(SELECT avg(c2.`year`)
								   FROM cars c2)) as sb);


SELECT DISTINCT *
FROM cars c 
WHERE c.car_id IN (SELECT c2.car_id
					FROM cars c2
					WHERE c2.colour = 'red'
					);

SELECT DISTINCT * 
FROM cars c
WHERE EXISTS (SELECT c2.car_id
				FROM cars c2
				WHERE c2.colour = 'red');
				
				
select id_client
from CLIENT c
where exists (select *
              from COMMANDE cm
              where c.id_client = cm.id_client);


--------------------------------------------------------------------------------------------------------------------------------------------

-- Question : Afficher la liste des villes avec le nombre de trajets (y compris celles sans trajet)
SELECT 
    c.city_name, 
    COUNT(r.ride_id) AS nombre_trajets
FROM cities c
LEFT JOIN rides r 
    ON c.city_id = r.starting_city_id
GROUP BY c.city_name
ORDER BY nombre_trajets DESC;

-- Question : Afficher la liste des membres ayant donné ou reçu une note (sans doublons)
SELECT DISTINCT 
    rating_giver_id AS member_id 
FROM ratings
UNION -- UNION supprime les doublons
SELECT DISTINCT 
    rating_receiver_id 
FROM ratings;

-- Question : Afficher la liste des membres ayant donné ou reçu une note (avec doublons)
SELECT 
    rating_giver_id AS member_id 
FROM ratings
UNION ALL -- UNION ALL garde les doublons
SELECT 
    rating_receiver_id 
FROM ratings;

-- Question : Afficher le nombre total de trajets et de demandes de réservation, l'un sous l'autre
SELECT 
    'Trajets' AS type, 
    COUNT(*) AS total 
FROM rides
UNION ALL
SELECT 
    'Demandes' AS type, 
    COUNT(*) 
FROM requests;

-- Question : Afficher la liste des membres avec leur nombre de notes reçues (y compris ceux sans notes)
SELECT 
    m.member_id, 
    m.first_name, 
    m.last_name, 
    (SELECT COUNT(*) 
     FROM ratings r 
     WHERE r.rating_receiver_id = m.member_id) AS nombre_notes
FROM members m;

-- Question : Afficher la liste des membres ayant reçu plus de 2 notes
SELECT 
    m.member_id, 
    m.first_name, 
    m.last_name
FROM members m
WHERE (SELECT COUNT(*) 
       FROM ratings r 
       WHERE r.rating_receiver_id = m.member_id) > 2;

-- Question : Afficher la liste des membres avec leur note moyenne reçue (y compris ceux sans notes)
SELECT  
    m.member_id,  
    m.first_name,  
    m.last_name,  
    (SELECT AVG(r.grades)  
     FROM ratings r  
     WHERE r.rating_receiver_id = m.member_id) AS note_moyenne  
FROM members m; 

-- Question : Afficher la liste des membres ayant une note moyenne strictement supérieure à 4
SELECT  
    m.member_id,  
    m.first_name,  
    m.last_name,
    (SELECT AVG(r.grades)  
     FROM ratings r  
     WHERE r.rating_receiver_id = m.member_id) AS note_moyenne
FROM members m  
WHERE (SELECT AVG(r.grades)  
       FROM ratings r  
       WHERE r.rating_receiver_id = m.member_id) > 4;