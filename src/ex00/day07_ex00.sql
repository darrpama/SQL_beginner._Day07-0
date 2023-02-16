SELECT person_id, count(pizzeria_id) AS count_of_visits
FROM person_visits
group by person_id
ORDER BY count_of_visits DESC, person_id;