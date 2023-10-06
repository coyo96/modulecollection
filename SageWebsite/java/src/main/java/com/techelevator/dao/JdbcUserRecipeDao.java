package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Recipe;
import com.techelevator.model.UserRecipe;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcUserRecipeDao implements UserRecipeDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcUserRecipeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

//    @Override
//    public List<UserRecipe> getListOfUsersRecipes() {                //All Recipes in user's "library"
//        List<UserRecipe> userRecipes = new ArrayList<>();
//        String sql = "select * from recipes";                        //??????????????????
//
//        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
//        while (results.next()) {
//            UserRecipe userRecipe = mapRowToUserRecipe(results);
//            userRecipes.add(userRecipe);
//        }
//
//        return userRecipes;
//    }

//    @Override
//    public Recipe createRecipe(String title, String description, double serving_size) {
//        Recipe recipe = null;
//
//        String sql = "INSERT INTO recipes (title, description, serving_size) " +
//                "VALUES (?,?,?) RETURNING recipe_id ;";
//
////TODO: TO UPDATE INGREDIENT & STEPS TABLES
//
//        try {
//
//            int id = jdbcTemplate.queryForObject(sql, int.class,
//                    recipe.getRecipeName(), recipe.getRecipeDescription(), recipe.getServingSize());
//
//            return getRecipe(id);
//
//
//        } catch (CannotGetJdbcConnectionException e) {
//            throw new DaoException("Unable to connect to server or database", e);
//        } catch (DataIntegrityViolationException e) {
//            throw new DaoException ("Data integrity violation", e);
//        }
//    }
//
////TODO: CREATE 'COPYRECIPE' METHOD
////    @Override
////    public Recipe copyRecipe(String title, String description, double serving_size) {
////
////    }
//
//    private UserRecipe mapRowToUserRecipe(SqlRowSet rs) {
//        UserRecipe userRecipe = new UserRecipe();
//        userRecipe.setCookBook(rs.get("list_of_users_recipes"));
//        userRecipe.setGroceryItems(rs.get("list_of_users_ingredients"));
//        userRecipe.setProfileUrl(rs.getString("profile_url"));
//        return userRecipe;
//    }

}
