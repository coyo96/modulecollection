-- Add Default Admin and User to the Database
BEGIN TRANSACTION;

-- Create Admin and User
INSERT INTO users (username, password_hash, role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username, password_hash, role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Creating our user Accounts
INSERT INTO users (username, password_hash, role) VALUES ('sefanit','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('coyo','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('jackie','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('andrew','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Create 3 Default Recipes
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Cheese Pizza', 'https://i0.wp.com/prettysimplesweet.com/wp-content/uploads/2015/12/margherita_pizza.jpg?w=680&quality=89&ssl=1', E'Gooey, cheesy goodness on a crispy crust. Perfect quick family meal.', 10, 'pizza, marinara, dinner, cheese', false, true);


-- --Links vegan to pizza
-- INSERT INTO recipes_tags (tag_id, recipe_id) VALUES (1,1);


--INSERT INTO tags
INSERT INTO tags (tag) VALUES ('vegetarian');
INSERT INTO tags (tag) VALUES ('halal');
INSERT INTO tags (tag) VALUES ('kosher');
INSERT INTO tags (tag) VALUES ('gluten-free');
INSERT INTO tags (tag) VALUES ('low-sodium');
INSERT INTO tags (tag) VALUES ('paleo');
INSERT INTO tags (tag) VALUES ('raw-food');
INSERT INTO tags (tag) VALUES ('low-cholesterol');
INSERT INTO tags (tag) VALUES ('renal-diet');
INSERT INTO tags (tag) VALUES ('vegan');

--Adding cheese to ingredients table
INSERT INTO ingredients (ingredient) VALUES ('1/2 recipe homemade pizza dough');
INSERT INTO ingredients (ingredient) VALUES ('1 Tablespoon (15ml) olive oil, divided');
INSERT INTO ingredients (ingredient) VALUES ('1 Tablespoon (8g) cornmeal');
INSERT INTO ingredients (ingredient) VALUES ('1/2-3/4 cup (127-190g) pizza sauce');
INSERT INTO ingredients (ingredient) VALUES ('8 oz sliced mozzarella cheese');
INSERT INTO ingredients (ingredient) VALUES ('1 and 1/2 cups (6oz or 168g) shredded mozzarella cheese');
INSERT INTO ingredients (ingredient) VALUES ('2-3 Tablespoons (10-15g) grated parmesan cheese');
INSERT INTO ingredients (ingredient) VALUES ('dried basil or Italian seasoning to taste');


--Links cheese to pizza
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (1, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (2, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (3, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (4, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (5, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (6, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (7, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (8, 1);

-- Adding Cheese, Milk, and Tomato to the "user" 'Grocery List'
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 1, 1, false);
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 2, 1, true);
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 3, 1, false);

-- Adding 6 Steps to Pizza
INSERT INTO steps (rank, instruction) VALUES (1, E'Dough: Prepare pizza dough through step 3. If using store-bought frozen pizza dough, make sure it is thawed.');
INSERT INTO steps (rank, instruction) VALUES (2, E'Preheat oven to 475 Degrees F (246 Degrees C). Allow it to heat for at least 15-20 minutes as you shape the pizza in the next step. If using a pizza stone, place it in the oven to preheat as well. Lightly grease a large baking sheet or pizza pan with 1/2 Tablespoon of olive oil. Sprinkle lightly with cornmeal, which gives the crust extra crunch and flavor.');
INSERT INTO steps (rank, instruction) VALUES (3, E'Shape the dough: When the homemade dough is ready, punch it down to release any air bubbles. Divide the dough in half and freeze half the dough for another time—see freezing instructions in the pizza dough recipe. On a lightly floured work surface using lightly floured hands or rolling pin, gently flatten the dough into a disc. Place on prepared pan and, using lightly floured hands, stretch and flatten the disc into a 12-inch circle, about 1/2-inch thick. If the dough keeps shrinking back as you try to stretch it, stop what you\'re doing, cover it lightly and let it rest for 5-10 minutes, then try again. Once shaped into a 12-inch circle, lift the edge of the dough up to create a lip around the edges. I simply pinch the edges up to create the rim. If using a pizza stone, place the dough directly on a baker\'s peel dusted with cornmeal. Cover dough lightly with plastic wrap or a clean kitchen towel and allow to rest for a few minutes as you gather the pizza toppings.');
INSERT INTO steps (rank, instruction) VALUES (4, E'Top & bake the pizza: Using your fingers, push dents into the surface of the dough to prevent bubbling. Brush remaining olive oil all over the dough. Top the dough with the pizza sauce, then the sliced mozzarella, the shredded mozzarella, and grated parmesan. Sprinkle lightly with basil or Italian seasoning.');
INSERT INTO steps (rank, instruction) VALUES (5, E'Bake for 14-15 minutes or until the crust is golden brown. Remove from the oven.');
INSERT INTO steps (rank, instruction) VALUES (6, E'Slice hot pizza and serve immediately. Cover leftover pizza tightly and store in the refrigerator for up to 1 week. Freezing and reheating instructions below.');

-- Add Steps to Pizza
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (1,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (2,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (3,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (4,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (5,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (6,1);

-- Add Recipe 2 to "user" Favorites
INSERT INTO users_recipes (user_id, recipe_id) VALUES (1,2);



-- NEW Recipes



-- Insert Hummus Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Hummus', 'https://www.inspiredtaste.net/wp-content/uploads/2019/03/How-to-Make-Homemade-Hummus-1200.jpg', 'Creamy and delicious hummus dip.', 6, 'hummus, dip, vegan, mediterranean, greek, chickpea, snacks, dips, appetizer', false, true);

-- Insert Ingredients for Hummus Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 cans (30 oz) of chickpeas, drained and rinsed');
INSERT INTO ingredients (ingredient) VALUES ('1/3 cup (80ml) of tahini');
INSERT INTO ingredients (ingredient) VALUES ('2 cloves of garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (60ml) of fresh lemon juice');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) of olive oil');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon (5g) of ground cumin');
INSERT INTO ingredients (ingredient) VALUES ('Salt and pepper to taste');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) of water');

-- Link Ingredients to Hummus Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (9, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (10, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (11, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (12, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (13, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (14, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (15, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (16, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));

-- Insert Steps for Hummus Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'In a food processor, combine the chickpeas, tahini, minced garlic, lemon juice, olive oil, and ground cumin.');
INSERT INTO steps (rank, instruction) VALUES (2, 'Process until the mixture is smooth and creamy, adding water as needed to achieve the desired consistency.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Season with salt and pepper to taste.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Transfer the hummus to a serving bowl, drizzle with a bit of olive oil, and garnish with fresh herbs, if desired.');

-- Link Steps to Hummus Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (7, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (8, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (9, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (10, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegan'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
-- );


-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'pescetarian'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
-- );



-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'gluten-free'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
--  );

-- Start a Transaction for Lemon Sorbet Recipe


-- Insert Lemon Sorbet Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Lemon Sorbet', 'https://i1.wp.com/lmld.org/wp-content/uploads/2022/07/Lemon-Sorbet-6.jpg', 'Refreshing and tangy lemon sorbet.', 4, 'lemon, sorbet, dessert, vegan, summer, sorbet, ice cream, sorbets', false, true);

-- Insert Ingredients for Lemon Sorbet Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 cups (480ml) of fresh lemon juice');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (240ml) of water');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (200g) of granulated sugar');

-- Link Ingredients to Lemon Sorbet Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (17, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (18, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (19, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));

-- Insert Steps for Lemon Sorbet Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'In a mixing bowl, combine fresh lemon juice, water, and granulated sugar.');
INSERT INTO steps (rank, instruction) VALUES (2, 'Stir until sugar is dissolved.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Pour the mixture into an ice cream maker and churn according to the manufacturer instructions until it reaches a sorbet consistency.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Transfer the sorbet to an airtight container and freeze for a few hours until firm.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Serve the lemon sorbet in chilled bowls or cones.');

-- Link Steps to Lemon Sorbet Recipe
-- Insert the step with the instruction 'In a mixing bowl, combine fresh lemon juice, water, and granulated sugar.'
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT steps.step_id, recipes.recipe_id
FROM steps
JOIN recipes ON steps.instruction = 'In a mixing bowl, combine fresh lemon juice, water, and granulated sugar.'
WHERE recipes.recipe_name = 'Lemon Sorbet';

-- Insert the step with the instruction 'Stir until sugar is dissolved.'
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT steps.step_id, recipes.recipe_id
FROM steps
JOIN recipes ON steps.instruction = 'Stir until sugar is dissolved.'
WHERE recipes.recipe_name = 'Lemon Sorbet';

-- Insert the step with the instruction 'Pour the mixture into an ice cream maker and churn according to the manufacturer instructions until it reaches a sorbet consistency.'
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT steps.step_id, recipes.recipe_id
FROM steps
JOIN recipes ON steps.instruction = 'Pour the mixture into an ice cream maker and churn according to the manufacturer instructions until it reaches a sorbet consistency.'
WHERE recipes.recipe_name = 'Lemon Sorbet';

-- Insert the step with the instruction 'Transfer the sorbet to an airtight container and freeze for a few hours until firm.'
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT steps.step_id, recipes.recipe_id
FROM steps
JOIN recipes ON steps.instruction = 'Transfer the sorbet to an airtight container and freeze for a few hours until firm.'
WHERE recipes.recipe_name = 'Lemon Sorbet';

-- Insert the step with the instruction 'Serve the lemon sorbet in chilled bowls or cones.'
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT steps.step_id, recipes.recipe_id
FROM steps
JOIN recipes ON steps.instruction = 'Serve the lemon sorbet in chilled bowls or cones.'
WHERE recipes.recipe_name = 'Lemon Sorbet';

-- -- Commit the Transaction for Lemon Sorbet Recipe


INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Pumpkin Pie', 'https://www.lemonblossoms.com/wp-content/uploads/2020/09/Pumpkin-Pie-S3.jpg', 'A classic pumpkin pie with a flaky crust.', 8, 'pumpkin, pumpkin spice, desserts, pies, dessert, fall recipes, autumn, fall recipe', true, true);

-- Insert Ingredients for Pumpkin Pie Recipe
INSERT INTO ingredients (ingredient) VALUES ('1 1/2 cups (360g) canned pumpkin puree');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (100g) granulated sugar');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon (2g) ground cinnamon');
INSERT INTO ingredients (ingredient) VALUES ('1/2 teaspoon (1g) ground ginger');
INSERT INTO ingredients (ingredient) VALUES ('1/4 teaspoon (0.5g) ground nutmeg');
INSERT INTO ingredients (ingredient) VALUES ('1/4 teaspoon (0.5g) ground cloves');
INSERT INTO ingredients (ingredient) VALUES ('2 large eggs');
INSERT INTO ingredients (ingredient) VALUES ('1 9-inch (23cm) unbaked pie crust');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (240ml) evaporated milk');

-- Link Ingredients to Pumpkin Pie Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (20, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (21, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (22, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (23, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (24, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (25, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (26, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (27, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (28, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));

-- Insert Steps for Pumpkin Pie Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Preheat your oven to 425*F (220*C).');
INSERT INTO steps (rank, instruction) VALUES (2, 'In a large mixing bowl, combine the pumpkin puree, granulated sugar, ground cinnamon, ground ginger, ground nutmeg, and ground cloves.');
INSERT INTO steps (rank, instruction) VALUES (3, 'In a separate bowl, beat the eggs and add them to the pumpkin mixture. Mix well.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Gradually add the evaporated milk and mix until the filling is smooth.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Pour the pumpkin filling into the unbaked pie crust.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Bake in the preheated oven for 15 minutes, then reduce the oven temperature to 350*F (175*C) and continue baking for 40-50 minutes or until a knife inserted near the center comes out clean.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Allow the pie to cool completely before serving.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Serve with whipped cream or vanilla ice cream.');

-- Link Steps to Pumpkin Pie Recipe
-- Link Steps to Pumpkin Pie Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Preheat your oven to 425*F (220*C).'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);

INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a large mixing bowl, combine the pumpkin puree, granulated sugar, ground cinnamon, ground ginger, ground nutmeg, and ground cloves.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);

INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a separate bowl, beat the eggs and add them to the pumpkin mixture. Mix well.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);

INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Gradually add the evaporated milk and mix until the filling is smooth.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);

INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Pour the pumpkin filling into the unbaked pie crust.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);

INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Bake in the preheated oven for 15 minutes, then reduce the oven temperature to 350*F (175*C) and continue baking for 40-50 minutes or until a knife inserted near the center comes out clean.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);

INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Allow the pie to cool completely before serving.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);

INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Serve with whipped cream or vanilla ice cream.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);



-- Insert Pumpkin Spiced Latte Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Pumpkin Spiced Latte', 'https://www.inspiredtaste.net/wp-content/uploads/2011/11/Pumpkin-Spice-Latte-Recipe-1200.jpg', 'A warm and comforting pumpkin spiced latte.', 1, 'coffee, pumpkin, pumpkin spice, latte, fall recipes, fall, breakfast', true, true);

-- Insert Ingredients for Pumpkin Spiced Latte Recipe
INSERT INTO ingredients (ingredient) VALUES ('1 cup (240ml) brewed coffee');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) pumpkin puree');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) maple syrup');
INSERT INTO ingredients (ingredient) VALUES ('1/2 teaspoon (1g) pumpkin pie spice');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (60ml) milk');
INSERT INTO ingredients (ingredient) VALUES ('Whipped cream, for topping (optional)');
INSERT INTO ingredients (ingredient) VALUES ('Ground cinnamon, for garnish (optional)');

-- Link Ingredients to Pumpkin Spiced Latte Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (29, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (30, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (31, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (32, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (33, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (34, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (35, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));

-- Insert Steps for Pumpkin Spiced Latte Recipe
-- Insert Steps without specifying step_id
INSERT INTO steps (rank, instruction) VALUES (1, 'Brew a strong cup of coffee.');

INSERT INTO steps (rank, instruction) VALUES (2, 'In a small saucepan, heat the pumpkin puree, maple syrup, and pumpkin pie spice over low heat, stirring until well combined.');

INSERT INTO steps (rank, instruction) VALUES (3, 'Add the hot brewed coffee to the pumpkin mixture and stir well.');

INSERT INTO steps (rank, instruction) VALUES (4, 'In a separate saucepan, heat the milk until hot but not boiling.');

INSERT INTO steps (rank, instruction) VALUES (5, 'Froth the hot milk using a milk frother or whisk until it becomes creamy.');

INSERT INTO steps (rank, instruction) VALUES (6, 'Pour the frothed milk into the coffee mixture and stir gently.');

INSERT INTO steps (rank, instruction) VALUES (7, 'If desired, top with whipped cream and a sprinkle of ground cinnamon.');

-- Link Steps to Pumpkin Spiced Latte Recipe-- Link Step 1 to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT step_id, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
FROM steps
WHERE instruction = 'Brew a strong cup of coffee.';

-- Link Step 2 to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT step_id, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
FROM steps
WHERE instruction = 'In a small saucepan, heat the pumpkin puree, maple syrup, and pumpkin pie spice over low heat, stirring until well combined.';

-- Link Step 3 to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT step_id, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
FROM steps
WHERE instruction = 'Add the hot brewed coffee to the pumpkin mixture and stir well.';

-- Link Step 4 to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT step_id, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
FROM steps
WHERE instruction = 'In a separate saucepan, heat the milk until hot but not boiling.';

-- Link Step 5 to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT step_id, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
FROM steps
WHERE instruction = 'Froth the hot milk using a milk frother or whisk until it becomes creamy.';

-- Link Step 6 to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT step_id, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
FROM steps
WHERE instruction = 'Pour the frothed milk into the coffee mixture and stir gently.';

-- Link Step 7 to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id)
SELECT step_id, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
FROM steps
WHERE instruction = 'If desired, top with whipped cream and a sprinkle of ground cinnamon.';



-- Insert French Fries Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES (
  (SELECT user_id FROM users WHERE username = 'jackie'), -- Replace 'jackie' with the actual username
  'French Fries',
  'https://www.fifteenspatulas.com/wp-content/uploads/2011/09/French-Fries-Recipe.jpg', -- Replace with the URL of the image
  'Delicious crispy french fries.',
  2, -- Adjust the serving size as needed
  'french fries, potatoes, snack, snacks, french, potato, vegan, salty', -- Keywords
  false, -- is_featured (if applicable)
  true -- is_published
);

-- Insert Ingredients for French Fries Recipe
-- Replace the ingredient_id and ingredient values with your specific ingredients
INSERT INTO ingredients (ingredient)
VALUES
  ('Potatoes'),
  ('Salt'),
  ('Oil');

-- Link Ingredients to French Fries Recipe
-- Replace recipe_id and ingredient_id values with the appropriate IDs
INSERT INTO ingredients_recipes (ingredient_id, recipe_id)
VALUES
  (36, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (37, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (38, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries'));
-- Insert Steps for French Fries Recipe

-- Step 1
INSERT INTO steps (rank, instruction) VALUES (1, 'Peel and cut the potatoes into thin strips.');

-- Step 2
INSERT INTO steps (rank, instruction) VALUES (2, 'Heat the oil in a deep fryer or large pan to 350*F (175*C).');

-- Step 3
INSERT INTO steps (rank, instruction) VALUES (3, 'Fry the potato strips in batches until golden brown, about 4-5 minutes per batch.');

-- Step 4
INSERT INTO steps (rank, instruction) VALUES (4, 'Remove the fries from the oil and drain on paper towels.');

-- Step 5
INSERT INTO steps (rank, instruction) VALUES (5, 'Sprinkle with salt to taste and serve.');

-- Link Steps to French Fries Recipe

-- Link Step 1
INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Peel and cut the potatoes into thin strips.'), 
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')
);

-- Link Step 2
INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Heat the oil in a deep fryer or large pan to 350*F (175*C).'), 
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')
);

-- Link Step 3
INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Fry the potato strips in batches until golden brown, about 4-5 minutes per batch.'), 
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')
);

-- Link Step 4
INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Remove the fries from the oil and drain on paper towels.'), 
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')
);

-- Link Step 5
INSERT INTO steps_recipes (step_id, recipe_id)
VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Sprinkle with salt to taste and serve.'), 
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')
);



-- Insert Spaghetti Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Spaghetti', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvCnZmiKSCDbCzyXO_l-4euhS0Zj3yYE11Nw&usqp=CAU', 'Classic spaghetti recipe with tomato sauce and meatballs.', 4, 'spaghetti, pasta, Italian, cheese', false, true);

-- Insert Ingredients for Spaghetti Recipe
INSERT INTO ingredients (ingredient) VALUES ('8 oz (225g) spaghetti');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (240ml) tomato sauce');
INSERT INTO ingredients (ingredient) VALUES ('1/2 lb (225g) ground beef');
INSERT INTO ingredients (ingredient) VALUES ('1/2 onion, finely chopped');
INSERT INTO ingredients (ingredient) VALUES ('1 clove garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (60ml) red wine');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (60ml) water');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) olive oil');
INSERT INTO ingredients (ingredient) VALUES ('Salt and pepper to taste');

-- Link Ingredients to Spaghetti Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (39, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (40, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (41, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (42, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (43, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (44, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (45, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (46, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (47, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));

-- Insert Steps for Spaghetti Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Boil a large pot of salted water.');
INSERT INTO steps (rank, instruction) VALUES (2, 'Add the spaghetti to the boiling water and cook until al dente, following package instructions.');
INSERT INTO steps (rank, instruction) VALUES (3, 'In a skillet, heat the olive oil over medium heat. Add the chopped onions and minced garlic, and sauté until fragrant.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Add the ground beef to the skillet and cook until browned, breaking it into small pieces with a spatula.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Pour in the red wine and cook for a few minutes until it reduces.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Stir in the tomato sauce and water. Simmer for about 15 minutes, allowing the flavors to meld.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Season the sauce with salt and pepper to taste.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Serve the cooked spaghetti with the tomato sauce and meatballs on top.');

-- Link Steps to Spaghetti Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Boil a large pot of salted water.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add the spaghetti to the boiling water and cook until al dente, following package instructions.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a skillet, heat the olive oil over medium heat. Add the chopped onions and minced garlic, and sauté until fragrant.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add the ground beef to the skillet and cook until browned, breaking it into small pieces with a spatula.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Pour in the red wine and cook for a few minutes until it reduces.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Stir in the tomato sauce and water. Simmer for about 15 minutes, allowing the flavors to meld.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Season the sauce with salt and pepper to taste.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Serve the cooked spaghetti with the tomato sauce and meatballs on top.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti')
);



-- Insert Baked Salmon Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'andrew'), 'Baked Salmon', 'https://www.wholesomeyum.com/wp-content/uploads/2021/10/wholesomeyum-Baked-Salmon-Recipe-How-To-Cook-Salmon-In-The-Oven-1.jpg', 'A delicious and healthy baked salmon recipe.', 4, 'salmon, seafood, fish, healthy', false, true);

-- Insert Ingredients for Baked Salmon Recipe
INSERT INTO ingredients (ingredient) VALUES ('4 salmon fillets');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) olive oil');
INSERT INTO ingredients (ingredient) VALUES ('2 cloves garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('1 lemon, sliced');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon (2g) dried oregano');
INSERT INTO ingredients (ingredient) VALUES ('Salt and pepper to taste');
INSERT INTO ingredients (ingredient) VALUES ('Fresh parsley, chopped, for garnish (optional)');

-- Link Ingredients to Baked Salmon Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (48, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (49, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (50, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (51, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (52, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (53, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (54, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));

-- Insert Steps for Baked Salmon Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Preheat your oven to 375*F (190*C).');
INSERT INTO steps (rank, instruction) VALUES (2, 'Place the salmon fillets on a baking sheet lined with parchment paper or foil.');
INSERT INTO steps (rank, instruction) VALUES (3, 'In a small bowl, mix the olive oil, minced garlic, and dried oregano.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Brush the olive oil mixture over the salmon fillets.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Season the salmon with salt and pepper to taste.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Place lemon slices on top of each salmon fillet.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Bake in the preheated oven for 15-20 minutes or until the salmon flakes easily with a fork.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Garnish with fresh parsley if desired.');

-- Link Steps to Baked Salmon Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Preheat your oven to 375*F (190*C).'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Place the salmon fillets on a baking sheet lined with parchment paper or foil.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a small bowl, mix the olive oil, minced garlic, and dried oregano.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Brush the olive oil mixture over the salmon fillets.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Season the salmon with salt and pepper to taste.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Place lemon slices on top of each salmon fillet.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Bake in the preheated oven for 15-20 minutes or until the salmon flakes easily with a fork.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Garnish with fresh parsley if desired.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
);





-- Insert Ratatouille Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'andrew'), 'Ratatouille', 'https://cookieandkate.com/images/2019/09/best-ratatouille-recipe-1-1.jpg', 'A classic French vegetable stew bursting with flavors.', 4, 'ratatouille, French cuisine, vegetables, tomato, french, vegan, vegetarian, vegetables, summer, zucchini, marinara', false, true);

-- Insert Ingredients for Ratatouille Recipe
INSERT INTO ingredients (ingredient) VALUES ('1 large eggplant, diced');
INSERT INTO ingredients (ingredient) VALUES ('2 zucchinis, diced');
INSERT INTO ingredients (ingredient) VALUES ('2 red bell peppers, diced');
INSERT INTO ingredients (ingredient) VALUES ('1 large onion, chopped');
INSERT INTO ingredients (ingredient) VALUES ('4 cloves garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('2 cups (480ml) tomato sauce');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon (2g) dried thyme');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon (2g) dried basil');
INSERT INTO ingredients (ingredient) VALUES ('Salt and pepper to taste');
INSERT INTO ingredients (ingredient) VALUES ('Fresh basil leaves, for garnish (optional)');

-- Link Ingredients to Ratatouille Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (55, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (56, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (57, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (58, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (59, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (60, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (61, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (62, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (63, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (64, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));

-- Insert Steps for Ratatouille Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Heat olive oil in a large pot or Dutch oven over medium heat.');
INSERT INTO steps (rank, instruction) VALUES (2, 'Add the chopped onion and garlic, and sauté until they become translucent.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Add the diced eggplant, zucchinis, and red bell peppers to the pot.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Season with dried thyme, dried basil, salt, and pepper. Cook for about 10 minutes, stirring occasionally.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Pour in the tomato sauce and stir to combine. Reduce the heat to low, cover, and simmer for 20-30 minutes, or until the vegetables are tender.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Taste and adjust the seasoning if needed.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Serve the Ratatouille hot, garnished with fresh basil leaves if desired.');

-- Link Steps to Ratatouille Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Heat olive oil in a large pot or Dutch oven over medium heat.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add the chopped onion and garlic, and sauté until they become translucent.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add the diced eggplant, zucchinis, and red bell peppers to the pot.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Season with dried thyme, dried basil, salt, and pepper. Cook for about 10 minutes, stirring occasionally.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Pour in the tomato sauce and stir to combine. Reduce the heat to low, cover, and simmer for 20-30 minutes, or until the vegetables are tender.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Taste and adjust the seasoning if needed.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Serve the Ratatouille hot, garnished with fresh basil leaves if desired.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille')
);




-- Insert Mac and Cheese Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'jackie'), 'Mac and Cheese', 'https://ohsweetbasil.com/wp-content/uploads/southern-macaroni-and-cheese-recipe-6-scaled.jpg', 'Creamy and delicious macaroni and cheese.', 4, 'mac and cheese, cheese, macaroni, pasta, comfort food', false, true);

-- Insert Ingredients for Mac and Cheese Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 cups (200g) elbow macaroni');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (60g) butter');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (30g) all-purpose flour');
INSERT INTO ingredients (ingredient) VALUES ('2 cups (480ml) milk');
INSERT INTO ingredients (ingredient) VALUES ('2 cups (200g) shredded cheddar cheese');
INSERT INTO ingredients (ingredient) VALUES ('Salt and pepper to taste');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (25g) grated Parmesan cheese (optional)');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (25g) bread crumbs (optional)');

-- Link Ingredients to Mac and Cheese Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (65, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (66, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (67, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (68, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (69, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (70, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (71, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (72, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));

-- Insert Steps for Mac and Cheese Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Cook the elbow macaroni according to the package instructions. Drain and set aside.');
INSERT INTO steps (rank, instruction) VALUES (2, 'In a large pot, melt the butter over medium heat.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Stir in the all-purpose flour and cook for about 2 minutes, stirring constantly.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Gradually whisk in the milk and cook until the mixture thickens, stirring constantly.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Stir in the shredded cheddar cheese until smooth and creamy.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Add the cooked macaroni to the cheese sauce and stir until well combined. Season with salt and pepper to taste.');
INSERT INTO steps (rank, instruction) VALUES (7, 'If desired, top with grated Parmesan cheese and bread crumbs for a crunchy topping.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Serve the Mac and Cheese hot and enjoy!');

-- Link Steps to Mac and Cheese Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Cook the elbow macaroni according to the package instructions. Drain and set aside.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a large pot, melt the butter over medium heat.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Stir in the all-purpose flour and cook for about 2 minutes, stirring constantly.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Gradually whisk in the milk and cook until the mixture thickens, stirring constantly.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Stir in the shredded cheddar cheese until smooth and creamy.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add the cooked macaroni to the cheese sauce and stir until well combined. Season with salt and pepper to taste.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'If desired, top with grated Parmesan cheese and bread crumbs for a crunchy topping.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Serve the Mac and Cheese hot and enjoy!'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese')
);



-- Insert Ramen Recipe by User "coyo"
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Ramen', 'https://thecozycook.com/wp-content/uploads/2023/02/Homemade-Ramen-f.jpg', 'A delicious and comforting bowl of homemade ramen.', 2, 'ramen, noodles, fall, winter, japanese, soup', true, true);

-- Insert Ingredients for Ramen Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 packs of ramen noodles');
INSERT INTO ingredients (ingredient) VALUES ('4 cups (960ml) chicken or vegetable broth');
INSERT INTO ingredients (ingredient) VALUES ('2 cloves garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('1 tablespoon (15ml) soy sauce');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon (5g) sesame oil');
INSERT INTO ingredients (ingredient) VALUES ('2 boiled eggs, halved');
INSERT INTO ingredients (ingredient) VALUES ('Sliced green onions, for garnish');
INSERT INTO ingredients (ingredient) VALUES ('Sliced seaweed, for garnish');

-- Link Ingredients to Ramen Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (73, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (74, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (75, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (76, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (77, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (78, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (79, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (80, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));

-- Insert Steps for Ramen Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Boil the ramen noodles according to the package instructions. Drain and set aside.');
INSERT INTO steps (rank, instruction) VALUES (2, 'In a large pot, heat the chicken or vegetable broth over medium heat.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Add minced garlic, soy sauce, and sesame oil to the broth. Stir well.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Divide the cooked ramen noodles into serving bowls.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Pour the hot broth over the noodles in each bowl.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Top each bowl with a boiled egg, sliced green onions, and sliced seaweed.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Serve the homemade Ramen hot and enjoy!');

-- Link Steps to Ramen Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Boil the ramen noodles according to the package instructions. Drain and set aside.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a large pot, heat the chicken or vegetable broth over medium heat.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add minced garlic, soy sauce, and sesame oil to the broth. Stir well.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Divide the cooked ramen noodles into serving bowls.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Pour the hot broth over the noodles in each bowl.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Top each bowl with a boiled egg, sliced green onions, and sliced seaweed.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Serve the homemade Ramen hot and enjoy!'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
);





-- Insert Vegetable Stir-Fry Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Vegetable Stir-Fry', 'https://www.wholesomeyum.com/wp-content/uploads/2020/11/wholesomeyum-how-to-stir-fry-vegetables-vegetable-stir-fry-recipe-list-15.jpg', 'A healthy and flavorful vegetable stir-fry.', 4, 'vegetables, stir-fry, healthy', false, true);

-- Insert Ingredients for Vegetable Stir-Fry Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 cups (240g) broccoli florets');
INSERT INTO ingredients (ingredient) VALUES ('1 red bell pepper, thinly sliced');
INSERT INTO ingredients (ingredient) VALUES ('1 yellow bell pepper, thinly sliced');
INSERT INTO ingredients (ingredient) VALUES ('1 carrot, julienned');
INSERT INTO ingredients (ingredient) VALUES ('1 zucchini, thinly sliced');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (150g) snap peas');
INSERT INTO ingredients (ingredient) VALUES ('3 cloves garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('1 tablespoon (15ml) soy sauce');
INSERT INTO ingredients (ingredient) VALUES ('1 tablespoon (15ml) oyster sauce');
INSERT INTO ingredients (ingredient) VALUES ('1 tablespoon (15ml) vegetable oil');
INSERT INTO ingredients (ingredient) VALUES ('Salt and pepper to taste');

-- Link Ingredients to Vegetable Stir-Fry Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (81, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (82, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (83, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (84, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (85, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (86, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (87, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (88, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (89, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (90, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (91, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
-- Insert Steps for Vegetable Stir-Fry Recipe

-- Insert Steps for Vegetable Stir-Fry Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Heat vegetable oil in a large skillet or wok over medium-high heat.');
INSERT INTO steps (rank, instruction) VALUES (2, 'Add minced garlic and stir-fry for 30 seconds until fragrant.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Add broccoli, red bell pepper, yellow bell pepper, carrot, zucchini, and snap peas to the skillet.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Stir-fry the vegetables for 4-5 minutes until slightly tender but still crisp.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Add soy sauce and oyster sauce. Stir well to combine and cook for an additional 2 minutes.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Season with salt and pepper to your preference.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Remove from heat and transfer the vegetable stir-fry to a serving dish.');

-- Link Steps to Vegetable Stir-Fry Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Heat vegetable oil in a large skillet or wok over medium-high heat.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add minced garlic and stir-fry for 30 seconds until fragrant.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add broccoli, red bell pepper, yellow bell pepper, carrot, zucchini, and snap peas to the skillet.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Stir-fry the vegetables for 4-5 minutes until slightly tender but still crisp.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add soy sauce and oyster sauce. Stir well to combine and cook for an additional 2 minutes.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Season with salt and pepper to your preference.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Remove from heat and transfer the vegetable stir-fry to a serving dish.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry')
);



-- Insert Carbonara Recipe by sefanit
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Classic Carbonara', 'https://www.simplyrecipes.com/thmb/SebeiYFLjCD0TivmMJj_HRUC7zg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Spaghetti-Carbonara-LEAD-6-b3880a6eb49f4158be6f13885c797ded.jpg', 'A classic Italian pasta dish featuring creamy sauce, eggs, pancetta, and cheese.', 2, 'carbonara, pasta, Italian, creamy', false, true);

-- Insert Ingredients for Classic Carbonara Recipe
INSERT INTO ingredients (ingredient) VALUES ('8 ounces (about 225g) spaghetti');
INSERT INTO ingredients (ingredient) VALUES ('2 large eggs');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (about 100g) grated Pecorino Romano cheese');
INSERT INTO ingredients (ingredient) VALUES ('4 ounces (about 100g) pancetta or guanciale, diced');
INSERT INTO ingredients (ingredient) VALUES ('2 cloves garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('Salt and freshly ground black pepper, to taste');
INSERT INTO ingredients (ingredient) VALUES ('Fresh parsley, chopped, for garnish');

-- Link Ingredients to Classic Carbonara Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (92, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (93, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (94, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (95, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (96, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (97, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (98, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));



INSERT INTO steps (rank, instruction) VALUES (1, 'Bring a large pot of salted water to a boil. Add spaghetti and cook until al dente, according to the package instructions. Drain the pasta, reserving a cup of pasta water.');
INSERT INTO steps (rank, instruction) VALUES (2, 'While the pasta is cooking, heat a large skillet over medium heat. Add diced pancetta or guanciale and cook until crispy and golden brown. Remove from heat and place on paper towels to drain excess fat.');
INSERT INTO steps (rank, instruction) VALUES (3, 'In a mixing bowl, whisk together eggs and grated Pecorino Romano cheese until well combined. Season with freshly ground black pepper.');
INSERT INTO steps (rank, instruction) VALUES (4, 'In the same skillet used for the pancetta, add minced garlic and sauté for a minute until fragrant.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Return the cooked pasta to the skillet with garlic. Toss to combine and heat for a minute.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Remove the skillet from heat. Quickly pour the egg and cheese mixture over the pasta, stirring continuously to create a creamy sauce. If needed, add a little reserved pasta water to achieve desired consistency.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Add the crispy pancetta (or guanciale) to the pasta, and gently toss to combine.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Garnish with chopped fresh parsley.');
INSERT INTO steps (rank, instruction) VALUES (9, 'Serve immediately, and enjoy your delicious homemade Carbonara!');

-- Link Steps to Classic Carbonara Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Bring a large pot of salted water to a boil. Add spaghetti and cook until al dente, according to the package instructions. Drain the pasta, reserving a cup of pasta water.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'While the pasta is cooking, heat a large skillet over medium heat. Add diced pancetta or guanciale and cook until crispy and golden brown. Remove from heat and place on paper towels to drain excess fat.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a mixing bowl, whisk together eggs and grated Pecorino Romano cheese until well combined. Season with freshly ground black pepper.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In the same skillet used for the pancetta, add minced garlic and sauté for a minute until fragrant.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Return the cooked pasta to the skillet with garlic. Toss to combine and heat for a minute.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Remove the skillet from heat. Quickly pour the egg and cheese mixture over the pasta, stirring continuously to create a creamy sauce. If needed, add a little reserved pasta water to achieve desired consistency.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add the crispy pancetta (or guanciale) to the pasta, and gently toss to combine.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Garnish with chopped fresh parsley.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Serve immediately, and enjoy your delicious homemade Carbonara!'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara')
);



-- Insert Green Lentil Soup Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Green Lentil Soup', 'https://thishealthykitchen.com/wp-content/uploads/2020/11/lentil-split-pea-soup-4.jpg', 'A hearty and nutritious soup made with green lentils, vegetables, and flavorful spices.', 4, 'lentil soup, vegetarian, healthy', false, true);

-- Insert Ingredients for Green Lentil Soup Recipe
INSERT INTO ingredients (ingredient) VALUES ('1 cup (200g) green lentils, rinsed and drained');
INSERT INTO ingredients (ingredient) VALUES ('1 large onion, chopped');
INSERT INTO ingredients (ingredient) VALUES ('2 carrots, peeled and diced');
INSERT INTO ingredients (ingredient) VALUES ('2 celery stalks, chopped');
INSERT INTO ingredients (ingredient) VALUES ('3 cloves garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('1 bay leaf');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon ground cumin');
INSERT INTO ingredients (ingredient) VALUES ('1/2 teaspoon ground coriander');
INSERT INTO ingredients (ingredient) VALUES ('1/2 teaspoon ground turmeric');
INSERT INTO ingredients (ingredient) VALUES ('1/4 teaspoon paprika');
INSERT INTO ingredients (ingredient) VALUES ('6 cups (1.5 liters) vegetable broth');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons olive oil');
INSERT INTO ingredients (ingredient) VALUES ('Salt and black pepper, to taste');
INSERT INTO ingredients (ingredient) VALUES ('Fresh parsley, chopped, for garnish');
INSERT INTO ingredients (ingredient) VALUES ('Lemon wedges, for serving');

-- Link Ingredients to Green Lentil Soup Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (99, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (100, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (101, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (102, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (103, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (104, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (105, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (106, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (107, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (108, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (109, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (110, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (111, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (112, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (113, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
-- Insert Steps for Green Lentil Soup Recipe
INSERT INTO steps (rank, instruction) VALUES 
(1, 'In a large pot, heat olive oil over medium heat. Add chopped onion, carrots, and celery. Sauté until vegetables begin to soften, about 5 minutes.');

INSERT INTO steps (rank, instruction) VALUES 
(2, 'Add minced garlic, ground cumin, ground coriander, ground turmeric, and paprika. Sauté for another 2 minutes until fragrant.');

INSERT INTO steps (rank, instruction) VALUES 
(3, 'Stir in the rinsed green lentils and bay leaf. Season with salt and black pepper.');

INSERT INTO steps (rank, instruction) VALUES 
(4, 'Pour in the vegetable broth and bring the mixture to a boil. Reduce heat, cover, and simmer for 25-30 minutes or until lentils and vegetables are tender.');

INSERT INTO steps (rank, instruction) VALUES 
(5, 'Remove the bay leaf from the soup. Taste and adjust seasoning as needed.');

INSERT INTO steps (rank, instruction) VALUES 
(6, 'Using an immersion blender, partially puree the soup to create a creamy texture while leaving some chunks of vegetables and lentils.');

INSERT INTO steps (rank, instruction) VALUES 
(7, 'Serve hot, garnished with fresh parsley and lemon wedges for a burst of flavor.');

INSERT INTO steps (rank, instruction) VALUES 
(8, 'Enjoy your delicious homemade Green Lentil Soup!');

-- Link Steps to Green Lentil Soup Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'In a large pot, heat olive oil over medium heat. Add chopped onion, carrots, and celery. Sauté until vegetables begin to soften, about 5 minutes.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Add minced garlic, ground cumin, ground coriander, ground turmeric, and paprika. Sauté for another 2 minutes until fragrant.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Stir in the rinsed green lentils and bay leaf. Season with salt and black pepper.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Pour in the vegetable broth and bring the mixture to a boil. Reduce heat, cover, and simmer for 25-30 minutes or until lentils and vegetables are tender.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Remove the bay leaf from the soup. Taste and adjust seasoning as needed.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Using an immersion blender, partially puree the soup to create a creamy texture while leaving some chunks of vegetables and lentils.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Serve hot, garnished with fresh parsley and lemon wedges for a burst of flavor.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Enjoy your delicious homemade Green Lentil Soup!'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));



-- Insert Greek Salad Wraps Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'jackie'), 'Greek Salad Wraps', 'https://www.onesweetmess.com/wp-content/uploads/2014/04/Greek-Salad-Wrap.jpg', 'A fresh and healthy wrap filled with Greek salad ingredients and drizzled with tzatziki sauce.', 2, 'salad, greek, vegetarian, Greek salad, wraps, healthy', false, true);

-- Insert Ingredients for Greek Salad Wraps Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 large whole-grain tortillas or wraps');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (150g) cherry tomatoes, halved');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cucumber, diced');
INSERT INTO ingredients (ingredient) VALUES ('1/2 red onion, thinly sliced');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (70g) Kalamata olives, pitted and sliced');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (75g) crumbled feta cheese');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (30g) fresh parsley, chopped');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons extra-virgin olive oil');
INSERT INTO ingredients (ingredient) VALUES ('1 tablespoon red wine vinegar');
INSERT INTO ingredients (ingredient) VALUES ('Salt and black pepper, to taste');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (120g) tzatziki sauce');

-- Link Ingredients to Greek Salad Wraps Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (114, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (115, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (116, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (117, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (118, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (119, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (120, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (121, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (122, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (123, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (124, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
-- Insert Steps for Greek Salad Wraps Recipe
INSERT INTO steps (rank, instruction) VALUES 
(1, 'In a large bowl, combine cherry tomatoes, cucumber, red onion, Kalamata olives, crumbled feta cheese, and chopped parsley.');

INSERT INTO steps (rank, instruction) VALUES 
(2, 'In a small bowl, whisk together extra-virgin olive oil and red wine vinegar to make the dressing. Season with salt and black pepper.');

INSERT INTO steps (rank, instruction) VALUES 
(3, 'Pour the dressing over the salad mixture and toss to coat all ingredients evenly.');

INSERT INTO steps (rank, instruction) VALUES 
(4, 'Warm the whole-grain tortillas or wraps in a microwave for a few seconds or in a dry skillet.');

INSERT INTO steps (rank, instruction) VALUES 
(5, 'Place half of the Greek salad mixture onto each tortilla or wrap, leaving some space at the edges.');

INSERT INTO steps (rank, instruction) VALUES 
(6, 'Drizzle tzatziki sauce over the salad mixture.');

INSERT INTO steps (rank, instruction) VALUES 
(7, 'Fold the sides of the tortilla in and roll it up tightly, securing the ends.');

INSERT INTO steps (rank, instruction) VALUES 
(8, 'Cut each wrap in half diagonally to serve.');

INSERT INTO steps (rank, instruction) VALUES 
(9, 'Enjoy your delicious and refreshing Greek Salad Wraps!');

-- Link Steps to Greek Salad Wraps Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'In a large bowl, combine cherry tomatoes, cucumber, red onion, Kalamata olives, crumbled feta cheese, and chopped parsley.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'In a small bowl, whisk together extra-virgin olive oil and red wine vinegar to make the dressing. Season with salt and black pepper.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Pour the dressing over the salad mixture and toss to coat all ingredients evenly.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Warm the whole-grain tortillas or wraps in a microwave for a few seconds or in a dry skillet.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Place half of the Greek salad mixture onto each tortilla or wrap, leaving some space at the edges.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Drizzle tzatziki sauce over the salad mixture.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Fold the sides of the tortilla in and roll it up tightly, securing the ends.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Cut each wrap in half diagonally to serve.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Enjoy your delicious and refreshing Greek Salad Wraps!'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));



-- Insert Vegetarian Spring Rolls Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Vegetarian Spring Rolls', 'https://tastesbetterfromscratch.com/wp-content/uploads/2013/03/Fresh-Spring-Rolls-15.jpg', 'Fresh and crispy vegetarian spring rolls with a flavorful dipping sauce.', 4, 'spring rolls, vegetarian, appetizer, asian, chinese, vegetable, healthy', false, true);

-- Insert Ingredients for Vegetarian Spring Rolls Recipe
INSERT INTO ingredients (ingredient) VALUES ('8 spring roll wrappers');
INSERT INTO ingredients (ingredient) VALUES ('2 cups (200g) shredded lettuce');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (100g) shredded carrots');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (100g) cucumber, thinly sliced');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (50g) bean sprouts');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (50g) fresh mint leaves');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (50g) fresh cilantro leaves');
INSERT INTO ingredients (ingredient) VALUES ('8 rice paper wrappers');
INSERT INTO ingredients (ingredient) VALUES ('Peanut dipping sauce, for serving');

-- Link Ingredients to Vegetarian Spring Rolls Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (125, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (126, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (127, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (128, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (129, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (130, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (131, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (132, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (133, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
-- Insert Steps for Vegetarian Spring Rolls Recipe
INSERT INTO steps (rank, instruction) VALUES 
(1, 'Fill a large bowl with warm water. Dip one rice paper wrapper into the water for a few seconds until it softens.');

INSERT INTO steps (rank, instruction) VALUES 
(2, 'Lay the softened wrapper flat on a clean surface.');

INSERT INTO steps (rank, instruction) VALUES 
(3, 'Place a small amount of shredded lettuce, carrots, cucumber, bean sprouts, fresh mint leaves, and fresh cilantro leaves in the center of the wrapper.');

INSERT INTO steps (rank, instruction) VALUES 
(4, 'Fold the sides of the wrapper over the filling, then roll up tightly from the bottom to enclose the filling, like a burrito.');

INSERT INTO steps (rank, instruction) VALUES 
(5, 'Repeat with the remaining wrappers and filling ingredients.');

INSERT INTO steps (rank, instruction) VALUES 
(6, 'Serve the vegetarian spring rolls with peanut dipping sauce on the side.');

-- Link Steps to Vegetarian Spring Rolls Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Fill a large bowl with warm water. Dip one rice paper wrapper into the water for a few seconds until it softens.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Lay the softened wrapper flat on a clean surface.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Place a small amount of shredded lettuce, carrots, cucumber, bean sprouts, fresh mint leaves, and fresh cilantro leaves in the center of the wrapper.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Fold the sides of the wrapper over the filling, then roll up tightly from the bottom to enclose the filling, like a burrito.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Repeat with the remaining wrappers and filling ingredients.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));

INSERT INTO steps_recipes (step_id, recipe_id) VALUES 
((SELECT step_id FROM steps WHERE instruction = 'Serve the vegetarian spring rolls with peanut dipping sauce on the side.'), 
(SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));


-- Insert Chocolate Cheesecake Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'admin'), 'Chocolate Cheesecake', 'https://www.recipetineats.com/wp-content/uploads/2021/03/Nutella-Cheesecake_2.jpg', 'A rich and creamy chocolate cheesecake with a chocolate cookie crust.', 8, 'chocolate, cheesecake, cake, dessert', false, true);

-- Insert Ingredients for Chocolate Cheesecake Recipe
INSERT INTO ingredients (ingredient) VALUES ('1 1/2 cups (150g) chocolate cookie crumbs');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (60g) unsalted butter, melted');
INSERT INTO ingredients (ingredient) VALUES ('3 cups (675g) cream cheese, softened');
INSERT INTO ingredients (ingredient) VALUES ('1 1/2 cups (300g) granulated sugar');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (60g) unsweetened cocoa powder');
INSERT INTO ingredients (ingredient) VALUES ('4 large eggs');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (240ml) heavy cream');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon vanilla extract');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (90g) semisweet chocolate chips');

-- Link Ingredients to Chocolate Cheesecake Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (134, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (135, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (136, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (137, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (138, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (139, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (140, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (141, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (142, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));

-- Insert Steps for Chocolate Cheesecake Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Preheat your oven to 325*F (160*C).');
INSERT INTO steps (rank, instruction) VALUES (2, 'In a bowl, combine the chocolate cookie crumbs and melted butter. Press this mixture firmly into the bottom of a 9-inch (23cm) springform pan.');
INSERT INTO steps (rank, instruction) VALUES (3, 'In a large bowl, beat the cream cheese until smooth and creamy.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Add granulated sugar and cocoa powder to the cream cheese and beat until well combined.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Add eggs one at a time, mixing well after each addition.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Stir in the heavy cream and vanilla extract.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Pour the cheesecake batter into the prepared crust.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Sprinkle chocolate chips evenly over the top.');
INSERT INTO steps (rank, instruction) VALUES (9, 'Bake in the preheated oven for 45-50 minutes, or until the edges are set but the center is slightly jiggly.');

-- Link Steps to Chocolate Cheesecake Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Preheat your oven to 325*F (160*C).'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a bowl, combine the chocolate cookie crumbs and melted butter. Press this mixture firmly into the bottom of a 9-inch (23cm) springform pan.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a large bowl, beat the cream cheese until smooth and creamy.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add granulated sugar and cocoa powder to the cream cheese and beat until well combined.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add eggs one at a time, mixing well after each addition.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Stir in the heavy cream and vanilla extract.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Pour the cheesecake batter into the prepared crust.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Sprinkle chocolate chips evenly over the top.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Bake in the preheated oven for 45-50 minutes, or until the edges are set but the center is slightly jiggly.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake')
);




-- Insert Peach Cobbler Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Peach Cobbler', 'https://www.the-girl-who-ate-everything.com/wp-content/uploads/2013/06/peach-cobbler-16-scaled.jpg', 'A warm and comforting peach cobbler with a buttery crust and sweet peach filling.', 6, 'peach, cobbler, pie, cake, desserts, fall, autumn, dessert', true, true);

-- Insert Ingredients for Peach Cobbler Recipe
INSERT INTO ingredients (ingredient) VALUES ('4 cups (600g) sliced peaches (fresh or canned)');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (200g) granulated sugar');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (240ml) milk');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (115g) unsalted butter');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (120g) all-purpose flour');
INSERT INTO ingredients (ingredient) VALUES ('2 teaspoons baking powder');
INSERT INTO ingredients (ingredient) VALUES ('1/2 teaspoon salt');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon vanilla extract');
INSERT INTO ingredients (ingredient) VALUES ('Ground cinnamon, for sprinkling (optional)');

-- Link Ingredients to Peach Cobbler Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (143, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (144, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (145, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (146, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (147, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (148, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (149, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (150, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (151, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));

-- Insert Steps for Peach Cobbler Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'Preheat your oven to 350*F (175*C).');
INSERT INTO steps (rank, instruction) VALUES (2, 'In a saucepan, melt the butter over low heat.');
INSERT INTO steps (rank, instruction) VALUES (3, 'In a mixing bowl, combine the flour, sugar, baking powder, and salt.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Stir in the milk and vanilla extract until the batter is smooth.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Pour the melted butter into a 9x13-inch (23x33cm) baking dish.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Pour the batter over the melted butter in the baking dish. Do not stir.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Distribute the sliced peaches evenly over the batter. Do not stir.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Sprinkle ground cinnamon on top if desired.');
INSERT INTO steps (rank, instruction) VALUES (9, 'Bake for 45-50 minutes or until the cobbler is golden brown and bubbling.');

-- Link Steps to Peach Cobbler Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Preheat your oven to 350*F (175*C).'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a saucepan, melt the butter over low heat.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a mixing bowl, combine the flour, sugar, baking powder, and salt.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Stir in the milk and vanilla extract until the batter is smooth.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Pour the melted butter into a 9x13-inch (23x33cm) baking dish.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Pour the batter over the melted butter in the baking dish. Do not stir.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Distribute the sliced peaches evenly over the batter. Do not stir.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Sprinkle ground cinnamon on top if desired.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Bake for 45-50 minutes or until the cobbler is golden brown and bubbling.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler')
);




-- Insert French Toast Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'admin'), 'French Toast', 'https://hips.hearstapps.com/hmg-prod/images/how-to-make-french-toast-1589827448.jpg?crop=0.734xw:0.490xh;0.0897xw,0.323xh&resize=1200:*', 'Classic French toast made with thick slices of bread dipped in a sweet and custardy mixture.', 2, 'French toast, breakfast, brunch, french, bread', true, true);

-- Insert Ingredients for French Toast Recipe
INSERT INTO ingredients (ingredient) VALUES ('4 slices of thick bread (such as brioche or challah)');
INSERT INTO ingredients (ingredient) VALUES ('2 large eggs');
INSERT INTO ingredients (ingredient) VALUES ('1/2 cup (120ml) milk');
INSERT INTO ingredients (ingredient) VALUES ('1/2 teaspoon vanilla extract');
INSERT INTO ingredients (ingredient) VALUES ('1/4 teaspoon ground cinnamon (optional)');
INSERT INTO ingredients (ingredient) VALUES ('Pinch of salt');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30g) unsalted butter');
INSERT INTO ingredients (ingredient) VALUES ('Maple syrup, for serving');
INSERT INTO ingredients (ingredient) VALUES ('Fresh berries, for garnish (optional)');

-- Link Ingredients to French Toast Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (152, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (153, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (154, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (155, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (156, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (157, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (158, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (159, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (160, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
-- Insert Steps for French Toast Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'In a shallow bowl, whisk together eggs, milk, vanilla extract, ground cinnamon (if using), and a pinch of salt.');
INSERT INTO steps (rank, instruction) VALUES (2, 'Heat a non-stick skillet or griddle over medium-high heat and add 1 tablespoon of butter to melt.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Dip each slice of bread into the egg mixture, allowing it to soak for a few seconds on each side.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Place the dipped bread slices onto the hot skillet or griddle.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Cook until both sides are golden brown and crisp, about 3-4 minutes per side.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Remove the French toast from the skillet and keep warm.');
INSERT INTO steps (rank, instruction) VALUES (7, 'Repeat with the remaining slices of bread, adding more butter to the skillet as needed.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Serve the French toast hot with maple syrup and fresh berries, if desired.');

-- Link Steps to French Toast Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a shallow bowl, whisk together eggs, milk, vanilla extract, ground cinnamon (if using), and a pinch of salt.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Heat a non-stick skillet or griddle over medium-high heat and add 1 tablespoon of butter to melt.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Dip each slice of bread into the egg mixture, allowing it to soak for a few seconds on each side.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Place the dipped bread slices onto the hot skillet or griddle.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Cook until both sides are golden brown and crisp, about 3-4 minutes per side.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Remove the French toast from the skillet and keep warm.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Repeat with the remaining slices of bread, adding more butter to the skillet as needed.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Serve the French toast hot with maple syrup and fresh berries, if desired.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast')
);




-- Insert Sugar Cookies Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Sugar Cookies', 'https://tatertotsandjello.com/wp-content/uploads/2020/10/IMG_0351-1.jpg', 'Classic sugar cookies with a hint of vanilla, perfect for decorating with icing or sprinkles.', 24, 'sugar cookie, sweets, halloween, cookies, dessert, baking', true, true);

-- Insert Ingredients for Sugar Cookies Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 3/4 cups (345g) all-purpose flour');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon baking soda');
INSERT INTO ingredients (ingredient) VALUES ('1/2 teaspoon baking powder');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (226g) unsalted butter, softened');
INSERT INTO ingredients (ingredient) VALUES ('1 1/2 cups (300g) granulated sugar');
INSERT INTO ingredients (ingredient) VALUES ('1 large egg');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon vanilla extract');
INSERT INTO ingredients (ingredient) VALUES ('3-4 tablespoons milk');
INSERT INTO ingredients (ingredient) VALUES ('Sprinkles or icing (optional)');

-- Link Ingredients to Sugar Cookies Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (161, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (162, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (163, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (164, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (165, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (166, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (167, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (168, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (169, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies'));
-- Insert Steps for Sugar Cookies Recipe
INSERT INTO steps (rank, instruction) VALUES (1, 'In a medium-sized bowl, whisk together the flour, baking soda, and baking powder. Set aside.');
INSERT INTO steps (rank, instruction) VALUES (2, 'In a large mixing bowl, cream together the softened butter and granulated sugar until light and fluffy.');
INSERT INTO steps (rank, instruction) VALUES (3, 'Add the egg and vanilla extract to the butter-sugar mixture, and beat until well combined.');
INSERT INTO steps (rank, instruction) VALUES (4, 'Gradually add the dry ingredients to the wet ingredients, mixing until a dough forms. If the dough is too dry, add 3-4 tablespoons of milk to achieve the right consistency.');
INSERT INTO steps (rank, instruction) VALUES (5, 'Divide the dough into two equal portions, shape each into a disk, wrap them in plastic wrap, and refrigerate for at least 1 hour or until firm.');
INSERT INTO steps (rank, instruction) VALUES (6, 'Preheat your oven to 350*F (180*C) and line baking sheets with parchment paper.');
INSERT INTO steps (rank, instruction) VALUES (7, 'On a floured surface, roll out one of the dough disks to about 1/4 inch (0.6 cm) thickness. Use cookie cutters to cut out shapes, and transfer them to the prepared baking sheets.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Bake in the preheated oven for 8-10 minutes or until the edges are just beginning to turn golden.');
INSERT INTO steps (rank, instruction) VALUES (9, 'Allow the cookies to cool on the baking sheets for a few minutes before transferring them to wire racks to cool completely.');
INSERT INTO steps (rank, instruction) VALUES (10, 'Once the cookies are completely cooled, you can decorate them with icing, sprinkles, or any other toppings of your choice.');

-- Link Steps to Sugar Cookies Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a medium-sized bowl, whisk together the flour, baking soda, and baking powder. Set aside.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'In a large mixing bowl, cream together the softened butter and granulated sugar until light and fluffy.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Add the egg and vanilla extract to the butter-sugar mixture, and beat until well combined.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Gradually add the dry ingredients to the wet ingredients, mixing until a dough forms. If the dough is too dry, add 3-4 tablespoons of milk to achieve the right consistency.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Divide the dough into two equal portions, shape each into a disk, wrap them in plastic wrap, and refrigerate for at least 1 hour or until firm.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Preheat your oven to 350*F (180*C) and line baking sheets with parchment paper.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'On a floured surface, roll out one of the dough disks to about 1/4 inch (0.6 cm) thickness. Use cookie cutters to cut out shapes, and transfer them to the prepared baking sheets.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Bake in the preheated oven for 8-10 minutes or until the edges are just beginning to turn golden.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Allow the cookies to cool on the baking sheets for a few minutes before transferring them to wire racks to cool completely.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO steps_recipes (step_id, recipe_id) VALUES (
  (SELECT step_id FROM steps WHERE instruction = 'Once the cookies are completely cooled, you can decorate them with icing, sprinkles, or any other toppings of your choice.'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Sugar Cookies')
);

INSERT INTO recipes_tags (recipe_id, tag_id) values (1, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (2, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (2, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (2, 5);
INSERT INTO recipes_tags (recipe_id, tag_id) values (2, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (2, 10);
INSERT INTO recipes_tags (recipe_id, tag_id) values (3, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (3, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (3, 5);
INSERT INTO recipes_tags (recipe_id, tag_id) values (3, 7);
INSERT INTO recipes_tags (recipe_id, tag_id) values (3, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (4, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (4, 2);
INSERT INTO recipes_tags (recipe_id, tag_id) values (4, 3);
INSERT INTO recipes_tags (recipe_id, tag_id) values (4, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (5, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (5, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (5, 5);
INSERT INTO recipes_tags (recipe_id, tag_id) values (6, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (6, 3);
INSERT INTO recipes_tags (recipe_id, tag_id) values (6, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (7, 3);
INSERT INTO recipes_tags (recipe_id, tag_id) values (8, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (8, 5);
INSERT INTO recipes_tags (recipe_id, tag_id) values (8, 6);
INSERT INTO recipes_tags (recipe_id, tag_id) values (8, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (8, 9);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 2);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 3);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 5);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 6);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 7);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 9);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 10);
INSERT INTO recipes_tags (recipe_id, tag_id) values (9, 10);
INSERT INTO recipes_tags (recipe_id, tag_id) values (10, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (11, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (11, 2);
INSERT INTO recipes_tags (recipe_id, tag_id) values (11, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (12, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (12, 2);
INSERT INTO recipes_tags (recipe_id, tag_id) values (12, 6);
INSERT INTO recipes_tags (recipe_id, tag_id) values (12, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (12, 9);
INSERT INTO recipes_tags (recipe_id, tag_id) values (13, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (14, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (14, 2);
INSERT INTO recipes_tags (recipe_id, tag_id) values (14, 3);
INSERT INTO recipes_tags (recipe_id, tag_id) values (14, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (14, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (14, 9);
INSERT INTO recipes_tags (recipe_id, tag_id) values (15, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (15, 5);
INSERT INTO recipes_tags (recipe_id, tag_id) values (15, 7);
INSERT INTO recipes_tags (recipe_id, tag_id) values (15, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 2);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 3);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 4);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 5);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 6);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 7);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 8);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 9);
INSERT INTO recipes_tags (recipe_id, tag_id) values (16, 10);
INSERT INTO recipes_tags (recipe_id, tag_id) values (17, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (18, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (19, 1);
INSERT INTO recipes_tags (recipe_id, tag_id) values (20, 1);

COMMIT TRANSACTION;




