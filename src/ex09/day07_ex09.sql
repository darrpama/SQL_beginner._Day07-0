WITH foo AS (
    SELECT cast(age AS numeric (7,2)), id
    FROM person
)

SELECT address,
       round((max(foo.age)-(min(foo.age)/max(foo.age))), 2) as formula,
       round(avg(foo.age), 2) as average,
       (round((max(foo.age)-(min(foo.age)/max(foo.age))), 2) > round(avg(foo.age), 2)) as comparison
from person
join foo on foo.id = person.id
group by address
order by address;