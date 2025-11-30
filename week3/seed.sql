INSERT INTO categories (name) VALUES
    ('Cake'),
    ('No-Bake'),
    ('Vegetarian'),
    ('Vegan'),
    ('Gluten-Free'),
    ('Japanese');

INSERT INTO recipes (name, description, prep_time_minutes, cook_time_minutes) VALUES
    ('No-Bake Cheesecake', 'Cheesecake without baking', 20, 0),
    ('Roasted Brussels Sprouts', 'Oven-roasted Brussels sprouts with lemon and sesame', 10, 30),
    ('Mac & Cheese', 'Classic macaroni and cheese', 15, 20),
    ('Tamagoyaki Japanese Omelette', 'Japanese-style rolled omelette', 10, 10),
    ('Vegetarian Potato Salad', 'Simple potato salad, vegetarian and vegan', 15, 0);

INSERT INTO ingredients (name) VALUES
    ('Condensed milk'),
    ('Cream Cheese'),
    ('Lemon Juice'),
    ('Pie Crust'),
    ('Cherry Jam'),
    ('Brussels Sprouts'),
    ('Sesame seeds'),
    ('Pepper'),
    ('Salt'),
    ('Olive oil'),
    ('Macaroni'),
    ('Butter'),
    ('Flour'),
    ('Milk'),
    ('Shredded Cheddar cheese'),
    ('Eggs'),
    ('Soy sauce'),
    ('Sugar'),
    ('Potato');


INSERT INTO recipe_category (recipe_id, category_id)
SELECT r.id, c.id FROM recipes r, categories c
WHERE r.name = 'No-Bake Cheesecake' AND c.name IN ('Cake', 'No-Bake', 'Vegetarian');

INSERT INTO recipe_category (recipe_id, category_id)
SELECT r.id, c.id FROM recipes r, categories c
WHERE r.name = 'Roasted Brussels Sprouts' AND c.name IN ('Vegan', 'Gluten-Free');

INSERT INTO recipe_category (recipe_id, category_id)
SELECT r.id, c.id FROM recipes r, categories c
WHERE r.name = 'Mac & Cheese' AND c.name IN ('Vegetarian');

INSERT INTO recipe_category (recipe_id, category_id)
SELECT r.id, c.id FROM recipes r, categories c
WHERE r.name = 'Tamagoyaki Japanese Omelette' AND c.name IN ('Vegetarian', 'Japanese');

INSERT INTO recipe_category (recipe_id, category_id)
SELECT r.id, c.id FROM recipes r, categories c
WHERE r.name = 'Vegetarian Potato Salad' AND c.name IN ('Vegetarian', 'Vegan', 'Japanese');

INSERT INTO recipe_ingredient (recipe_id, ingredient_id)
SELECT r.id, i.id FROM recipes r, ingredients i
WHERE r.name = 'No-Bake Cheesecake' AND i.name IN
('Condensed milk', 'Cream Cheese', 'Lemon Juice', 'Pie Crust', 'Cherry Jam');

INSERT INTO recipe_ingredient (recipe_id, ingredient_id)
SELECT r.id, i.id FROM recipes r, ingredients i
WHERE r.name = 'Roasted Brussels Sprouts' AND i.name IN
('Brussels Sprouts', 'Lemon Juice', 'Sesame seeds', 'Pepper', 'Salt', 'Olive oil');

INSERT INTO recipe_ingredient (recipe_id, ingredient_id)
SELECT r.id, i.id FROM recipes r, ingredients i
WHERE r.name = 'Mac & Cheese' AND i.name IN
('Macaroni', 'Butter', 'Flour', 'Salt', 'Pepper', 'Milk', 'Shredded Cheddar cheese');

INSERT INTO recipe_ingredient (recipe_id, ingredient_id)
SELECT r.id, i.id FROM recipes r, ingredients i
WHERE r.name = 'Tamagoyaki Japanese Omelette' AND i.name IN
('Eggs', 'Soy sauce', 'Sugar', 'Salt', 'Olive oil');

INSERT INTO recipe_ingredient (recipe_id, ingredient_id)
SELECT r.id, i.id FROM recipes r, ingredients i
WHERE r.name = 'Vegetarian Potato Salad' AND i.name IN
('Potato', 'Salt', 'Pepper', 'Olive oil');