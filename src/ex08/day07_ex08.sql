SELECT address, pizzeria.name, count(person_order.person_id)
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY address, pizzeria.name
ORDER BY address, pizzeria.name;