SELECT pizzeria.name, count(pizzeria.name) AS count_of_orders, round(avg(price), 2), max(price), min(price)
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON menu.id = person_order.menu_id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;