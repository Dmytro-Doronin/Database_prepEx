CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE categories (
    id SERRIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE recipe_category (
    recipe_id INTEGER REFERENCES recipes(id),
    category_id INTEGER REFERENCES categories(id),
    PRIMARY KEY (recipe_id, category_id)
);

CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE recipe_ingredient (
    recipe_id INTEGER REFERENCES recipes(id),
    ingredient_id INTEGER REFERENCES ingredients(id),
    PRIMARY KEY (recipe_id, ingredient_id)
);

CREATE TABLE steps (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL
);

CREATE TABLE recipe_step (
    recipe_id INTEGER REFERENCES recipes(id),
    step_id INTEGER REFERENCES steps(id),
    step_number INTEGER NOT NULL,
    PRIMARY KEY (recipe_id, step_number)
);