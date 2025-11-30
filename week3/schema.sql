DROP TABLE IF EXISTS recipe_step;
DROP TABLE IF EXISTS recipe_ingredient;
DROP TABLE IF EXISTS recipe_category;
DROP TABLE IF EXISTS steps;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS recipes;

CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    prep_time_minutes INTEGER,
    cook_time_minutes INTEGER
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE recipe_category (
    recipe_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE recipe_ingredient (
    recipe_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    quantity NUMERIC(10,2),
    unit VARCHAR(50),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id) ON DELETE CASCADE
);

CREATE TABLE steps (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL
);

CREATE TABLE recipe_step (
    recipe_id INTEGER NOT NULL,
    step_id INTEGER NOT NULL,
    step_number INTEGER NOT NULL,
    PRIMARY KEY (recipe_id, step_number),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (step_id) REFERENCES steps(id)
);

CREATE INDEX idx_categories_name ON categories(name);
CREATE INDEX idx_ingredients_name ON ingredients(name);