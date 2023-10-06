BEGIN TRANSACTION;

-- SAGE(ALPHA) Default Database

-- Essential Primary Tables
-- Users Table
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
	user_id SERIAL,
	username varchar (50) NOT NULL UNIQUE,
	password_hash varchar (200) NOT NULL,
	role varchar (50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);
-- Recipes Table
DROP TABLE IF EXISTS recipes CASCADE;
CREATE TABLE recipes (
    recipe_id SERIAL,
    creator_id int,
    recipe_name varchar (63) NOT NULL,
    image_url text,
    description text,
    serving_size double precision,
    keywords text,
    is_published boolean,
    is_featured boolean,
    CONSTRAINT PK_recipe PRIMARY KEY (recipe_id)
);
-- Ingredients Table
DROP TABLE IF EXISTS ingredients CASCADE;
CREATE TABLE ingredients (
    ingredient_id SERIAL,
    ingredient text,
    CONSTRAINT PK_ingredient PRIMARY KEY (ingredient_id)
);
-- Steps Table
DROP TABLE IF EXISTS steps CASCADE;
CREATE TABLE steps (
    step_id SERIAL,
    rank int,
    instruction text,
    CONSTRAINT PK_steps PRIMARY KEY (step_id)
);
-- Meals Table
DROP TABLE IF EXISTS meals CASCADE;
CREATE TABLE meals (
    meal_id SERIAL,
    meal_name varchar (63),
    meal_description text,
    meal_date date,
    CONSTRAINT PK_meals PRIMARY KEY (meal_id)
);
-- Tags Table
DROP TABLE IF EXISTS tags CASCADE;
CREATE TABLE tags (
    tag_id SERIAL,
    tag text,
    CONSTRAINT PK_meals_Tag PRIMARY KEY (tag_id)
);

-- Essential Joined Table
-- Joining users on recipes
DROP TABLE IF EXISTS users_recipes CASCADE;
CREATE TABLE users_recipes (
    user_id int NOT NULL,
    recipe_id int NOT NULL
);
-- ALTER TABLE users_recipes
--     ADD CONSTRAINT "fk_user_id"
--     FOREIGN KEY (user_id)
--     REFERENCES users (user_id);
-- ALTER TABLE users_recipes
--     ADD CONSTRAINT "fk_recipe_id"
--     FOREIGN KEY (recipe_id)
--     REFERENCES recipes (recipe_id);

-- Joining users on recipes
DROP TABLE IF EXISTS recipes_tags CASCADE;
CREATE TABLE recipes_tags (
    tag_id int NOT NULL,
    recipe_id int NOT NULL
);
-- ALTER TABLE recipes_tags
--     ADD CONSTRAINT "fk_tags_recipes_id"
--     FOREIGN KEY (tag_id)
--     REFERENCES tags (tag_id);
-- ALTER TABLE recipes_tags
--     ADD CONSTRAINT "fk_recipes_tags_id"
--     FOREIGN KEY (recipe_id)
--     REFERENCES recipes (recipe_id);

-- Joining steps on recipes
DROP TABLE IF EXISTS steps_recipes CASCADE;
CREATE TABLE steps_recipes (
    step_id int NOT NULL,
    recipe_id int NOT NULL
);
-- ALTER TABLE steps_recipes
--     ADD CONSTRAINT "fk_step_id"
--     FOREIGN KEY (step_id)
--     REFERENCES steps (step_id);
-- ALTER TABLE steps_recipes
--     ADD CONSTRAINT "fk_steps_recipe_id"
--     FOREIGN KEY (recipe_id)
--     REFERENCES recipes (recipe_id);

-- Joining ingredients on recipes
DROP TABLE IF EXISTS ingredients_recipes CASCADE;
CREATE TABLE ingredients_recipes (
   ingredient_id int NOT NULL,
   recipe_id int NOT NULL
);
-- ALTER TABLE ingredients_recipes
--     ADD CONSTRAINT "fk_ingredient_id"
--     FOREIGN KEY (ingredient_id)
--     REFERENCES ingredients (ingredient_id);
-- ALTER TABLE ingredients_recipes
--     ADD CONSTRAINT "fk_ingredients_recipe_id"
--     FOREIGN KEY (recipe_id)
--     REFERENCES recipes (recipe_id);

-- Joining meals on recipes
DROP TABLE IF EXISTS meals_recipes CASCADE;
CREATE TABLE meals_recipes (
    meal_id int NOT NULL,
    recipe_id int NOT NULL
);
ALTER TABLE meals_recipes
    ADD CONSTRAINT "fk_meals_recipes_to_meals_id"
    FOREIGN KEY (meal_id)
    REFERENCES meals (meal_id);
ALTER TABLE meals_recipes
    ADD CONSTRAINT "fk_recipes_meals_recipes"
    FOREIGN KEY (recipe_id)
    REFERENCES recipes (recipe_id);

-- Joining users on recipes
DROP TABLE IF EXISTS users_meals CASCADE;
CREATE TABLE users_meals (
    user_id int NOT NULL,
    meal_id int NOT NULL
);
ALTER TABLE users_meals
    ADD CONSTRAINT "fk_users_meals_to_users_id"
    FOREIGN KEY (user_id)
    REFERENCES users (user_id);
ALTER TABLE users_meals
    ADD CONSTRAINT "fk_users_meals_to_meals_id"
    FOREIGN KEY (meal_id)
    REFERENCES meals (meal_id);

-- Joining users on recipes
DROP TABLE IF EXISTS users_ingredients CASCADE;
CREATE TABLE users_ingredients (
    user_id int NOT NULL,
    ingredient_id int NOT NULL,
    recipe_id int NOT NULL,
    is_completed boolean
);
-- ALTER TABLE users_ingredients
--     ADD CONSTRAINT "fk_user_ingredients_id"
--     FOREIGN KEY (user_id)
--     REFERENCES users (user_id);
-- ALTER TABLE users_ingredients
--     ADD CONSTRAINT "fk_ingredients_user_id"
--     FOREIGN KEY (ingredient_id)
--     REFERENCES ingredients (ingredient_id);
-- ALTER TABLE users_ingredients
--     ADD CONSTRAINT "fk_user_ingredients_recipes_id"
--     FOREIGN KEY (recipe_id)
--     REFERENCES recipes (recipe_id);

COMMIT TRANSACTION;
