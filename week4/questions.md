Discussion (Try to write answers to these questions in text, provide queries and commands when necessary)

1. What made you decide when to embed information? What assumptions did you make?

I embed data that is always used together with the recipe: steps, the list of ingredients for that recipe, and the category names. When I read one recipe, I almost always need to see all this information at once, so it makes sense to keep it in a single recipe document. It also makes it easy to query, for example:

`db.recipes.find({ categories: "Vegetarian", "ingredients.name": "Potato" })`

I keep users, categories and ingredients as separate collections in a normalised way. Many recipes can reuse the same category or ingredient, and one user can have many recipes. With separate collections I can change the name or add more metadata (for example “isVegan” for ingredients) only in one place.

I assume that:
- One recipe is not very large, so embedding steps and ingredients will not create huge documents.
- Reading recipes (for example on a website or in an app) is more common than updating them.
- Categories and ingredients are shared between many recipes and can get more metadata later, so it is useful to keep them normalised too.
- One recipe has exactly one creator (user), and one user can create many recipes.

2. If you were given PostgreSQL and MongoDB as choices to build the recipe's database at the beginning, which one would you choose and why?

For this project I would choose MongoDB. A recipe fits very naturally into a single document with its name, description, steps, ingredients and categories. Most queries are read-heavy (for example “show all Vegan recipes with Potato”), and MongoDB lets me do this with simple queries on one collection, without joins.

MongoDB also gives me more flexibility if the structure of the recipe changes over time (for example if I want to add photos, tags, ratings, or comments). I can extend the recipe document without changing a strict schema.

PostgreSQL would be a good choice if I needed strong transactions across many tables, complex reporting or analytics, but for a recipe application with nested data MongoDB matches the use case better.
