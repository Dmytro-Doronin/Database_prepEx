My database design for recipes was already in 2NF and 3NF in Week 2:

- All tables are in 1NF (atomic values, no repeating groups).
- Many-to-many relationships are modeled with junction tables:
    - `recipe_category` between `recipes` and `categories`
    - `recipe_ingredient` between `recipes` and `ingredients`
    - `recipe_step` between `recipes` and `steps`
- In tables with composite primary keys (`recipe_category`, `recipe_ingredient`, `recipe_step`)
  every non-key attribute depends on the whole key, not on part of it.
- There are no transitive dependencies between non-key attributes.

In Week 3 I mostly **verified** the normalization and improved the schema:

- I added `UNIQUE` constraints on:
    - `categories.name`
    - `ingredients.name`
- I added `ON DELETE CASCADE` to foreign keys in junction tables.
- I added indexes on:
    - `categories(name)`
    - `ingredients(name)`

The logical design did not change, but now the database enforces the functional dependencies
and performs better for queries that filter by category/ingredient name.