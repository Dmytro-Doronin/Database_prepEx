SELECT DISTINCT r.*
FROM recipes r
JOIN recipe_category rc ON rc.recipe_id = r.id
JOIN categories c ON c.id = rc.category_id
JOIN recipe_ingredient ri ON ri.recipe_id = r.id
JOIN ingredients i ON i.id = ri.ingredient_id
WHERE c.name = 'Vegetarian'
AND i.name = 'Potato';

SELECT r.*
FROM recipes r
JOIN recipe_category rc ON rc.recipe_id = r.id
JOIN categories c ON c.id = rc.category_id
WHERE c.name IN ('Cake', 'No-Bake')
GROUP BY r.id
HAVING COUNT(DISTINCT c.name) = 2;

SELECT r.*
FROM recipes r
JOIN recipe_category rc ON rc.recipe_id = r.id
JOIN categories c ON c.id = rc.category_id
WHERE c.name IN ('Vegan', 'Japanese')
GROUP BY r.id
HAVING COUNT(DISTINCT c.name) = 2;