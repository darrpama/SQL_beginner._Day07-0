WITH foo AS
((SELECT pizzeria.name AS name, count(pizzeria.name) AS count
FROM person_order
JOIN menu on person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC, name LIMIT 3)
UNION ALL
(SELECT pizzeria.name AS name, count(person_id) AS count
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY count DESC LIMIT 3))

SELECT name, sum(count) AS total_count
FROM foo
GROUP BY name
ORDER BY total_count DESC, name;