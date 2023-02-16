(SELECT pizzeria.name AS name, count(pizzeria.name) AS count, 'order' AS action_type
FROM person_order
JOIN menu on person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name, action_type
ORDER BY count DESC, name LIMIT 3)
UNION ALL
(SELECT pizzeria.name AS name, count(person_id) AS count, 'visit' AS action_type
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC LIMIT 3)