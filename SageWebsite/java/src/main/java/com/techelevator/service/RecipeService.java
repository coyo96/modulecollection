package com.techelevator.service;

import com.techelevator.dao.*;
import com.techelevator.model.Ingredient;
import com.techelevator.model.Recipe;
import com.techelevator.model.Step;
import com.techelevator.model.Tag;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
@Service
public class RecipeService {
//SERVICE CLASS IS THE MIDDLEMAN TO KEEP DAO (BUSINESS LOGIC) AND CONTROLLER (DIRECTS TRAFFIC) CLASSES CLEAN

    private RecipeDao recipeDao;

    private RecipeImportService recipeImportService;

    private IngredientDao ingredientDao;

    private TagDao tagDao;

    private StepDao stepDao;
    private UserDao userDao;

    public RecipeService(RecipeDao recipeDao, RecipeImportService recipeImportService, TagDao tagDao, IngredientDao ingredientDao, StepDao stepDao, UserDao userDao) {
        this.recipeDao = recipeDao;
        this.recipeImportService = recipeImportService;
        this.tagDao = tagDao;
        this.ingredientDao = ingredientDao;
        this.stepDao = stepDao;
        this.userDao = userDao;
    }

    public Recipe importRecipe(String url) {
        return recipeImportService.importFromUrl(url);
    }

    public List<Recipe> getRecipesByIngredient (String ingredient) {
        List<Recipe> recipes = recipeDao.getRecipesByIngredient(ingredient);
        return recipes;
    }

    public Recipe getRecipe(int recipe_id) {
        Recipe recipe = recipeDao.getRecipeByRecipeId(recipe_id);       //get recipe by recipeId

        List<Tag> tags = tagDao.getTagsByRecipeId(recipe_id);        //then get that recipe's tags now...
        recipe.setTags(tags);

        List<Ingredient> ingredients = ingredientDao.getListOfIngredientsByRecipeId(recipe_id);     //then get that recipe's ingredients now..
        recipe.setIngredients(ingredients);

        List<Step> steps = stepDao.getListOfStepsByRecipeId(recipe_id);     //then get that recipe's steps now...
        recipe.setSteps(steps);

        return recipe;
    }

    public List<Recipe> getRecipesByTagId(int tagId) {
        List<Recipe> recipes = recipeDao.getListOfRecipeByTagId(tagId);

//        Tag tag = tagDao.getTagByTagId(tagId);
//
//        List<Ingredient> ingredients = ingredientDao.getListOfIngredientByTagId(tagId);
//        recipe.setIngredients(ingredients);
//
//        List<Step> steps = stepDao.getStepsByTagId(tagId);
//        recipe.setSteps(steps);

        return recipes;
    }

    public Integer createRecipe(Recipe recipe, Principal principal) {       //more inputs to account for steps/ingredients/etc?
        int userId = userDao.findIdByUsername(principal.getName());

        int recipeId = recipeDao.createRecipe(recipe, userId);

        //add the user selected tags and make new rows to recipes_tags table for this new recipe
        if(recipe.getTags() != null) {
            for (Tag tag : recipe.getTags()) {
                int tagId = tagDao.createRecipesTagsRowForNewRecipe(tag, recipeId);
            }
        }

        if(recipe.getIngredients() != null) {
            for (Ingredient ingredient : recipe.getIngredients()) {
                int ingredientId = ingredientDao.createIngredientForRecipe(ingredient, recipeId);
            }
        }

        //add new rows to steps table for this new recipe
        if(recipe.getSteps() != null) {
            for(Step step: recipe.getSteps()) {
                int stepId = stepDao.createStepForRecipe(step, recipeId);
            }
        }

        return recipeId;

    }

    // Get the Creator Username by Recipe Id
    public String getCreatorUsernameByRecipeId(int recipeId) {
        return recipeDao.getCreatorUsernameByRecipeId(recipeId);
    }

    // Update the Recipe
    public void updateRecipe(int recipeId, Recipe recipe, Principal principal) {
        recipeDao.updateRecipe(recipeId, recipe, principal);
    }
}
