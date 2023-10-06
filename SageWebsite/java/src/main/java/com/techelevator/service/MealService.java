package com.techelevator.service;

import com.techelevator.dao.MealDao;
import com.techelevator.dao.RecipeDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
public class MealService {
    private final MealDao mealDao;
    private final RecipeDao recipeDao;
    private final UserDao userDao;
    public MealService(MealDao mealDao, RecipeDao recipeDao, UserDao userDao){
        this.mealDao = mealDao;
        this.recipeDao = recipeDao;
        this.userDao = userDao;
    }

    public List<Meal> getListOfMeals(Principal principal) {
        List<Meal> meals = new ArrayList<>();
        int userId = userDao.findIdByUsername(principal.getName());
        meals = mealDao.getListOfMeals(userId);
        for (Meal meal : meals) {
            List<Recipe> recipes = new ArrayList<>();
            int mealId = meal.getMealId();

            List<Integer> recipeList = new ArrayList<>();
            for (Recipe recipe : recipes) {
                Recipe newRecipe;
                newRecipe = recipeDao.getRecipeByRecipeId(recipe.getRecipeId());
                recipes.add(newRecipe);
            }
            meal.setMealRecipes(recipes);
        }
        // Return all the meals that have recipes
        return meals;
    }

    public Meal getMealById(int mealId) {
        return mealDao.getMealById(mealId);
    }

    public int createMeal(Meal meal, Principal principal) {
        int userId = userDao.findIdByUsername(principal.getName());
        return mealDao.createMeal(meal, userId);
    }

    public int editMeal(int mealId, Meal meal, Principal principal) {
        return mealDao.editMeal(mealId, meal, principal);
    }

    public void deleteMeal(int mealId, Principal principal) {
        mealDao.deleteMeal(mealId, principal);
    }

}
