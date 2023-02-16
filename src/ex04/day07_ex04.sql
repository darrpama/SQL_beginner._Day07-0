WITH foo AS
(SELECT person.name, count(pizzeria_id) AS count_of_visits
FROM person JOIN person_visits pv ON person.id = pv.person_id
GROUP BY person.name)
SELECT foo.name, foo.count_of_visits
FROM person
JOIN foo ON foo.name = person.name AND foo.count_of_visits > 3;