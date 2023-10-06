package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Ingredient;
import com.techelevator.model.Recipe;
import com.techelevator.model.Tag;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRecipeDao implements RecipeDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcRecipeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Recipe> getListOfRecipes() {                //Displayed on Explore Recipes page (whole "library" of recipes)
        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;
    }

    @Override
    public Recipe getRecipeByRecipeId(int recipe_id) {

        Recipe recipe = null;
        String sql = "SELECT * from recipes where recipe_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipe_id);
            if (results.next()) {
                recipe = mapRowToRecipe(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }

        return recipe;

    }

    @Override
    public List<Recipe> getListOfRecipeByTagId(int tag_id) {

        List<Recipe> recipes = new ArrayList<>();

        String sql = "SELECT * from recipes " +
                "join recipes_tags on recipes.recipe_id = recipes_tags.recipe_id " +
                "join tags on recipes_tags.tag_id = tags.tag_id " +
                "where tags.tag_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, tag_id);
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;

    }

    @Override
    public List<Recipe> getFeaturedRecipesByRecipeId() {           //Display Top3-Featured Recipes
        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes where is_featured = true";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;

    }

    @Override
    public Recipe setFeaturedRecipe(Recipe recipe, Boolean isFeatured, Principal principal){

        Recipe updatedRecipe = null;

        String sql = "UPDATE recipes " +
                "SET is_featured = ? " +
                "WHERE recipe_id = ?;";
        try {
            int rowsAffected = jdbcTemplate.update(sql, isFeatured, recipe.getRecipeId());
            if (rowsAffected == 0) {
                throw new DaoException("Zero rows affected, expected at least one");
            }
            updatedRecipe = getRecipeByRecipeId(recipe.getRecipeId());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }

        return updatedRecipe;
    }

    @Override
    public Recipe setFavoriteRecipe(Recipe recipe, Principal principal){

        Recipe updatedRecipe = null;

        String sql =
                "UPDATE users_recipes " +
                "SET favorite = ? " +
                "WHERE recipe_id = ?;";
        try {
            int rowsAffected = jdbcTemplate.update(sql, recipe.isFavorite(), recipe.getRecipeId());
            if (rowsAffected == 0) {
                throw new DaoException("Zero rows affected, expected at least one");
            }
            updatedRecipe = getRecipeByRecipeId(recipe.getRecipeId());
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }

        return updatedRecipe;
    }

    @Override
    public List<Recipe> getRecipesByKeyWords(String keywords) {           //Display Recipes from user input keywords

        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes where keywords ILIKE ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, '%'+keywords+'%');
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;

    }

    @Override
    public List<Recipe> getRecipesByIngredient(String ingredient) {

        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes " +
                "join ingredients_recipes on recipes.recipe_id = ingredients_recipes.recipe_id " +
                "join ingredients on ingredients_recipes.ingredient_id = ingredients.ingredient_id " +
                "where ingredient ILIKE ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, '%'+ingredient+'%');
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;
    }

    @Override
    public Integer createRecipe(Recipe recipe, int userId) {

        String sql_create_recipe = "INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_published, is_featured) " +
                "VALUES (?,?,?,?,?,?,?,?) " +
                "RETURNING recipe_id;";
        Integer recipeId = 0;
        try {
            recipeId = jdbcTemplate.queryForObject(sql_create_recipe, Integer.class, userId, recipe.getRecipeName(), recipe.getImgUrl(), recipe.getDescription(), recipe.getServingSize(), recipe.getKeywords(), recipe.isPublished(), recipe.isFeatured());
        } catch (DataAccessException e){
            throw new DataAccessException(e.toString()) {};
        }
        return recipeId;
    }

    @Override
    public int deleteRecipeByRecipeId(int recipe_id){                         //delete by recipeId
        int numberOfRows = 0;
        String sql = "DELETE FROM recipes WHERE recipe_id = ?";
        try {
            numberOfRows = jdbcTemplate.update(sql, recipe_id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return numberOfRows;
    }

    @Override
    public String getCreatorUsernameByRecipeId(int recipeId) {
        String sql = "SELECT username FROM users " +
                     "JOIN recipes ON users.user_id = recipes.creator_id " +
                     "WHERE recipe_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipeId);
        if (results.next()) {
            return results.getString("username");
        } else {
            return null;
        }
    }

    @Override
    public void updateRecipe(int recipeId, Recipe recipe, Principal principal) {
        String sql =
                "UPDATE recipes " +
                "SET recipe_name = ? , image_url = ? , description = ? , serving_size = ? , keywords = ? , is_published = ? ,  is_featured = ? " +
                "WHERE recipe_id = ? ";
        try {
            jdbcTemplate.update(sql, recipe.getRecipeName(), recipe.getImgUrl(), recipe.getDescription(), recipe.getServingSize(), recipe.getKeywords(), recipe.isPublished(), recipe.isFeatured(), recipeId);

        } catch (DataAccessException e){
            throw new DataAccessException("Error Updating") {};
        }
    }

    private Recipe mapRowToRecipe(SqlRowSet rs) {
        Recipe recipe = new Recipe();
        recipe.setRecipeId(rs.getInt("recipe_id"));
        recipe.setCreatorId(rs.getInt("creator_id"));
        recipe.setRecipeName(rs.getString("recipe_name"));
        recipe.setImgUrl(rs.getString("image_url"));
        recipe.setDescription(rs.getString("description"));
        recipe.setServingSize(rs.getDouble("serving_size"));
        recipe.setKeywords(rs.getString("keywords"));
        recipe.setPublished(rs.getBoolean("is_published"));
        recipe.setFeatured(rs.getBoolean("is_featured"));

        return recipe;
    }


}
